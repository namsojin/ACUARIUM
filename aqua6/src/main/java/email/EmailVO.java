package email;

public class EmailVO {
	
	private String EmailAddress;  //보낼 이메일 주소 
	private String EmailTitle;    //답변 제목
	private String EmailContent;  //답변 내용 
		
	public String getEmailAddress() {
		return EmailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		EmailAddress = emailAddress;
	}
	public String getEmailTitle() {
		return EmailTitle;
	}
	public void setEmailTitle(String emailTitle) {
		EmailTitle = emailTitle;
	}
	public String getEmailContent() {
		return EmailContent;
	}
	public void setEmailContent(String emailContent) {
		EmailContent = emailContent;
	}
	
	
	@Override
	public String toString() {
		return "EmailVO [EmailAddress=" + EmailAddress + ", EmailTitle=" + EmailTitle + ", EmailContent=" + EmailContent
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	

}
