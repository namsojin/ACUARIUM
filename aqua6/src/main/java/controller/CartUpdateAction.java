package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.ProductDAO;
import product.ProductVO;

public class CartUpdateAction implements Action { // 장바구니 업데이트 액션

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = new ActionForward();
      forward.setPath("cartMove.do"); // 장바구니 업데이트 후 cartMove.do 실행
      System.out.println("  로그 pNum:"+request.getParameter("pNum"));
      System.out.println("  로그 sellCnt:"+request.getParameter("sellCnt"));
      forward.setRedirect(true);
      ProductVO pvo = new ProductVO();
      ProductDAO pdao = new ProductDAO();
      
      HttpSession session = request.getSession(false);
      ArrayList<ProductVO> cart = (ArrayList<ProductVO>) session.getAttribute("cart");  //장바구니있니?
      if (cart == null) {
         cart = new ArrayList<ProductVO>();
      }
      int sellCnt = 0;  //주문수량
      int pNum = 0;     //상품번호
      if (request.getParameter("pNum") != null) { 
         pNum = Integer.parseInt(request.getParameter("pNum"));
      }
      pvo.setProductNum(pNum);
      
      System.out.println("  로그 상품:"+pvo);
      
      //[1]주문수량 
      if (request.getParameter("sellCnt") != null) { 
            sellCnt = Integer.parseInt(request.getParameter("sellCnt"));
      } else {  //선택한 주문수량이 없다면 1로 세팅
         sellCnt = 1;
      }
      pvo.setSellCnt(sellCnt);
      
      ProductVO pCheck = new ProductVO();
      pCheck = pdao.selectOne(pvo);
      
      if (request.getParameter("sellCnt") != null) { 
           sellCnt = Integer.parseInt(request.getParameter("sellCnt"));
           
           if (sellCnt >= 1 && sellCnt <= pCheck.getProductCnt() - 1) {
               System.out.println("  로그: 주문수량 올바름");
               pvo.setSellCnt(sellCnt);
               System.out.println("  로그 수량확인:" + pvo.getSellCnt());
            } else {
               System.out.println("  로그: 수량잘못입력");
               forward.setPath("SellCheck");  //alert창 띄워줘
               return forward;
            }
      }
      
      //[2]상품
      boolean flag = true;
      if (cart.size() != 0) { // 장바구니에 상품이 있을때
         // int pCnt=Integer.parseInt(request.getParameter("pCnt"));
         // pvo.setProductCnt(pCnt-sellCnt); 물건을 구매한만큼 product의 Cnt 감소
         // 카트 중복체크
         for (int i = 0; i < cart.size(); i++) {
            if(cart.get(i).getProductNum() == pNum) { //|| cart.get(i).getSellCnt()!=sellCnt) {
               flag = false;
               // 같은게있어요
               int totalCnt = cart.get(i).getSellCnt()+pvo.getSellCnt();
               pvo.setSellCnt(totalCnt);
               cart.remove(i);  //먼저 장바구니에 있던 해당 상품은 삭제하고,
               cart.add(pdao.selectOne(pvo)); //새로 세팅된 걸로 추가
               System.out.println("  로그 어떻게 바꼈니:"+cart.get(i));
               break;
            }
         }
         if(flag) { // 같은게없으면
            cart.add(pdao.selectOne(pvo));
         }
         System.out.println("로그 cart원래ㅇ , 수정된 cart:" + cart); // 로그
      } else { //cart 없을때
         cart.add(pdao.selectOne(pvo));
         System.out.println("로그 cart원래x, 새로 생긴 cart =" + cart); // 로그
      }
      session.setAttribute("cart", cart);
      return forward;
   }
}