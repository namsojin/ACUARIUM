package address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class AddressDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 회원 배송지 전체 보기
	final String SELECTALL = "SELECT * FROM ADDRESS ORDER BY ADDRESSNUM DESC";
	// 배송지 보기
	final String SELECTONE = "SELECT * FROM ADDRESS WHERE MEMBERID = ?";
	// 배송지 추가
	final String INSERT = "INSERT INTO ADDRESS VALUES((SELECT NVL(MAX(A_NUM),0)+1 FROM ADDRESS),?,?,?)";
	// 배송지 삭제
	final String DELETE = "DELETE FROM ADDRESS WHERE ADDRESSNUM = ?";
	// 배송정보 수정
	final String UPDATE = "UPDATE ADDRESS SET ADDRESS = ?, ADDRESSPOST = ? WHERE ADDRESSNUM = ?";
	
	
	//insert 배송지추가
	public boolean insert(AddressVO avo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, avo.getMemberId());
			pstmt.setString(2, avo.getAddress());
			pstmt.setString(3, avo.getAddressPost());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}
	
	//update 배송지수정
	public boolean update(AddressVO avo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(UPDATE);
			int res = pstmt.executeUpdate();
			if (res <= 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}

	//delete 배송지삭제
	public boolean delete(AddressVO avo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, avo.getAddressNum());
			int res = pstmt.executeUpdate();
			if (res <= 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}
	
	//selectOne 배송지 보기
	public AddressVO selectOne(AddressVO avo) {
		AddressVO data = null;
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTONE);
			pstmt.setString(1, avo.getMemberId());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new AddressVO();
				data.setAddressNum(rs.getInt("A_NUM"));
				data.setAddress(rs.getString("A_ADDRESS"));
				data.setAddressPost(rs.getString("A_POST"));
				data.setMemberId(rs.getString("MEMBERID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return data;
	}
	
	//selectAll 회원의 배송지 목록 출력
	public ArrayList<AddressVO> selectAll(AddressVO avo) {
		ArrayList<AddressVO> datas = new ArrayList<AddressVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTALL);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				AddressVO data = new AddressVO();
				data.setAddressNum(rs.getInt("A_NUM"));
				data.setAddress(rs.getString("A_ADDRESS"));
				data.setAddressPost(rs.getString("A_POST"));
				data.setMemberId(rs.getString("MEMBERID"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return datas;
	}

}
