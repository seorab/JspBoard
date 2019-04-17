<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

try {
	DBManager db = DBManager.getInstance();
	Connection con = db.open();
	String sql = "insert into person_info values (?, ?, ?, ?, ?)";
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1, id);
	stmt.setString(2, pw);
	stmt.setString(3, name);	
	stmt.setString(4, phone);	
	stmt.setString(5, email);	
	stmt.executeUpdate();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();
}	
%>
    