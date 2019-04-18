<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="messageWindow"></div>
<br>
<input id="inputMessage" type="text">
<input type="submit" value="send" onclick="send()">
 
<script src='http://code.jquery.com/jquery-3.1.1.min.js'></script>
<script>
	var nickname = prompt('사용할 닉네임을 입력해주세요.');

	var webSocket = new WebSocket('ws://' + window.location.host + '/JspBoard/chat');

	webSocket.onerror = function(event) {
		onError(event)
	};
	function onError(event) {
		alert(event.data);
	}
	
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	function onOpen(event) {
		$("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
	}
	
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	function onMessage(event) {
		var data = $.parseJSON(event.data);
		$("#messageWindow").append(data.msg + "<br>");
	}

	function send() {
		var inputMessage = $("#inputMessage").val();
		webSocket.send('[' + nickname + '] : ' + inputMessage);
		$("#inputMessage").val("");
	}

</script>    






