<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>



<%
	String pageStr = request.getParameter("page");

	int pageNum = 0;
	try {
		pageNum = Integer.parseInt(pageStr);
	} catch(NumberFormatException e) {
		pageNum = 1;
	}

	int startRow = 0;
	int endRow = 0;
	endRow = pageNum * 10;
	startRow = endRow - 9;
	int total = 0;
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();                 //  asc
		
		String sql2 = "select count(*) from article";
		PreparedStatement stmt2 = con.prepareStatement(sql2);
		ResultSet rs2 = stmt2.executeQuery();
		if(rs2.next()) {
			total = rs2.getInt("count(*)");
		}
		
		String sql = "select * from article order by id desc" +
		             "    limit ?, 10";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, startRow - 1);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			String id = rs.getString("id");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String hit = rs.getString("hit");
			String id2 = rs.getString("id2");
			// 절대 경로  http://localhost/JspBoard/view.jsp?id=1
			// 상대 경로  view.jsp?id=1
			out.println("<a href='view.jsp?id=" + id + "'>" + id + "/" + title + "/" 
					+ id2 + "</a><br>");
		}
		
		int startPage = 0;
		startPage = (pageNum - 1) / 10 * 10 + 1;
		
		int endPage = 0;
		endPage = startPage + 9;
		
		int totalPage = 0; // 전체 페이지 수 4
		if(total % 10 == 0) { // 10 20 30 40
			totalPage = total / 10;
		} else {
			totalPage = total / 10 + 1;
		}
		if(endPage > totalPage) endPage = totalPage;
		
		out.println("<ul class=\"pagination\">");
		for(int i = startPage; i <= endPage; i++) {
%>			
			<li class="page-item">
				<a class="page-link" href="list.jsp?page=<%=i%>">
					<%=i%>
				</a>
			</li>
<%
		}
		out.println("</ul>");
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	
%>



