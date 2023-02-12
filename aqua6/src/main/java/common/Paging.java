package common;
 
public class Paging  {
	
	 private int curpage =1; //현재 페이지 (get)
	    private int totalCount; //row 전체의 수 (get)
	    private int beginPage;  //출력화면의 시작 페이지 
	    private int endPage;    //출력화면의 끝 페이지
	    private int displayRow ;  //한 페이지에 몇 개의 로우 (선택 set)
	    private int displayPage =3;  //한 페이지에 몇 개의 페이지번호있는지 (선택 set)
	    private boolean prev; //prev(이전) 버튼이 보일건지 안보일건지
	    private boolean next; //next(다음) 버튼이 보일건지 안보일건지
	    private int startNum ;  //현재 페이지의 처음 목록번호
        private int endNum  ;   //현재 페이지의 마지막 목록번호
	    
	   
	    public int getCurpage() {
			return curpage;
		}
		public void setCurpage(int curpage) {
			this.curpage = curpage;
		}
		public int getTotalCount() {
	        return totalCount;
	    }
	    public void setTotalCount(int totalCount) {
	        //setTotalCount()를 구해야 paging이 되기 때문에
	        //paging()메서드를 setTotalCount()를 호출했을 때 자동으로 호출되게 한다.
	        this.totalCount = totalCount;
	        paging();
	    }
	    public int getDisplayRow() {
	        return displayRow;
	    }
	    public void setDisplayRow(int displayRow) {
	        this.displayRow = displayRow;
	    }
	    public int getDisplayPage() {
	        return displayPage;
	    }
	    public void setDisplayPage(int displayPage) {
	        this.displayPage = displayPage;
	    }
	    public int getBeginPage() {
	        return beginPage;
	    }
	    public int getEndPage() {
	        return endPage;
	    }
	    public boolean isPrev() {
	        return prev;
	    }
	    public boolean isNext() {
	        return next;
	    }	    
	    public int getStartNum() {
			return startNum;
		}
		public void setStartNum(int curpage) {
			this.startNum =(curpage-1)*displayRow+1 ;
		}
		public int getEndNum() {
			return endNum;
		}
		public void setEndNum(int curpage) {
			this.endNum = curpage*displayRow;
		}
		
		
		//paging()메서드
	    public void paging(){
	        // prev, next, beginPage, endPage를 계산해서 만든다.
	        // (1/3=>올림:1)*3 = 3
	    	//끝페이지
	        endPage = ((int)Math.ceil(curpage/(double)displayPage))*displayPage;
	        System.out.println("  로그 endPage:" + endPage);
	        //시작페이지
	        beginPage = endPage - (displayPage - 1);
	        System.out.println("  로그 beginPage:" + beginPage);
	        
	        // 글 29개
	        // 29/6 = 4.3 (올림) 5페이지 = totalPagee
	        //전체페이지수
	        int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
	        
	        //next
	        if(totalPage<=endPage){
	            endPage = totalPage;
	            next = false;
	        }else{
	            next = true;
	        }
	        
	        //prev
	        prev = (beginPage==1)?false:true;//page가 4이상에만 나온다.
	        System.out.println("  로그 totalPage:" + totalPage);
	        System.out.println("  로그 next:"+next);
	        System.out.println("  로그 prev:"+prev);
	    }
	

}
