<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
Document doc = Jsoup.connect("https://dhlottery.co.kr/gameResult.do?method=byWin&drwNo=582").get();
Elements el = doc.select("span.ball_645");
for(int i = 0; i < el.size(); i++) {
	String num = el.get(i).text();
	out.println(num);
}
%>	
<input type=file onchange="openQRCamera(this);">

<p>QR ³»¿ë</p>
<div id='result'></div>

<script src="qr_packed.js"></script>

<script>
	function openQRCamera(node) {
		var reader = new FileReader();
		reader.onload = function() {
			node.value = "";
			qrcode.callback = function(res) {
				if (res instanceof Error) {
					alert("No QR code found. Please make sure the QR code is within the camera's frame and try again.");
				} else {
					document.getElementById('result').innerHTML = res;
				}
			};
			qrcode.decode(reader.result);
		};
		reader.readAsDataURL(node.files[0]);
	}
</script>