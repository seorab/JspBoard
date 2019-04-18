<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<form method="post" action="signup_proc.jsp">
	ID : <input type="text" name="id" onblur="move()"><br>
	PW : <input type="password" name="pw"><br>
	이름 : <input type="text" name="name"><br>
	<input type="submit" value="회원가입">
</form>
<div id="result"></div>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function move() {
		$.ajax( { 
// 			url: 'https://www.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyAguR7EAV3Opynrl0VyW38dls-4YbRyKMs&q=원피스',
			url: 'idcheck.jsp',
			type: 'get',
			data: { "id" : $('input[name=id]').val() },
			success: function(result) {
				$("#result").html(result);
// 				console.log(result);
			}
		} );
	}
</script>

