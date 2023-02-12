package msgReply;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import common.JDBCUtil;

public class MsgReplyDAO {
	
	//JDBC위함
	Connection conn;
	PreparedStatement pstmt;
	
	//오라클 SQL문
	//문의답글 추가 
	final String INSERT_MSGREPLY="INSERT INTO MSGREPLY VALUES((SELECT NVL(MAX(MSGREPLYNUM),0)+1 FROM MSGREPLY),?,?,?,?,SYSDATE)";
	//문의답글 삭제
	final String DELETE_MSGREPLY="DELETE FROM MSGREPLY WHERE MSGREPLYNUM=?";
	//문의답글수정 : 내용 수정 -사용안함
	//final String UPDATE_MSGREPLY="UPDATE MSGREPLY SET MSGREPLYCONTENT=? MEMBERID=? WHERE MSGREPLYNUM=?";
	//문의답글선택출력(상세한답변내용)-사용안함
	//final String SELECTONE_MSGREPLY="SELECT*FROM MSGREPLY WHERE MSGREPLYNUM=?";
	
	//insert 답글추가
	public boolean insert(MsgReplyVO mrpvo) {
		conn = JDBCUtil.connect();    
		try {
			pstmt = conn.prepareStatement(INSERT_MSGREPLY);
			pstmt.setInt(1, mrpvo.getMsgNum());   //문의글번호
			pstmt.setString(2,mrpvo.getMemberId());  //작성자(어드민)
			pstmt.setString(3, mrpvo.getMsgReplyTitle());  //제목 
			pstmt.setString(4, mrpvo.getMsgReplyContent()); //내용
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
			
	//delete 답글삭제
	public boolean delete(MsgReplyVO mrpvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(DELETE_MSGREPLY);
			pstmt.setInt(1, mrpvo.getMsgReplyNum());
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
			
	//update 답글정보변경
  /*	public boolean update(MsgReplyVO mrpvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(UPDATE_MSGREPLY);
			pstmt.setString(1, mrpvo.getMsgReplyContent());  
			pstmt.setString(2,mrpvo.getMemberId());
			pstmt.setInt(3, mrpvo.getMsgReplyNum());
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
		
	//selectOne 답글선택
  /* public MsgReplyVO selectOne(MsgReplyVO mrpvo) {
		MsgReplyVO data=null; 
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(SELECTONE_MSGREPLY);
			pstmt.setInt(1, mrpvo.getMsgReplyNum());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) { 
				data=new MsgReplyVO();
				data.setMsgReplyNum(rs.getInt("MSGREPLYNUM"));
				data.setMsgNum(rs.getInt("MSGNUM"));
				data.setMemberId(rs.getString("MEMBERID"));
				data.setMsgReplyTitle(rs.getString("MSGREPLYTITLE"));
				data.setMsgReplyContent(rs.getString("MSGREPLYCONTENT"));
				data.setMsgReplyDate(rs.getString("MSGREPLYDATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace(); //만약 실패한다면, null이 나올 것이다. 
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return data;
	}
  */
}
