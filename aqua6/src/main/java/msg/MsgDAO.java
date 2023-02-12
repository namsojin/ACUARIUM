package msg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class MsgDAO {
	
	//JDBC위함
	Connection conn;
	PreparedStatement pstmt;
	
	//오라클 SQL문
	//문의글 추가 
	final String INSERT_MSG="INSERT INTO MSG VALUES((SELECT NVL(MAX(MSGNUM),0)+1 FROM MSG),?,?,?,SYSDATE)";
	//문의글삭제  
	final String DELETE_MSG = "DELETE FROM MSG WHERE MSGNUM=?";
	//문의글 삭제시 -> 문의답글도 같이 삭제.(이걸 먼저해야함)
	final String DELETE_MSG_MSGREPLY="DELETE FROM (SELECT MSG.MSGNUM FROM MSG,MSGREPLY WHERE MSG.MSGNUM = MSGREPLY.MSGNUM)a WHERE a.MSGNUM=?";
	//문의글수정 : 내용 수정 - 사용안함
	//final String UPDATE_MSG="UPDATE MSG SET MSGCONTENT=? WHERE MSGNUM=?";
	//문의글목록출력(페이징처리)  
	final String SELECTALL_MSG = "SELECT * FROM ("
									+ "SELECT * FROM ("
									+ "SELECT ROWNUM row_num, MSG.* FROM MSG"
									+ ") WHERE row_num >= ?"
									+ ") WHERE row_num <= ?";
	//문의글목록 총 개수
	final String SELECT_MSG_COUNT = "SELECT COUNT(*) AS COUNT FROM MSG"; 
	//문의글선택출력(상세한공지내용전달)
	final String SELECTONE_MSG="SELECT*FROM MSG WHERE MSGNUM=?";
	
	
	//insert 문의글추가
	public boolean insert(MsgVO msgvo) {
		conn = JDBCUtil.connect();    
		try {
			pstmt = conn.prepareStatement(INSERT_MSG);  
			pstmt.setString(1, msgvo.getMsgEmail());  //이메일
			pstmt.setString(2, msgvo.getMsgTitle());  //제목
			pstmt.setString(3, msgvo.getMsgContent()); //내용
			pstmt.executeUpdate();                   
			System.out.println(" 로그: insert 완료");
		} catch (SQLException e) {              
			e.printStackTrace();
			return false;       //insert 실패
		} finally {
			JDBCUtil.disconnect(conn, pstmt);  
		}
		return true;   //insert 성공
	}
		
	//delete 문의글삭제
	public boolean delete(MsgVO msgvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(DELETE_MSG_MSGREPLY);  //해당문의글에 대한 문의답글 삭제
			pstmt.setInt(1, msgvo.getMsgNum());
			pstmt.executeUpdate();
			
			pstmt=conn.prepareStatement(DELETE_MSG);  //문의글 삭제
			pstmt.setInt(1, msgvo.getMsgNum());
			pstmt.executeUpdate();
			System.out.println(" 로그: delete 완료");
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			JDBCUtil.disconnect(conn, pstmt);  
		}
		return true;   
	}
		
	//update 문의글정보변경
 /*	public boolean update(MsgVO msgvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(UPDATE_MSG);
			
			pstmt.setString(1, msgvo.getMsgContent());  
			pstmt.setInt(2,msgvo.getMsgNum());
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}
  */		
	
	//selectAll 문의글목록 출력
	public ArrayList<MsgVO> selectAll(MsgVO msgvo) {
		ArrayList<MsgVO> datas=new ArrayList<MsgVO>(); // datas 배열생성.
		conn=JDBCUtil.connect();
		try {
			
			int startNum = msgvo.getStartNum();  //startNum 해당 페이지의 시작번호
	        int endNum = msgvo.getEndNum();      //endNum  해당 페이지의 끝번호
	       
	        pstmt=conn.prepareStatement(SELECTALL_MSG);	
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {  
				MsgVO data=new MsgVO();
				data.setMsgNum(rs.getInt("MSGNUM"));
				data.setMsgEmail(rs.getString("MSGEMAIL"));
				data.setMsgTitle(rs.getString("MSGTITLE"));
				data.setMsgContent(rs.getString("MSGCONTENT"));
				data.setMsgDate(rs.getDate("MSGDATE"));
				
				datas.add(data);
			}
		} catch (SQLException e) {  
			e.printStackTrace();
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return datas;  //없으면 empty 
	}
	
	//getAllCount() 문의목록 개수(페이징처리) 
	public int getAllCount() {
		conn=JDBCUtil.connect();

		int count = 0; 
		try {
			pstmt=conn.prepareStatement(SELECT_MSG_COUNT);	
			ResultSet rs=pstmt.executeQuery(); 
			if(rs.next()){
				count = rs.getInt("COUNT");
			}
		}catch(SQLException e) {
			e.printStackTrace();

		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		System.out.println("  로그 msgdao.getAllCount : "+count);
		return count;
	}
	
	//selectOne 문의글선택
	public MsgVO selectOne(MsgVO msgvo) {
		MsgVO data=null; 
		conn=JDBCUtil.connect();
		try {
			 pstmt=conn.prepareStatement(SELECTONE_MSG);
			 pstmt.setInt(1, msgvo.getMsgNum());
		     ResultSet rs=pstmt.executeQuery();
			 if(rs.next()) { 
				data=new MsgVO();
				data.setMsgNum(rs.getInt("MSGNUM"));
				data.setMsgEmail(rs.getString("MSGEMAIL"));
				data.setMsgTitle(rs.getString("MSGTITLE"));
				data.setMsgContent(rs.getString("MSGCONTENT"));
			    data.setMsgDate(rs.getDate("MSGDATE"));
			 }
		} catch (SQLException e) {
			e.printStackTrace(); //만약 실패한다면, null이 나올 것이다. 
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return data;
	}
			

}
