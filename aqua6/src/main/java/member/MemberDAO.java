package member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.JDBCUtil;

public class MemberDAO {
	  
	//JDBC위함
	Connection conn;
	PreparedStatement pstmt;
	
	//오라클 SQL문
	//회원가입 추가
	final String INSERT_MEMBER = "INSERT INTO MEMBER(MEMBERID,MEMBERPW,MEMBERNAME,MEMBERBIRTH,MEMBERPHONE,MEMBEREMAIL) VALUES(?,?,?,?,?,?)";
	
	//회원정보수정  
	final String UPDATE_MEMBER = "UPDATE MEMBER SET MEMBERPW=?, MEMBERNAME=?,MEMBERBIRTH=?, MEMBERPHONE=?, MEMBEREMAIL=?, MEMBERATHU=? WHERE MEMBERID=?"; 
	
	//회원탈퇴
	//회원탈퇴시 - MEMBER 테이블 삭제. 
	final String DELETE_MEMBER = "DELETE FROM MEMBER WHERE MEMBERID=?";
	//회원탈퇴 시 ID(X) - BOARD 테이블 
	final String UPDATE_ID_BOARD = "UPDATE BOARD SET MEMBERID=MEMBERID||'(X)' WHERE MEMBERID=?"; 
	//회원탈퇴 시 ID(X) - ORDER 테이블 
	final String UPDATE_ID_ORDER = "UPDATE ORDERS SET M_ID=M_ID||'(X)' WHERE M_ID=?" ; 
	
	//회원목록출력 
	final String SELECTALL_MEMBER = "SELECT * FROM ("
										+ "SELECT * FROM ("
										+ "SELECT ROWNUM row_num, MEMBER.* FROM MEMBER"
										+ ") WHERE row_num >= ?"
										+ ") WHERE row_num <= ?";
										
    //회원목록 총 개수
	final String SELECT_MEMBER_COUNT = "SELECT COUNT(*) AS COUNT FROM MEMBER"; 
		
	//회원선택,로그인
	final String SELECTONE_MEMBER = "SELECT * FROM MEMBER WHERE MEMBERID=? AND MEMBERPW=?";
	//회원가입 시 아이디 중복확인
	final String SELECTONE_CHECKID = "SELECT * FROM MEMBER WHERE MEMBERID=?";
	//아이디찾기
	final String SELECTONE_FINDID = "SELECT * FROM MEMBER WHERE MEMBERPHONE= ?";
	//비밀번호찾기
	final String SELECTONE_FINDPW = "SELECT * FROM MEMBER WHERE MEMBERID = ? AND MEMBERNAME = ? AND MEMBERPHONE= ? ";
	
	// String -> Date로 변경하는 메서드
    // 문자열로된 생년월일을 Date로 변경하기 위해 필요
	 public Date stringToDate(MemberVO mvo){
	        String year = mvo.getBirthyy();
	        String month = mvo.getBirthmm();
	        String day = mvo.getBirthdd();
	        System.out.println(mvo.getBirthyy());
	        System.out.println( mvo.getBirthmm());
	        System.out.println(mvo.getBirthdd());
	       
	        Date birthday = Date.valueOf(year+"-"+month+"-"+day);
	        System.out.println(birthday);
	        
	        return birthday;
	        
	  } // end stringToDate()
	 
	 
	// Date -> String으로 변경하는 메서드
	//Date 타입으로 저장된 생년월일을 다시 String 타입으로 나누기 
	 public void dateToString(MemberVO mvo) {
		 SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		 String str = format.format(mvo.getMemberBirth());  //YYYY-MM-DD
		 String[] array =str.split("-");
		 
		 mvo.setBirthyy(array[0]);
		 mvo.setBirthmm(array[1]);
		 mvo.setBirthdd(array[2]);
		 
	 }

	 
	//insert 회원가입하기 
	public boolean insert(MemberVO mvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(INSERT_MEMBER);
			pstmt.setString(1, mvo.getMemberId());
			pstmt.setString(2, mvo.getMemberPw());
			pstmt.setString(3, mvo.getMemberName());
		    pstmt.setDate(4, stringToDate(mvo));
			pstmt.setString(5, mvo.getMemberPhone());
			pstmt.setString(6, mvo.getMemberEmail());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("  로그: insert 실패");
			return false;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		System.out.println("  로그: insert 완료");
		return true;
	}	

	//update 마이페이지에서 정보변경
	public boolean update(MemberVO mvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(UPDATE_MEMBER);
			pstmt.setString(1, mvo.getMemberPw());  
			pstmt.setString(2, mvo.getMemberName());
			pstmt.setDate(3, stringToDate(mvo));
			pstmt.setString(4, mvo.getMemberPhone());
			pstmt.setString(5, mvo.getMemberEmail());
			pstmt.setString(6, mvo.getMemberAthu());
			pstmt.setString(7, mvo.getMemberId());
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		System.out.println("  로그: update 완료");
		return true;
	}	
	

	//delete 회원탈퇴 
	public boolean delete(MemberVO mvo) {
		conn=JDBCUtil.connect();
		try {
			System.out.println(" 로그 delete 들어옴:"+mvo.getMemberId());
			pstmt=conn.prepareStatement(DELETE_MEMBER);   //회원탈퇴
			pstmt.setString(1, mvo.getMemberId());
			int res = pstmt.executeUpdate();
			//delete 성공시 밑에 수행
			if (res >= 0) {
				pstmt=conn.prepareStatement(UPDATE_ID_BOARD);  //회원탈퇴시 BOARD테이블 : ID(X) 으로 바뀜
				pstmt.setString(1, mvo.getMemberId());
				pstmt.executeUpdate();
				
				pstmt=conn.prepareStatement(UPDATE_ID_ORDER);  //회원탈퇴시 ORDER테이블 : ID(X) 으로 바뀜
				pstmt.setString(1, mvo.getMemberId());
				pstmt.executeUpdate();
			} else {
				return false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		System.out.println("  로그: delete 성공");
		return true;
	}	

	//selectAll 회원목록 출력
	public ArrayList<MemberVO> selectAll(MemberVO mvo) {
		ArrayList<MemberVO> datas=new ArrayList<MemberVO>(); // datas 배열생성.
		conn=JDBCUtil.connect();
		try {
			int startNum = mvo.getStartNum();  //startNum : 해당 페이지의 시작번호
	        int endNum = mvo.getEndNum();      //endNum : 해당 페이지의 끝번호
			pstmt=conn.prepareStatement(SELECTALL_MEMBER);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {  
				MemberVO data=new MemberVO();
				data.setMemberId(rs.getString("MEMBERID"));
				data.setMemberPw(rs.getString("MEMBERPW"));
				data.setMemberName(rs.getString("MEMBERNAME"));
				data.setMemberBirth(rs.getDate("MEMBERBIRTH"));
				data.setMemberPhone(rs.getString("MEMBERPHONE"));
				data.setMemberEmail(rs.getString("MEMBEREMAIL"));
				datas.add(data);
				System.out.println(data.getMemberId());
			}
		} catch (SQLException e) {  
			e.printStackTrace();
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return datas;  //데이터 없다면 empty
	}
	
	//getAllCount() :회원목록 개수 
	public int getAllCount() {
		conn=JDBCUtil.connect();
		
		int count = 0; 
		try {
			pstmt=conn.prepareStatement(SELECT_MEMBER_COUNT);	
			ResultSet rs=pstmt.executeQuery(); 
			if(rs.next()){
	            count = rs.getInt("COUNT");
	        }
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		System.out.println(" 로그 mdao.getAllCount : "+count);
		return count;
	}

	//selectOne 로그인,마이페이지(어드민페이지)에서 정보 불러오기  + 아이디 중복체크 + id,pw찾기 + 전화번호 중복체크
	public MemberVO selectOne(MemberVO mvo) {
		MemberVO data=null; 
		conn=JDBCUtil.connect();
		try {
			//pw찾기
			if (mvo.getMemberId() != null && mvo.getMemberName() != null && mvo.getMemberPhone() != null) { 
				System.out.println("  로그: mdao에서 pw찾기 실행");
				pstmt = conn.prepareStatement(SELECTONE_FINDPW);
				pstmt.setString(1, mvo.getMemberId());
				pstmt.setString(2, mvo.getMemberName());
				pstmt.setString(3, mvo.getMemberPhone());
			} 
			//id 찾기 .전화번호 중복체크 
			else if (mvo.getMemberPhone()!=null) { 
				System.out.println("  로그: mdao에서 id찾기/전화번호 중복체크 실행");
				pstmt = conn.prepareStatement(SELECTONE_FINDID);
				pstmt.setString(1, mvo.getMemberPhone());
			}
			//회원정보출력, 아이디 중복체크
			else if(mvo.getMemberPw() == null && mvo.getMemberPhone() ==null) {  
				System.out.println("로그: mdao에서 아이디중복체크 실행");
				pstmt=conn.prepareStatement(SELECTONE_CHECKID);
				pstmt.setString(1, mvo.getMemberId());
			}
			//로그인
			else {  
				System.out.println("로그: mdao에서 로그인 실행");
				pstmt=conn.prepareStatement(SELECTONE_MEMBER); 
				pstmt.setString(1, mvo.getMemberId());
				pstmt.setString(2, mvo.getMemberPw());
			}
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) { 
				data=new MemberVO();
				data.setMemberId(rs.getString("MEMBERID"));
				data.setMemberPw(rs.getString("MEMBERPW"));
				data.setMemberName(rs.getString("MEMBERNAME"));
				data.setMemberBirth(rs.getDate("MEMBERBIRTH"));
				data.setMemberPhone(rs.getString("MEMBERPHONE"));
				data.setMemberEmail(rs.getString("MEMBEREMAIL"));
				data.setMemberAthu(rs.getString("MEMBERATHU"));
				dateToString(data);
			} 
		} catch (SQLException e) {
			e.printStackTrace(); //만약 실패한다면, null이 나올 것이다. 
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return data;
	}
}
