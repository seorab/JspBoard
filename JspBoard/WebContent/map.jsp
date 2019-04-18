<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7afa81dd64fc9dd5e00fa18dfd8e7f83"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function move() {
		$.ajax( { 
			url: 'https://dapi.kakao.com/v2/local/search/address.json',
			type: 'get',
			beforeSend : function(xhr){
	            xhr.setRequestHeader("Authorization", "KakaoAK 0a7c5408897da72ef62213f279237f86");
	        },
			data: { "query" : "용인 처인구 원천로 11-110" },
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
	}
	
</script>








