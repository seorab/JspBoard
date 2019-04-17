<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- 제목 input text -->
<!-- 내용 textarea -->
<form method="post" action="write_proc.jsp">
	제목 : <input type="text" name="title"><br>
	내용 : <textarea name="content"></textarea><br>
	<input type="submit" value="작성완료">
</form>


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
	String id = (String) session.getAttribute("id"); //getAttribute : 세션에 저장된 이름이 "id"인 속성의 값을 구한다.
	
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		// DB에 존재하는 article이라는 이름을 가진 table에 값들을 넣어라. 
		String sql = "insert into article values (null, ?, ?, 0, ?)"; 
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, title);
		stmt.setString(2, content);
		stmt.setString(3, id);	
		// 넣은 값으로 db를 업데이트해라.
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
