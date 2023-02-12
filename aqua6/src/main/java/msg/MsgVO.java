package msg;

import java.sql.Date;

import common.Paging;

public class MsgVO extends Paging {
	
	private int msgNum;    //문의글번호 - PK
	private String msgEmail;   //문의 이메일
	private String msgTitle;    //문의제목
	private String msgContent;   //문의글내용
	private Date msgDate;      //문의날짜
	
	
	public int getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	
	public Date getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}
	public String getMsgEmail() {
		return msgEmail;
	}
	public void setMsgEmail(String msgEmail) {
		this.msgEmail = msgEmail;
	}
	
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	
	
	@Override
	public String toString() {
		return "MsgVO [msgNum=" + msgNum + ", msgEmail=" + msgEmail + ", msgTitle=" + msgTitle + ", msgContent="
				+ msgContent + ", msgDate=" + msgDate + "]";
	}


}
