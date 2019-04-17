<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = request.getParameter("id");
	
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		String sql = "update article set title=?, content=? where id=?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, title);
		stmt.setString(2, content);
		stmt.setString(3, id);	
		int result = stmt.executeUpdate(); // 성공이면 1 이상, 실패면 0
		if(result > 0) {
			out.println("수정완료");
		} else {
			out.println("수정실패");
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	
%>



