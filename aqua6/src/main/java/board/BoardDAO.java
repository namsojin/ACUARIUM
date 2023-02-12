package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class BoardDAO {
	
	//JDBC위함
	Connection conn;
	PreparedStatement pstmt;
	
	//오라클 SQL문
	//공지글추가     
	final String INSERT_BOARD="INSERT INTO BOARD VALUES((SELECT NVL(MAX(BOARDNUM),0)+1 FROM BOARD),?,?,?,?,SYSDATE)";
	//공지글삭제
	final String DELETE_BOARD="DELETE FROM BOARD WHERE BOARDNUM=?";
	//공지글수정 : 제목,내용,작성자,첨부파일 수정 
	final String UPDATE_BOARD="UPDATE BOARD SET BOARDTITLE=?,BOARDCONTENT=?,MEMBERID=?,BOARDIMG=? WHERE BOARDNUM=?";
	//공지글목록출력(페이징처리)  
	final String SELECTALL_BOARD= "SELECT * FROM ("
										+ "SELECT * FROM ("
										+ "SELECT ROWNUM row_num, BOARD.* FROM BOARD"
										+ ") WHERE row_num >= ?"
										+ ") WHERE row_num <= ?";
	//공지글 개수 
	final String SELECT_BOARD_COUNT = "SELECT COUNT(*) AS COUNT FROM BOARD";
	//공지글선택출력(상세한공지내용전달)
	final String SELECTONE_BOARD="SELECT*FROM BOARD WHERE BOARDNUM=?";
	//내용검색(페이징처리) 
	final String SELECTALL_SEARCH= "SELECT * FROM ("
										+ "SELECT * FROM ("
										+ "SELECT ROWNUM row_num, Z.* FROM ("
										+ "SELECT * FROM BOARD WHERE BOARDCONTENT LIKE '%'||?||'%' ORDER BY BOARDNUM DESC)Z "
										+ ") WHERE row_num >= ?"
										+ ") WHERE row_num <= ?";
	//내용검색 후 공지글 개수 
	final String SELECT_SEARCH_COUNT = "SELECT COUNT(*) AS COUNT FROM BOARD WHERE BOARDCONTENT LIKE '%'||?||'%' ";
	
	
	//insert 공지글추가
	public boolean insert(BoardVO bvo) {
		conn = JDBCUtil.connect();    
		try {
			pstmt = conn.prepareStatement(INSERT_BOARD);  
			pstmt.setString(1, bvo.getBoardTitle());  //제목
			pstmt.setString(2, bvo.getBoardContent());  //내용
			pstmt.setString(3, bvo.getMemberId());   //작성자
			pstmt.setString(4, bvo.getBoardImg());    //글첨부이미지
			pstmt.executeUpdate();                   
		} catch (SQLException e) {              
			e.printStackTrace();
			return false;       //insert 실패
		} finally {
			JDBCUtil.disconnect(conn, pstmt);  
		}
		System.out.println("  로그: insert 완료");
		return true;   //insert 성공
	}
	
	//delete 공지삭제
	public boolean delete(BoardVO bvo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(DELETE_BOARD);
			pstmt.setInt(1, bvo.getBoardNum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			JDBCUtil.disconnect(conn, pstmt);  
		}
		System.out.println("  로그: delete 완료");
		return true;   
	}
	
	//update 공지정보변경
	public boolean update(BoardVO bvo) {
		conn=JDBCUtil.connect();
		try {
				pstmt=conn.prepareStatement(UPDATE_BOARD);
				pstmt.setString(1, bvo.getBoardTitle());  
				pstmt.setString(2, bvo.getBoardContent());
				pstmt.setString(3, bvo.getMemberId());
				pstmt.setString(4, bvo.getBoardImg());
				pstmt.setInt(5,bvo.getBoardNum());
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
	
	//selectAll 공지목록 출력 , 검색
	public ArrayList<BoardVO> selectAll(BoardVO bvo) {
		ArrayList<BoardVO> datas=new ArrayList<BoardVO>(); // datas 배열생성.
		conn=JDBCUtil.connect();
		try {
			//전체목록출력
			if(bvo.getSearchContent() == null) {  
			 int startNum = bvo.getStartNum();  //해당 페이지의 공지목록의 시작번호
		     int endNum = bvo.getEndNum();  ////해당 페이지의 공지목록의 끝번호
		     pstmt=conn.prepareStatement(SELECTALL_BOARD);  
			 pstmt.setInt(1, startNum);
			 pstmt.setInt(2, endNum);
			
			}
			else {
			 //내용검색출력	
			 System.out.println("  로그: 검색출력");
			 int startNum = bvo.getStartNum();
			 int endNum = bvo.getEndNum();
			 pstmt=conn.prepareStatement(SELECTALL_SEARCH);	  
			 pstmt.setString(1, bvo.getSearchContent());
			 pstmt.setInt(2, startNum);
			 pstmt.setInt(3, endNum);	
			}
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {  
				BoardVO data=new BoardVO();
				data.setBoardNum(rs.getInt("BOARDNUM"));
				data.setBoardTitle(rs.getString("BOARDTITLE"));
				data.setBoardContent(rs.getString("BOARDCONTENT"));
				data.setMemberId(rs.getString("MEMBERID"));
				data.setBoardImg(rs.getString("BOARDIMG"));
				data.setBoardDate(rs.getString("BOARDDATE"));
				datas.add(data);
			}
		} catch (SQLException e) {  
			e.printStackTrace();
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return datas;  //데이터가 없다면 empty.
	}
	
	//getAllCount() :공지글목록 개수 
	public int getAllCount() {
		conn=JDBCUtil.connect();
		int count = 0; 
		try {
			pstmt=conn.prepareStatement(SELECT_BOARD_COUNT);	
			ResultSet rs=pstmt.executeQuery(); 
			if(rs.next()){
				count = rs.getInt("COUNT");
			}
		}catch(SQLException e) {
			e.printStackTrace();

		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		System.out.println("로그 bdao.getAllCount : "+count);
		return count;
	}
	
	//getSearchCount() :내용검색후 공지글목록 개수 
	public int getSearchCount(BoardVO bvo) {
		conn=JDBCUtil.connect();
		int count = 0; 
		try {
			pstmt=conn.prepareStatement(SELECT_SEARCH_COUNT);
			pstmt.setString(1, bvo.getSearchContent());
			ResultSet rs=pstmt.executeQuery(); 
			if(rs.next()){
				count = rs.getInt("COUNT");
			}
		}catch(SQLException e) {
			e.printStackTrace();

		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		System.out.println("로그 bdao.getSearchCount : "+count);
		return count;
	}

	//selectOne 공지선택
	public BoardVO selectOne(BoardVO bvo) {
		BoardVO data=null; 
		conn=JDBCUtil.connect();
		try {
		    pstmt=conn.prepareStatement(SELECTONE_BOARD);
		    pstmt.setInt(1, bvo.getBoardNum());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) { 
				data=new BoardVO();
				data.setBoardNum(rs.getInt("BOARDNUM"));
				data.setBoardTitle(rs.getString("BOARDTITLE"));
				data.setBoardContent(rs.getString("BOARDCONTENT"));
				data.setMemberId(rs.getString("MEMBERID"));
				data.setBoardImg(rs.getString("BOARDIMG"));
				data.setBoardDate(rs.getString("BOARDDATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace(); //만약 실패한다면, null이 나올 것이다. 
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return data;
	}
		
		

}
