package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class ProductDAO {
   Connection conn;
   PreparedStatement pstmt;

   // 할인 상품 보기
    final String SELECTALL_SALE = "SELECT * FROM PRODUCT WHERE NOT P_SALE =0 ";  
   
   // 최신 상품 보기 -사용안함
   // final String SELECTALL_LASTEST = "SELECT * FROM PRODUCT WHERE ROWNUM <=?
   // ORDER BY P_NUM DESC";
   
    // 상품 상세 정보
   final String SELECTONE = "SELECT * FROM PRODUCT WHERE P_NUM = ?";// AND P_STATUS = '판매중'

   // 할인율
   final String UPDATE_PRICE = "UPDATE PRODUCT SET P_PRICE = ? WHERE P_NUM = ?";
   // 상품 정보 변경
   final String UPDATE = "UPDATE PRODUCT SET P_CATEGORY = ?,P_NAME = ?, P_PRICE = ?, P_CNT = ?, P_IMG = ?, P_INFO = ?, P_INFOIMG = ?, P_SALE = ?, P_STATUS = ? WHERE P_NUM = ?";
   // 구매시 재고 삭감
   final String UPDATE_BUY_CNT = "UPDATE PRODUCT SET P_CNT = P_CNT-? WHERE P_NUM = ?";
   // 상품 추가
   final String INSERT = "INSERT INTO PRODUCT VALUES(emp_seq.NEXTVAL, '판매중', ?,?,?,?,?,?,?,?)";
   // 상품 삭제
   final String DELETE = "DELETE FROM PRODUCT WHERE P_NUM = ?";

   // 상품전체목록(페이징)
   final String SELECTALL_PRODUCT = "SELECT * FROM (" + "SELECT * FROM ("
         + "SELECT ROWNUM row_num, PRODUCT.* FROM PRODUCT" + ") WHERE row_num >= ?" + ") WHERE row_num <= ?";
   // 상품전체개수
   final String SELECT_PRODUCT_COUNT = "SELECT COUNT(*) AS COUNT FROM PRODUCT";

   // 상품 카테고리별 목록 출력
   final String SELECTALL_CATEGORY = "SELECT * FROM (" + "SELECT * FROM ("
         + "SELECT ROWNUM row_num, PRODUCT.* FROM PRODUCT WHERE P_CATEGORY = ?" + ") WHERE row_num >= ?"
         + ") WHERE row_num <= ?";

   // 상품 카테고리별 전체개수
   final String SELECT_CATEGORY_COUNT = "SELECT COUNT(*) AS COUNT FROM PRODUCT WHERE P_CATEGORY = ?";

   // 상품 이름으로 검색
   final String SELECTALL_SEARCH = "SELECT * FROM (" + "SELECT * FROM ("
         + "SELECT ROWNUM row_num, PRODUCT.* FROM PRODUCT WHERE P_NAME LIKE '%'||?||'%'" + ") WHERE row_num >= ?"
         + ") WHERE row_num <= ?";
   // 상품 이름검색별 전체개수
   final String SELECT_NAME_COUNT = "SELECT COUNT(*) AS COUNT FROM PRODUCT WHERE P_NAME LIKE '%'||?||'%'";

   
   //insert 상품추가
   public boolean insert(ProductVO pvo) {
      conn = JDBCUtil.connect();
      try {
         int sale = 0;
         if (pvo.getProductSale() == 0) {
            sale = pvo.getProductPrice();
         } else {
            sale = sale(pvo);
            // sale = (pvo.getProductPrice()) - ((pvo.getProductPrice()) *
            // ((pvo.getProductSale()) / 100));
         }
         pstmt = conn.prepareStatement(INSERT);
         pstmt.setString(1, pvo.getProductCategory());
         pstmt.setString(2, pvo.getProductName());
         pstmt.setInt(3, sale);
         // pstmt.setInt(4, pvo.getProductCnt()); 
         pstmt.setInt(4, 5);   //상품들의 재고는 5개로 세팅
         pstmt.setString(5, pvo.getProductInfo());
         pstmt.setString(6, pvo.getProductInfoImg());
         pstmt.setString(7, pvo.getProductImg());
         pstmt.setInt(8, pvo.getProductSale());
         pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
         return false;
      } finally {
         JDBCUtil.disconnect(conn, pstmt);
      }
      System.out.println("  로그: insert 성공");
      return true;
   }

   // 할인율 계산
   public static int sale(ProductVO pvo) { // pvo.getProductPrice은 원금이며 P_sale는 할인률이다
   
      double P_sale = pvo.getProductSale() * 0.01; // M3는 %를 소수점으로 변환한 값이다 즉 20%를 0.2로 변환한다
      double resPrice = pvo.getProductPrice() * P_sale; // 할인되는 가격
      double prePrice = pvo.getProductPrice() - resPrice; // 실제 가격
      int sale = (int) prePrice;
      System.out.println("할인되는 가격: " + resPrice + ", 실제 가격: " + prePrice);
      
      return sale;
   }

   /*
    * 쿼리마다 메소드 추가 필! public boolean productSellUpdate(); public boolean
    * productSale(); public boolean productInfoUpdate();
    */
   public boolean update(ProductVO pvo) {
      conn = JDBCUtil.connect();
      try {  //할인율 계산
         int sale = 0;
         if (pvo.getProductSale() == 0) {
            sale = pvo.getProductPrice();
         } else {
            sale = sale(pvo);
            // sale = (pvo.getProductPrice()) - ((pvo.getProductPrice()) *
            // ((pvo.getProductSale()) / 100));
         }
         if (pvo.getSellCnt() >= 1) {
            pstmt = conn.prepareStatement(UPDATE_BUY_CNT);  //구매시 재고 차감
            pstmt.setInt(1, pvo.getSellCnt());
            pstmt.setInt(2, pvo.getProductNum());
         } else { //상품 정보 수정
            pstmt = conn.prepareStatement(UPDATE);
            pstmt.setString(1, pvo.getProductCategory());
            pstmt.setString(2, pvo.getProductName());
            pstmt.setInt(3, sale);
            pstmt.setInt(4, pvo.getProductCnt());
            pstmt.setString(5, pvo.getProductImg());
            pstmt.setString(6, pvo.getProductInfo());
            pstmt.setString(7, pvo.getProductInfoImg());
            pstmt.setInt(8, pvo.getProductSale());
            pstmt.setString(9, pvo.getProductStatus());
            pstmt.setInt(10, pvo.getProductNum());
         }
         System.out.println("  로그 update:" + pvo);
         int res = pstmt.executeUpdate();
         if (res <= 0) {
            return false;
         }
      } catch (SQLException e) {
         e.printStackTrace();
         return false;
      } finally {
         JDBCUtil.disconnect(conn, pstmt);
      }
      return true;
   }
   
   //delete 상품삭제
   public boolean delete(ProductVO pvo) {
      conn = JDBCUtil.connect();
      try {
         pstmt = conn.prepareStatement(DELETE);
         pstmt.setInt(1, pvo.getProductNum());
         int res = pstmt.executeUpdate();
         if (res <= 0) {
            return false;
         }
      } catch (SQLException e) {
         e.printStackTrace();
         return false;
      } finally {
         JDBCUtil.disconnect(conn, pstmt);
      }
      return true;
   }
   
   //selectOne 상품상세 정보, 상품구매시 사용
   public ProductVO selectOne(ProductVO pvo) {
      ProductVO data = null;
      conn = JDBCUtil.connect();
      try {
         pstmt = conn.prepareStatement(SELECTONE);
         pstmt.setInt(1, pvo.getProductNum());
         ResultSet rs = pstmt.executeQuery();
         if (rs.next()) {
            data = new ProductVO();
            if (pvo.getSellCnt() == 0) {
               data.setSellCnt(1);
            } else {
               data.setSellCnt(pvo.getSellCnt());
            }
            data.setProductNum(rs.getInt("P_NUM"));
            data.setProductCategory(rs.getString("P_CATEGORY"));
            data.setProductName(rs.getString("P_NAME"));
            data.setProductPrice(rs.getInt("P_PRICE"));
            data.setProductCnt(rs.getInt("P_CNT"));
            data.setProductInfo(rs.getString("P_INFO"));
            data.setProductInfoImg(rs.getString("P_INFOIMG"));
            data.setProductImg(rs.getString("P_IMG"));
            data.setProductSale(rs.getInt("P_SALE"));
            data.setProductStatus(rs.getString("P_STATUS"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
         return null;
      } finally {
         JDBCUtil.disconnect(conn, pstmt);
      }
      return data;
   }
   
   //selectAll 상품전체목록출력, 이름검색목록출력,카테고리별목록출력
   public ArrayList<ProductVO> selectAll(ProductVO pvo) {
      ArrayList<ProductVO> datas = new ArrayList<ProductVO>();
      conn = JDBCUtil.connect();
      try {

         if (pvo.getProductName() != null) { // 이름검색 목록 출력
            int startNum = pvo.getStartNum(); // 해당 페이지의 공지목록의 시작번호
            int endNum = pvo.getEndNum(); //// 해당 페이지의 공지목록의 끝번호
            pstmt = conn.prepareStatement(SELECTALL_SEARCH);
            pstmt.setString(1, pvo.getProductName());
            pstmt.setInt(2, startNum);
            pstmt.setInt(3, endNum);
         } else if (pvo.getProductCategory() == null) { // 전체 목록 출력
            int startNum = pvo.getStartNum(); // 해당 페이지의 공지목록의 시작번호
            int endNum = pvo.getEndNum(); //// 해당 페이지의 공지목록의 끝번호
            pstmt = conn.prepareStatement(SELECTALL_PRODUCT);
            pstmt.setInt(1, startNum);
            pstmt.setInt(2, endNum);
         } else if (pvo.getProductCategory() != null) { // 카테고리별 목록 출력
            int startNum = pvo.getStartNum(); // 해당 페이지의 공지목록의 시작번호
            int endNum = pvo.getEndNum(); //// 해당 페이지의 공지목록의 끝번호
            pstmt = conn.prepareStatement(SELECTALL_CATEGORY);
            pstmt.setString(1, pvo.getProductCategory());
            pstmt.setInt(2, startNum);
            pstmt.setInt(3, endNum);

         }
         
         ResultSet rs = pstmt.executeQuery();

         while (rs.next()) {
            ProductVO data = new ProductVO();
            data.setProductNum(rs.getInt("P_NUM"));
            data.setProductCategory(rs.getString("P_CATEGORY"));
            data.setProductName(rs.getString("P_NAME"));
            data.setProductPrice(rs.getInt("P_PRICE"));
            data.setProductCnt(rs.getInt("P_CNT"));
            data.setProductInfo(rs.getString("P_INFO"));
            data.setProductInfoImg(rs.getString("P_INFOIMG"));
            data.setProductImg(rs.getString("P_IMG"));
            data.setProductSale(rs.getInt("P_SALE"));
            datas.add(data);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JDBCUtil.disconnect(conn, pstmt);
      }
      return datas;
   }
   
   
   //selectSales 할인상품목록출력
   public ArrayList<ProductVO> selectSales(ProductVO pvo) {
	   ArrayList<ProductVO> datas = new ArrayList<ProductVO>();
	   conn = JDBCUtil.connect();
	   try {
		   pstmt = conn.prepareStatement(SELECTALL_SALE);
		   ResultSet rs = pstmt.executeQuery();

		   while (rs.next()) {
			   ProductVO data = new ProductVO();
			   data.setProductNum(rs.getInt("P_NUM"));
			   data.setProductCategory(rs.getString("P_CATEGORY"));
			   data.setProductName(rs.getString("P_NAME"));
			   data.setProductPrice(rs.getInt("P_PRICE"));
			   data.setProductCnt(rs.getInt("P_CNT"));
			   data.setProductInfo(rs.getString("P_INFO"));
			   data.setProductInfoImg(rs.getString("P_INFOIMG"));
			   data.setProductImg(rs.getString("P_IMG"));
			   data.setProductSale(rs.getInt("P_SALE"));
			   datas.add(data);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   JDBCUtil.disconnect(conn, pstmt);
	   }
	   return datas;
   }

   // getAllCount() :상품전체목록 개수
   public int getAllCount() {
      conn = JDBCUtil.connect();

      int count = 0;
      try {
         pstmt = conn.prepareStatement(SELECT_PRODUCT_COUNT);
         ResultSet rs = pstmt.executeQuery();
         if (rs.next()) {
            count = rs.getInt("COUNT");
         }
      } catch (SQLException e) {
         e.printStackTrace();

      } finally {
         JDBCUtil.disconnect(conn, pstmt);
      }
      System.out.println("  로그 pdao.getAllCount:" + count);
      return count;
   }

   // getCateCount() :카테고리별 상품목록 개수
   public int getCateCount(ProductVO pvo) {
      conn = JDBCUtil.connect();

      int count = 0;
      try {
         pstmt = conn.prepareStatement(SELECT_CATEGORY_COUNT);
         pstmt.setString(1, pvo.getProductCategory());
         ResultSet rs = pstmt.executeQuery();
         if (rs.next()) {
            count = rs.getInt("COUNT");
         }
      } catch (SQLException e) {
         e.printStackTrace();

      } finally {
         JDBCUtil.disconnect(conn, pstmt);
      }
      System.out.println("  로그 pdao.getCateCount:" + count);
      return count;
   }

   // getNameCount() :이름검색별 상품목록 개수
   public int getNameCount(ProductVO pvo) {
      conn = JDBCUtil.connect();

      int count = 0;
      try {
         pstmt = conn.prepareStatement(SELECT_NAME_COUNT);
         pstmt.setString(1, pvo.getProductName());
         ResultSet rs = pstmt.executeQuery();
         if (rs.next()) {
            count = rs.getInt("COUNT");
         }
      } catch (SQLException e) {
         e.printStackTrace();

      } finally {
         JDBCUtil.disconnect(conn, pstmt);
      }
      System.out.println("  로그 pdao.getNameCount:" + count);
      return count;
   }

 /*  public ArrayList<ProductVO> selectALL_Sale(ProductVO pvo) {
      ArrayList<ProductVO> datas = new ArrayList<ProductVO>();
      conn = JDBCUtil.connect();
      try {
         pstmt = conn.prepareStatement(SELECTALL_SALE);
         pstmt.setString(1, pvo.getProductCategory());
         ResultSet rs = pstmt.executeQuery();

         while (rs.next()) {
            ProductVO data = new ProductVO();
            data.setProductNum(rs.getInt("P_NUM"));
            data.setProductCategory(rs.getString("P_CATEGORY"));
            data.setProductName(rs.getString("P_NAME"));
            data.setProductPrice(rs.getInt("P_PRICE"));
            data.setProductCnt(rs.getInt("P_CNT"));
            data.setProductInfo(rs.getString("P_INFO"));
            data.setProductInfoImg(rs.getString("P_INFOIMG"));
            data.setProductImg(rs.getString("P_IMG"));
            data.setProductSale(rs.getInt("P_SALE"));
            datas.add(data);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JDBCUtil.disconnect(conn, pstmt);
      }
      return datas;
   }
 */
   
}