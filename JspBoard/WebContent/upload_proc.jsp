<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// InputStream is = request.getInputStream();
// InputStreamReader isr = new InputStreamReader(is);
// BufferedReader reader = new BufferedReader(isr);

// while(true) {
// 	String data = reader.readLine();
// 	if(data == null) break;
// 	out.print(data + "<br>");
// }

// cos 라이브러리를 이용한 업로드(파일 저장)
MultipartRequest mReq = 
	new MultipartRequest(
		request, "c:/dev", 1024 * 1024 * 5, 
		"utf-8", new DefaultFileRenamePolicy()); 
%>









