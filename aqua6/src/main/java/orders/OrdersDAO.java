package orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import common.JDBCUtil;
import product.ProductDAO;
import product.ProductVO;

public class OrdersDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	//주문내역전체출력
	final String SELECTALL = "SELECT * FROM ORDERS ORDER BY O_NUM DESC";
	
	//회원의 주문내역전체출력
	final String SELECTALL_USER= "SELECT * FROM ORDERS WHERE M_ID=? ORDER BY O_NUM DESC";
	
	//주문내역 상세출력
	final String SELECTONE = "SELECT * FROM ORDERS WHERE O_NUM = ?";
	
	//결제방법 수정 - 사용안함
	final String UPDATE_ORDERS_PAYMENT = "UPDATE ORDERS SET O_PAYMENT = ? WHERE O_NUM = ?";
	
	//주문상태수정 - 사용안함
	final String UPDATE_ORDERS_STATE = "UPDATE ORDERS SET O_STATE = ? WHERE O_NUM = ?";
	
	//주문내역 삭제 -주문내역 삭제는 안 되도록 설계 수정.
	//final String DELETE = "DELETE FROM ORDERS WHERE O_NUM = ?";
	
/*	final String MEMBER_ORDER_LIST = "SELECT" + "	p.P_NAME," + "	p.P_CATEGORY," + "	p.P_PRICE," + "	p.P_INFOIMG,"
			+ "	o.O_STATE," + "	o.O_CNT" + "FROM" + "	PRODUCT p, ORDERS o" + "WHERE" + "	o.M_ID = ?"
			+ "	AND p.P_NUM = o.P_NUM";
	
	final String AMOUNT_TOTAL = "SELECT" + "? AS CATEGORY," + "	SUM(A.ORDERCNT) AS ORDERCNT,"
			+ "	SUM((A.PRODUCTPRICE * A.ORDERCNT)) AS TOTAL" + "FROM" + "(SELECT" + "	p.PRODCUTCATEGORY,"
			+ "	p.PRODUCTPRICE," + "	o.ORDERCNT" + "FROM" + "	PRODUCT p, ORDERS o"
			+ "WHERE p.PRODUCTNUM = o.PRODUCTNUM) A" + "WHERE A.PRODCUTCATEGORY = ?";
*/
	
	//productNum으로 해당 product 찾기
	final String SELECT_FIND = "SELECT a.* FROM (SELECT PRODUCT.* FROM ORDERS,PRODUCT "
			+ "WHERE ORDERS.P_NUM = PRODUCT.P_NUM)a WHERE a.P_NUM =?";

	//주문내역 추가
	final String INSERT = "INSERT INTO ORDERS VALUES(emp_seq.NEXTVAL,?,?,?,?,SYSDATE,?,?,?,?,?)";
	
	
	//insert 주문내역 추가
	public boolean insert(OrdersVO ovo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setInt(1, ovo.getProductNum());
			pstmt.setString(2, ovo.getMemberId());
			pstmt.setString(3, ovo.getMemberName());
			pstmt.setString(4, ovo.getMemberPhone());
			pstmt.setInt(5, ovo.getOrdersCnt());
			pstmt.setString(6, ovo.getOrdersMemo());
			pstmt.setInt(7, ovo.getOrdersPayment()); // 결제상태 (Default값 있음)
			pstmt.setString(8, ovo.getOrdersPaymentMethod()); // 결제방식
			pstmt.setInt(9, ovo.getOrdersState()); // 배송상태 (Default값 있음)
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}

	//update 주문정보 수정 - 사용안함
	public boolean update(OrdersVO ovo) {
		conn = JDBCUtil.connect();
		try {
			int res = pstmt.executeUpdate();
			if (ovo.getOrdersPayment() == 1) {
				pstmt = conn.prepareStatement(UPDATE_ORDERS_PAYMENT);
				pstmt.setInt(1, ovo.getOrdersPayment());
				pstmt.setInt(2, ovo.getOrdersNum());
				pstmt.executeUpdate();
			} else if (ovo.getOrdersState() >= 1) {
				pstmt = conn.prepareStatement(UPDATE_ORDERS_STATE);
				pstmt.setInt(1, ovo.getOrdersState());
				pstmt.setInt(2, ovo.getOrdersNum());
			}
//			else {
//				pstmt = conn.prepareStatement(UPDATE);
//				pstmt.setInt(1, ovo.getOrdersState());
//				pstmt.setInt(2, ovo.getOrdersCnt());
//				pstmt.setString(3, ovo.getOrdersMemo());
//				pstmt.executeUpdate();
//			}
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

//	public boolean delete(OrdersVO ovo) {
//		conn = JDBCUtil.connect();
//		try {
//			pstmt = conn.prepareStatement(UPDATE_MEMBERID);
//			pstmt.setString(1, ovo.getMemberId());
//			pstmt.executeUpdate();
//
//			pstmt = conn.prepareStatement(DELETE);
//			pstmt.setInt(1, ovo.getOrdersNum());
//			int res = pstmt.executeUpdate();
//			if (res <= 0) {
//				return false;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		} finally {
//			JDBCUtil.disconnect(conn, pstmt);
//		}
//		return true;
//	}
	
	//selectOne 주문내역 상세보기
	public OrdersVO selectOne(OrdersVO ovo) {
		OrdersVO data = null;
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTONE);
			pstmt.setInt(1, ovo.getOrdersNum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new OrdersVO();
				data.setOrdersNum(rs.getInt("O_NUM"));
				data.setProductNum(rs.getInt("P_NUM"));
				data.setMemberId(rs.getString("M_ID"));
				data.setMemberName(rs.getString("M_NAME"));
				data.setMemberPhone(rs.getString("M_PHONE"));
				data.setOrdersDate(rs.getDate("O_DATE"));
				data.setOrdersCnt(rs.getInt("O_CNT"));
				data.setOrdersMemo(rs.getString("O_MEMO"));
				data.setOrdersPayment(rs.getInt("O_PAYMENT"));
				data.setOrdersPaymentMethod(rs.getString("O_PAYMENT_METHOD"));
				data.setOrdersState(rs.getInt("O_STATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return data;
	}

	//selectAll 주문내역전체출력
	public ArrayList<OrdersVO> selectAll(OrdersVO ovo) {
		ArrayList<OrdersVO> datas = new ArrayList<OrdersVO>();
		conn = JDBCUtil.connect();
		try {
			if(ovo.getMemberId()!=null) {  //해당 회원의 주문내역 전체 출력
				pstmt=conn.prepareStatement(SELECTALL_USER);
				pstmt.setString(1,ovo.getMemberId());
				System.out.println("  로그 selelctAll에서 ID:"+ovo.getMemberId());
			} else { //전체 주문내역 목록 출력
				pstmt = conn.prepareStatement(SELECTALL);
			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				OrdersVO data = new OrdersVO();
				if(findProduct(rs.getInt("P_NUM"))==null) {  //P_NUM에 해당하는 product가 없다면
					data.setProductName("단종");               //단종
					data.setProductPrice(0); 
					data.setProductCategory("discontinued");
				} else {  //P_NUM에 해당하는 product가 있다면
					data.setProductName(findProduct(rs.getInt("P_NUM")).getProductName());
					data.setProductPrice(findProduct(rs.getInt("P_NUM")).getProductPrice()); 
					data.setProductCategory(findProduct(rs.getInt("P_NUM")).getProductCategory()); 
				}
				data.setOrdersNum(rs.getInt("O_NUM"));
				data.setProductNum(rs.getInt("P_NUM")); 
				data.setMemberId(rs.getString("M_ID"));
				data.setMemberName(rs.getString("M_NAME"));
				data.setOrdersDate(rs.getDate("O_DATE"));
				data.setOrdersState(rs.getInt("O_STATE"));
				data.setOrdersCnt(rs.getInt("O_CNT"));
				data.setOrdersMemo(rs.getString("O_MEMO"));
				data.setOrdersPaymentMethod(rs.getString("O_PAYMENT_METHOD")); 
				
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return datas;
	}

	//findProduct() :productNum으로 해당 product 찾기
	public ProductVO findProduct(int pNum) {
		conn = JDBCUtil.connect();

		ProductDAO pdao = null;
		ProductVO product = null;

		try {
			pstmt = conn.prepareStatement(SELECT_FIND);
			pstmt.setInt(1, pNum);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {

				ProductVO pvo = new ProductVO();
				pvo.setProductNum(rs.getInt("P_NUM"));
				pdao = new ProductDAO();
				product = pdao.selectOne(pvo);
				System.out.println("  로그 product 있니?" + pdao.selectOne(pvo));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}

		return product;
	}

/*	public HashMap<String, Object> selectMemberOrderList(OrdersVO ovo) {
		conn = JDBCUtil.connect();
		HashMap<String, Object> map = new HashMap<>();
		try {
			pstmt = conn.prepareStatement(MEMBER_ORDER_LIST);
			pstmt.setString(1, ovo.getMemberId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				map.put("P_NAME", rs.getString("P_NAME"));
				map.put("P_CATEGORY", rs.getString("P_CATEGORY"));
				map.put("P_PRICE", rs.getString("P_PRICE"));
				map.put("P_INFOIMG", rs.getString("P_INFOIMG"));
				map.put("O_STATE", rs.getString("O_STATE"));
				map.put("O_CNT", rs.getString("O_CNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return map;
	}
*/
/*	public HashMap<String, Object> amountTotal(String category) {
		conn = JDBCUtil.connect();
		HashMap<String, Object> map = new HashMap<>();
		try {
			pstmt = conn.prepareStatement(AMOUNT_TOTAL);
			pstmt.setString(1, category);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				map.put("CATEGORY", rs.getString("CATEGORY"));
				map.put("O_CNT", rs.getInt("O_CNT"));
				map.put("TOTAL", rs.getInt("TOTAL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return map;
	}
*/
}
