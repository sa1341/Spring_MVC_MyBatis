<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#map_v3 {
	height: 600px;
	margin: 0 auto;
	max-width: 100%;
	width: 900px;
}
</style>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=cpw9RMOfkmb0qIa7Vz23&submodules=geocoder">
</script>
</head>
<body>
<div id="map_v3" class="hidden"></div>
	<!-- 이 div 에 지도가 생성됩니다. id 는 map_v3 로 설정해봤습니다. -->

<script type="text/javascript">

   
   var map = new naver.maps.Map('map_v3', {
       center: new naver.maps.LatLng(37.360486, 127.105002),
       zoom: 10,
       mapTypeControl : true
   });
   
   // 지도에 마커 추가하기
   
   // 마커 정의
   var marker = new naver.maps.Marker({
       position: new naver.maps.LatLng(37.360486, 127.105002),
       map: map
   
   });
   
   naver.maps.Event.addListener(map, 'click', function(e) {
       marker.setPosition(e.latlng);
   });
</script>
</body>
</html> 