<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <head>
    <meta charset="utf-8" />
    <title>Hotel Detail</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
	<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
    <link href="/hotel/css/hotel/hotelView.css" rel="stylesheet" type="text/css">
    

  </head>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5d133f411d7216df47f409d9f8b79bd"></script>

	

  <%@ include file="/WEB-INF/views/includes/G_header.jsp"  %>
  <!-- 찜하기 제이쿼리 -->
  <script src="/hotel/script/heart.js"></script>

  <body>
	<div class ="detail_full_screen">
		<div id="hotel_screen">
	  		<div class="hotelName">${hotel.hotel_name}</div>
	  		<!-- 별점찍기 구현_원표 -->
	  		<div class="star-ratings" style="text-align: center; display: inline-block; margin-left: 330px;">
				<div class="star-ratings-fill space-x-2 text-lg" style="width: ${hotel.avgScore/5*100}%;">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
				<div class="star-ratings-base space-x-2 text-lg">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
				<span>(${hotel.avgScore })</span>
			</div>
	  		
	  		<!-- END 별점찍기 -->
	  		<!-- "찜하기" 구현_빛찬_220822 -->
	  		<c:if test="${!empty rev }">
		  		<div class="heart" style="z-index: 1000;" >
					<img class="like"  data-name="del" data-gno="${rev.guest_no}" data-hno="${rev.hotel_no}" src="/hotel/image/mypage/heart.png" style="width:50px; height: 50px;" >
				</div>
	  		</c:if>
	  		<c:if test="${empty rev }">
		  		<div class="heart" style="z-index: 1000;" >
					<img class="like"  data-name="fav" data-gno="${loginInfo.guest_no }" data-hno="${hotel.hotel_no}" src="/hotel/image/mypage/emptyHeart.png" style="width:50px; height: 50px;" >
				</div>
	  		</c:if>
		  	<!-- END-"찜하기" 구현_빛찬_220822  -->
		  	<div class="swiper mySwiper" id="Low" style="display: inline-block; height: 350px;">
		  		<div class="swiper-wrapper" >
				  	<c:forEach var="hotelImage" items="${hotelImage}">
				  		<div class="swiper-slide" id="imgBox"><img alt="사진없음" src="/hotel/image/hotel/hotelOne/${hotelImage.filename_org}"></div>
				  	</c:forEach>
		  		</div>
		  		<div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			    <div class="swiper-pagination"></div>
			</div>
			<div id="map" style="width:500px;height:250px;display: inline-block;vertical-align: middle; z-index: -999"></div>

	  		<div class="middleBox" style="text-align: center;">
	  			<span>객실 안내/예약</span>
	  		</div>
  		</div>
  		
  		<!-- 객실리스트 -->
  		<div class="room_Screen">
  			<c:forEach var="roomList" items="${room}">
  			<div class="lowDiv">
		  		<div class="swiper mySwiper" id="Low" style="display: inline-block;">
	      			<div class="swiper-wrapper" >
	      				<c:forEach var="roomImage" items="${roomList.imageList}">
	        			<div class="swiper-slide" id="imgBox"><img alt="객실이미지" src="/hotel/image/room/hotelOne/${roomImage.filename_org }"></div>
	        			</c:forEach>
	      			</div>
			      	<div class="swiper-button-next"></div>
			      	<div class="swiper-button-prev"></div>
			      	<div class="swiper-pagination"></div>
	    		</div> 
		    	<div id="infoBox" style="display: inline-block;">
		    		<div id="infoContent"><span>객실명: </span><span style="font-weight: bold;">${roomList.room_name}</span></div>
		    		<div id="infoContent"><span>객실비용: </span><span style="font-weight: bold;"><fmt:formatNumber value="${roomList.room_price}" pattern="#,###"/></span></div>
		    		<div id="infoContent"><span style="font-weight: bold;">서비스 및 편의시설 </span><span><pre>${roomList.room_content}</pre></span></div>
		    		<div id="reservBtn"><input type="button" onclick="location.href='/hotel/main/roomView.do?room_no=${roomList.room_no}&hotel_no=${hotel.hotel_no }'" value="객실정보 확인 및 예약" style="margin-left: 330px;"></div>
				</div>
			</div>		
			</c:forEach> 
		</div>
	</div>
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        cssMode: true,
        loop: true,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        pagination: {
          loop: true,
          el: ".swiper-pagination",
        },
        mousewheel: true,
        keyboard: true,
      });
    </script>
	<script>
		console.log(${hotel.lat})
		var container = document.getElementById('map');
		var options = {
						center: new kakao.maps.LatLng(${hotel.lat}, ${hotel.lot}),
						level: 3
					  };
		var map = new kakao.maps.Map(container, options);
		var markerPosition  = new kakao.maps.LatLng(${hotel.lat}, ${hotel.lot}); 
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
	</script>	
  </body>