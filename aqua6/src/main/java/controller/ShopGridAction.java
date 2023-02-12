package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import product.ProductDAO;
import product.ProductVO;

public class ShopGridAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = new ActionForward();
      forward.setPath("/shop-grid.jsp");
      forward.setRedirect(false);
      ProductVO pvo = new ProductVO();
      ProductDAO pdao = new ProductDAO();
      
      
      //할인상품 selectSales
      request.setAttribute("sList", pdao.selectSales(pvo));
      
      //카테고리 가져오기
      String category = request.getParameter("category");
      pvo.setProductCategory(category);
      request.setAttribute("category", category);
      
      //검색어 가져오기
      String search = request.getParameter("search");
      pvo.setProductName(search);
      request.setAttribute("search", search);
     
      //---페이징 처리 
      Paging paging = new Paging();
      paging.setDisplayRow(9); //쇼핑몰상품목록 출력은 row 수 = 9로 세팅
      pvo.setDisplayRow(9);
      
      int page = 1;  //page 초기값=1 세팅
      if (request.getParameter("page") != null) {  //사용자가 보고싶은 페이지 번호 클릭했을경우
         page = Integer.parseInt(request.getParameter("page"));
         System.out.println("  로그 클릭한 페이지 번호:"+page);
      }
      else { //초기화면 page==1
         System.out.println("  로그 초기화면:"+page);
      }

      paging.setCurpage(page); //현재페이지
      
      paging.setStartNum(page); //처음글목록번호
      pvo.setStartNum(page);    
      
      paging.setEndNum(page);   //끝글목록번호
      pvo.setEndNum(page);
      
      //이름검색일 경우
      if(pvo.getProductName() != null && pvo.getProductName() != "") {  
          int count = pdao.getNameCount(pvo);  
          paging.setTotalCount(count);
      }
      
      //카테고리별 출력일 경우
      else if(pvo.getProductCategory() != null && pvo.getProductCategory() != "" ) { 
         int count = pdao.getCateCount(pvo); 
         paging.setTotalCount(count);
      }
      
      //전체목록 출력일 경우  
      else {
         System.out.println("  로그: 전체 출력 할 것");
         int count = pdao.getAllCount();  
          paging.setTotalCount(count);
      }
   
      request.setAttribute("paging", paging); //페이징처리
  
      request.setAttribute("sum", pdao.selectAll(pvo).size());
      request.setAttribute("pList", pdao.selectAll(pvo));    //상품목록출력
      
      
      return forward;
   }
}