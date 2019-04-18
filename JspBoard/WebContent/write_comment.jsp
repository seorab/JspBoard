<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String comment = request.getParameter("comment");
	String id = request.getParameter("id");
	String user_id = (String) session.getAttribute("id");
	
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		String sql = "insert into comment values (null, ?, ?, ?, sysdate())";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, comment);
		stmt.setString(2, id);
		stmt.setString(3, user_id);	
		int result = stmt.executeUpdate(); // 성공이면 1 이상, 실패면 0
		if(result > 0) {
			out.println("작성완료");
		} else {
			out.println("작성실패");
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	
%>



