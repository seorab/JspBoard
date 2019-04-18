<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String query = request.getParameter("query");
	if(query == null) {
		// 처음 페이지를 호출한 상태
		out.println("처음");
	} else {
		// 번역할 문장을 넘겨준 상태
		out.println(query);
	}
%>
<form method="post" action="trans.jsp">
	<input type="text" id="address" name="query">
	<button type="submit">지도 보기</button>
</form>

    
    
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function move() {
		address = $("#address").val();
		
		$.ajax( { 
			url: 'https://kapi.kakao.com/v1/translation/translate',
			type: 'get',
			beforeSend : function(xhr){
	            xhr.setRequestHeader("Authorization", "KakaoAK 0a7c5408897da72ef62213f279237f86");
	        },
			data: { 
				"src_lang" : "kr", 
				"target_lang" : "jp",
				"query" : address
			},
			success: function(result) {
				documents = result.documents;
				doc = documents[0];
				road_address = doc.road_address;
				x = road_address.x;
				y = road_address.y;
				console.log(x, y);
				map(y, x);
			}
		} );
	}
	function map(y, x) {
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(y, x), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(y, x); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	}
	
</script>








