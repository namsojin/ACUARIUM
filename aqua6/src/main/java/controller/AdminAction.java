package controller;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;
import member.MemberDAO;
import member.MemberVO;
import msg.MsgDAO;
import msg.MsgVO;
import msgReply.MsgReplyDAO;
import msgReply.MsgReplyVO;
import orders.OrdersDAO;
import orders.OrdersVO;
import product.ProductDAO;
import product.ProductVO;

public class AdminAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("/admin.jsp"); //admin 메인페이지로 이동
		forward.setRedirect(false);	   //forward 방식으로.
		
		OrdersVO ovo = new OrdersVO(); 
		OrdersDAO odao = new OrdersDAO();
		
		//[1]주문내역 
		ArrayList<OrdersVO> oList =  odao.selectAll(ovo) ;
		request.setAttribute("oList", oList);  
		
		//[2]총매출(totalSum)
		int totalSum=0;
		for(OrdersVO v :oList) {
			totalSum += (v.getOrdersCnt() * v.getProductPrice());
		}
		request.setAttribute("totalSum", totalSum);
		
		//[3]총판매개수(totalCnt)
		int totalCnt=0;
		for(OrdersVO v:oList) {
			totalCnt +=v.getOrdersCnt();
		}
		request.setAttribute("totalCnt", totalCnt);
		
		//각 카테고리별 총 판매개수
		int a =0;  //수조 총 판매 개수
		int b =0;  //사료 총 판매 개수
		int c =0;  //청소용품 총 판매 개수
		for(OrdersVO v:oList) {
			if( v.getProductCategory().equals("watertank")) {
				a +=v.getOrdersCnt();
			}	
			else if(v.getProductCategory().equals("feed")) {

				b+=v.getOrdersCnt();
			}
			else {
				c+=v.getOrdersCnt();
			}
		}//개수 구하기
		System.out.println("  로그 총개수 : a: "+a+",b: "+b+",c: "+c); //로그
		
		//[4]best카테고리 구하기
		int sumFeed=0;  //사료 총 판매금액
		int sumCleaning = 0; //청소용품 총 판매금액
		String bestCate ="없음";  //best카테고리
		int max1; //임시 최대값
		int max ; //결정된 최대값
		max1 = (b>a)? b : a ;
		if(max1 == a) {
			bestCate = (c>max1)? "청소용품" : "수조" ;
		}
		else {  //max1 == b일 때,  
			max = (c>max1)? c : max1 ; 	
			if(c == b) {  //c==b일 경우는, 가격까지 비교해서 총 판매금액이 큰 카테고리가 best다.
				for(OrdersVO v:oList) {
					if( v.getProductCategory().equals("feed")) {
						sumFeed +=v.getOrdersCnt()* v.getProductPrice();
					}
					else if(v.getProductCategory().equals("cleaning")) {
						sumCleaning +=v.getOrdersCnt() * v.getProductPrice();
					}
				} 
				bestCate = (sumFeed>sumCleaning)? "사료": "청소용품"; // 사료가 청소용품보다 많이 팔렸다면 사료/ 아니면 청소용품 
			} 
			else {   //c != b 일경우,
				if(max==c) {
				bestCate = "청소용품";
				} 
				else {
					bestCate = "사료";
				}
			}
		}
	
		request.setAttribute("bestCate", bestCate);
		
		//[5]worst카테고리 구하기
		int min1;  //임시 최소값
		int min;   //결정된 최소값
		String worstCate;  //worst 카테고리
		
		min1 = (b<=a)? b : a ;
		if(min1 == a) {
			worstCate = (c<=min1)? "청소용품": "수조" ;
		}
		else { //min1 == b
			min = (c<=min1)? c: min1 ;    
			if(b == c) { // c == b 일경우,
				for(OrdersVO v:oList) {
					if( v.getProductCategory().equals("feed")) {
						sumFeed +=v.getOrdersCnt()* v.getProductPrice();
					}
					else if(v.getProductCategory().equals("cleaning")) {
						sumCleaning +=v.getOrdersCnt() * v.getProductPrice();
					}
				}
				worstCate = (sumFeed>sumCleaning)? "청소용품": "사료";
			}
			else {   //c != b 일경우,
				if(min == b) {
					worstCate = "사료";
				}
				else {
					worstCate = "청소용품";
				}
			}
		}
	
		request.setAttribute("worstCate", worstCate);
		
		return forward;
	}

}
