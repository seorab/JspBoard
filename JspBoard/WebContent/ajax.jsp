<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<h1 onclick="move()">Hello~~</h1>
    
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function move() {
		$.ajax( { 
			url: 'http://ggoreb.com/ajax/jsonString2.jsp',
			type: 'get',
			data: {},
			success: function(result) {
				$("body").append(result);
// 				console.log(result);
			}
		} );
	}
</script>









