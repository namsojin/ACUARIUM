package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import product.ProductDAO;
import product.ProductVO;

public class ProductListAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = new ActionForward();
      forward.setPath("/product-list.jsp");//어드민영역
      forward.setRedirect(false);
      ProductVO pvo=new ProductVO();
      ProductDAO pdao=new ProductDAO();
      
   
      //---페이징 처리 
      int page = 1;  //page 초기값=1 세팅
      if (request.getParameter("page") != null) {  //사용자가 보고싶은 페이지 번호 클릭했을경우
         page = Integer.parseInt(request.getParameter("page"));
         System.out.println("  로그 클릭한 페이지 번호:"+page);
      }
      else {
         System.out.println("  로그 초기화면:"+page);
      }

      Paging paging = new Paging();

      paging.setDisplayRow(10); //회원목록 출력은 row 수 = 10으로 세팅
      pvo.setDisplayRow(10);

      paging.setCurpage(page); //현재페이지
     
      paging.setStartNum(page); //처음글목록번호
      pvo.setStartNum(page);    
      
      paging.setEndNum(page);   //끝글목록번호
      pvo.setEndNum(page);
      
      int count = pdao.getAllCount();  //총 목록 개수
      paging.setTotalCount(count);
      pvo.setTotalCount(count);
      System.out.println("  로그 총목록수:"+count);
      System.out.println("  로그 next:"+paging.isNext());
      System.out.println("  로그 prev:"+paging.isPrev());
      request.setAttribute("paging", paging); //페이징처리
     
      request.setAttribute("pList", pdao.selectAll(pvo));
      return forward;
   }
}