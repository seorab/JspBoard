<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String id = request.getParameter("id");
	
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		String sql = "select id from member where id=?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, id);
		ResultSet rs = stmt.executeQuery();
		boolean isOk = false;
		if(rs.next()) {
			isOk = true;
		}
		if(isOk) {
			out.println("이미 사용중인 아이디 입니다.");
		} else {
			out.println("사용 가능합니다.");
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	
%>



