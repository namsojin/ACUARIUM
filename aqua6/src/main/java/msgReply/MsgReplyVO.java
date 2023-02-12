package msgReply;

public class MsgReplyVO {
	
	private int msgReplyNum;  //답변글번호 - PK
	private int msgNum;       //문의글번호 - FK(MSG TABLE)
	private String memberId;  //아이디(답변작성자=어드민) - FK(MEMBER TABLE)
	private String msgReplyTitle; //답변제목
	private String msgReplyContent;  //답변내용
	private String msgReplyDate;    //답변작성일자
	
	public int getMsgReplyNum() {
		return msgReplyNum;
	}
	public void setMsgReplyNum(int msgReplyNum) {
		this.msgReplyNum = msgReplyNum;
	}
	public String getMsgReplyContent() {
		return msgReplyContent;
	}
	public void setMsgReplyContent(String msgReplyContent) {
		this.msgReplyContent = msgReplyContent;
	}
	
	public String getMsgReplyDate() {
		return msgReplyDate;
	}
	public void setMsgReplyDate(String msgReplyDate) {
		this.msgReplyDate = msgReplyDate;
	}
	
	public int getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMsgReplyTitle() {
		return msgReplyTitle;
	}
	public void setMsgReplyTitle(String msgReplyTitle) {
		this.msgReplyTitle = msgReplyTitle;
	}
	
	@Override
	public String toString() {
		return "MsgReplyVO [msgReplyNum=" + msgReplyNum + ", msgNum=" + msgNum + ", memberId=" + memberId
				+ ", msgReplyTitle=" + msgReplyTitle + ", msgReplyContent=" + msgReplyContent + ", msgReplyDate="
				+ msgReplyDate + "]";
	}
	
	
	
}
