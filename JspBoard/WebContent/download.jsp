<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String fileName = "111.jpg";
	String filePath = "c:/dev/" + fileName;
	InputStream is = null;
	OutputStream os = null;
	try {
		response.setContentType("image/jpeg");
		response.setHeader("Content-Disposition", "filename=" + fileName);

		/* 기존에 만들어져 있는 out 객체 초기화 */
		out.clear();
		out = pageContext.pushBody();
		byte[] b = new byte[1024];
		is = new FileInputStream(filePath);
		os = response.getOutputStream();

		int data = 0;
		while ((data = is.read(b)) != -1) {
			os.write(b);
		}
		os.flush();
	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		if (os != null) {
			try {
				os.close();
			} catch (IOException e) {
			}
			;
		}
		if (is != null) {
			try {
				is.close();
			} catch (IOException e) {
			}
			;
		}
	}
%>