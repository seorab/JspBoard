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
		Connection con = db.open();                 //  asc
		
		String sql2 = "update article set hit=hit+1 where id = ?";
		PreparedStatement stmt2 = con.prepareStatement(sql2);
		stmt2.setString(1, id);		
		stmt2.executeUpdate();
		
		String sql = "select * from article where id = ?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, id);
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			String num = rs.getString("id");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String hit = rs.getString("hit");
			String id2 = rs.getString("id2");
			String link = rs.getString("link");
%>
		<h1><%=title%> / <%=num%></h1>
		<p><a href='<%=link%>'><%=content%></a></p>
		<p><%=hit%></p>
		<p><%=id2%></p>
		<button type="button" onclick="location='update.jsp?id=<%=id%>'">수정</button>
		<button type="button" onclick="del()">삭제</button>
<%		
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	
%>

댓글 <input type="text" id="comment" name="comment">
<button type="button" onclick="writeComment()">작성</button>



<script>
	function writeComment() {
		$.ajax({
			url: 'write_comment.jsp',
			type: 'post',
			data: {
				'comment': $('#comment').val(),
				'id': '<%=id%>'
			},
			success: function(res){
				
			}
		})
	}

	function del() {
		var isOk = confirm("삭제 할래?");
		if(isOk) { // 삭제
			location = 'delete_proc.jsp?id=<%=id%>';
		}
	}
</script>













