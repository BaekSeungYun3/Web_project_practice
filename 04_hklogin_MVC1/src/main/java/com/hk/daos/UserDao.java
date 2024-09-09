package com.hk.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hk.database.Database;
import com.hk.dtos.RoleStatus;
import com.hk.dtos.UserDto;

public class UserDao extends Database{
	
	//싱글톤 패턴: 객체를 한번만 생성하여 사용
	//외부에 접근할 때 new를 사용하지 못하게 함
	
	public static UserDao userDao;
	
	private UserDao() {}
	
	public static UserDao getUserDao() {	//UserDao.getUserDao() 가능
		
		if(userDao == null) 
			userDao = new UserDao();		//내부에서 객체 생성 한번함
		
		return userDao;
	}
	
	//사용자 기능: 1. 회원가입 기능(enabled: 'Y', role:'USER', regDate = SYSDATE()) - insert문 실행
	public boolean insertUser(UserDto dto) {
		
		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = " INSERT INTO USERINFO " + " VALUES(NULL,?,?,?,?,?,'Y',?,SYSDATE()) ";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getPassword());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, String.valueOf(RoleStatus.USER));
			
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(null, psmt, conn);
		}
		
		return count > 0 ? true:false;
	}
}
