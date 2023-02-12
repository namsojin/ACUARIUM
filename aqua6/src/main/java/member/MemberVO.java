package member;

import java.sql.Date;

import common.Paging;

public class MemberVO extends Paging {
	
	private String memberId;  //아이디
	private String memberPw;  //패스워드
	private String memberName;  //이름
	private Date memberBirth;  //생년월일
	private String memberPhone;  //전화번호
	private String memberEmail;  //이메일
	private String memberAthu;   //권한
	//회원가입시 생년월일 처리 변수(멤버변수로만 이용) 
	private String birthyy; //생년
	private String birthmm; //월
	private String birthdd; //일  
	
	public String getBirthyy() {
		return birthyy;
	}
	public void setBirthyy(String birthyy) {
		this.birthyy = birthyy;
	}
	public String getBirthmm() {
		return birthmm;
	}
	public void setBirthmm(String birthmm) {
		this.birthmm = birthmm;
	}
	public String getBirthdd() {
		return birthdd;
	}
	public void setBirthdd(String birthdd) {
		this.birthdd = birthdd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Date getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(Date memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberAthu() {
		return memberAthu;
	}
	public void setMemberAthu(String memberAthu) {
		this.memberAthu = memberAthu;
	}	
	
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail
				+ ", memberAthu=" + memberAthu + "]";
	}
	
	

}
