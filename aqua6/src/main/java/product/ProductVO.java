package product;

import common.Paging;

public class ProductVO extends Paging {

   private int productNum;         //상품번호 PK
   private String productStatus;   //상품상태
   private String productCategory;  //상품분류
   private String productName;     //상품명
   private int productPrice;       //가격
   private int productCnt;         //재고
   private String productInfo;     //상품정보
   private String productInfoImg;  //상품정보이미지
   private String productImg;      //상품이미지
   private int productSale;      // 할인율
   
   //장바구니 추가시 주문수량 부분에서 사용(멤버변수로만 이용)
   private int sellCnt;          //주문수량
 

   public int getProductNum() {
      return productNum;
   }


   public void setProductNum(int productNum) {
      this.productNum = productNum;
   }


   public String getProductStatus() {
      return productStatus;
   }


   public void setProductStatus(String productStatus) {
      this.productStatus = productStatus;
   }


   public String getProductCategory() {
      return productCategory;
   }


   public void setProductCategory(String productCategory) {
      this.productCategory = productCategory;
   }


   public String getProductName() {
      return productName;
   }


   public void setProductName(String productName) {
      this.productName = productName;
   }

   public int getProductPrice() {
      return productPrice;
   }


   public void setProductPrice(int productPrice) {
      this.productPrice = productPrice;
   }


   public int getProductCnt() {
      return productCnt;
   }


   public void setProductCnt(int productCnt) {
      this.productCnt = productCnt;
   }


   public String getProductInfo() {
      return productInfo;
   }


   public void setProductInfo(String productInfo) {
      this.productInfo = productInfo;
   }


   public String getProductInfoImg() {
      return productInfoImg;
   }


   public void setProductInfoImg(String productInfoImg) {
      this.productInfoImg = productInfoImg;
   }


   public String getProductImg() {
      return productImg;
   }


   public void setProductImg(String productImg) {
      this.productImg = productImg;
   }


   public int getProductSale() {
      return productSale;
   }


   public void setProductSale(int productSale) {
      this.productSale = productSale;
   }


   public int getSellCnt() {
      return sellCnt;
   }


   public void setSellCnt(int sellCnt) {
      this.sellCnt = sellCnt;
   }


   @Override
   public String toString() {
	   return "ProductVO [productNum=" + productNum + ", productStatus=" + productStatus + ", productCategory="
			   + productCategory + ", productName=" + productName + ", productPrice=" + productPrice + ", productCnt="
			   + productCnt + ", productInfo=" + productInfo + ", productInfoImg=" + productInfoImg + ", productImg="
			   + productImg + ", productSale=" + productSale + ", sellCnt=" + sellCnt + "]";
   }


  

}