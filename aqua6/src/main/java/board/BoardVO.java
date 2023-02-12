package board;

import common.Paging;

public class BoardVO extends Paging {
	
	private int boardNum;   //글번호 - PK
	private String boardTitle;   //글제목
	private String boardContent;  //글내용
	private String memberId;    //글작성자(어드민) - FK(MEMBER TABLE)
	private String boardImg;   //글첨부이미지
	private String boardDate;    //글작성일자        
	//검색 변수(멤버변수로만)
	private String searchContent;   //검색어
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardImg() {
		return boardImg;
	}
	public void setBoardImg(String boardImg) {
		this.boardImg = boardImg;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", memberId=" + memberId + ", boardImg=" + boardImg + ", boardDate=" + boardDate + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
