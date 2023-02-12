package product;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Crawling {
   final static int MAX_CNT = 18;
   final static int MIN_CNT = 9; // 9개씩 옴.

   public void sample() {

      ArrayList<String> urls = makeUrls(); // 9개
      System.out.println("2반 크롤링 시작");
      ArrayList<String> category = new ArrayList<String>(); // 3개
      category.add("watertank"); // 0
      category.add("feed"); // 1
      category.add("cleaning"); // 2
      ProductDAO pdao = new ProductDAO();
      System.out.println(urls.size());  //로그
      // 1 2 3 / 4 5 6 / 7 8 9
      int APPLE=0; // ★★★★★urls.get(i)였는데, 9x3만큼 계-속 늘어야함. 그래서 새로운 변수하나파서 걍 계속늘림★★★★★
      for (int a = 0; a < category.size(); a++) { // 3번
         System.out.println("1번 포문 시작");
        
         
         for (int i = 0; i < MIN_CNT; i++) { // 3번 돌아야 함
            System.out.println("2번 포문 시작");
            Document doc = null;
            try {
               doc = Jsoup.connect(urls.get(APPLE++)).get(); // i 번째 url 연결
               System.out.println(i);
            } catch (IOException e) {
               e.printStackTrace();
            }
            String ele1 = doc.select("#goods_spec > form > div:nth-child(4) > b").get(0).text(); // 상품명
            System.out.println(ele1);
            String ele2 = doc.select("#price > font").get(0).text(); // 가격
            System.out.println(ele2);
            String ele3 = doc.select("#objImg").get(0).getElementsByAttribute("src").attr("src").replace("../",
                  "https://www.raraaqua.co.kr/shop/"); // 상품이미지지
            System.out.println(ele3);
            String ele4 = doc.select("#contents").get(0).getElementsByTag("img").attr("src")
                  .replace("/shop/lib/meditor/../../", "https://www.raraaqua.co.kr/shop/"); // 상품정보이미지
            System.out.println(ele4);
            String pricevalue = ele2;
            pricevalue = pricevalue.replaceAll(",", "");
            int price = Integer.parseInt(pricevalue);
            ProductVO data = new ProductVO();
            data.setProductCategory((category.get(a)));
            data.setProductName((ele1));
            data.setProductPrice(price);
            data.setProductImg(ele3);
            data.setProductInfoImg(ele4);
            pdao.insert(data);
            System.out.println("  크롤링 로그 [" + i + "]번 이름 : " + data.getProductName() + ", 카테고리 : "
                  + data.getProductCategory() + " 가격 : " + data.getProductPrice());
         }

      }
   }

   // 영화 상세 페이지 링크 크롤링 : 상위 5개
   public static ArrayList<String> makeUrls() {
      ArrayList<String> categoryUrls = new ArrayList<String>();
      categoryUrls.add("https://www.raraaqua.co.kr/shop/goods/goods_list.php?&category=004"); // 수조
      categoryUrls.add("https://www.raraaqua.co.kr/shop/goods/goods_list.php?&category=005"); // 사료
      categoryUrls.add("https://www.raraaqua.co.kr/shop/goods/goods_list.php?&category=013"); // 수질용품
      String url = null;

      ArrayList<String> urlDatas = new ArrayList<String>();

      for (int i = 0; i < categoryUrls.size(); i++) {
         url = categoryUrls.get(i);
         Document doc = null;
         try {
            doc = Jsoup.connect(url).get();
         } catch (IOException e) {
            e.printStackTrace();
         }
         Elements eles = doc.select("tbody > tr:nth-child(3) > td > table > tbody  * a"); // a
//         Elements eles = doc.select(
//               "body > table > tbody > tr:nth-child(2) > td > table > tbody > tr > td > div.indiv > form:nth-child(1) > table:nth-child(11) > tbody > tr:nth-child(3) > td > table > tbody * a"); // a
         for (int j = 0; j < MAX_CNT; j++) {
            if (j % 2 != 0) {
               String hrefUrl = eles.get(j).getElementsByAttribute("href").attr("href").replace("../", "/");
               urlDatas.add("https://www.raraaqua.co.kr/shop" + hrefUrl);
               System.out.println(j + "https://www.raraaqua.co.kr/shop" + hrefUrl);
            }
         }
      }
      for (int i = 0; i < urlDatas.size(); i++) {
         System.err.println(urlDatas.get(i).toString());
      }
      System.out.println("1번 크롤링 끝");
      return urlDatas;
   }

   public static void main(String[] args) {
      Crawling crawling = new Crawling();
      crawling.sample();
//      makeUrls();
   }

}