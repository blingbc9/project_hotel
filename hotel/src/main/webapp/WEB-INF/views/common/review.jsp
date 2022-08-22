<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Hotel Reivews</title>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    

<style type="text/css">
	.score{
		position: absolute;
		right: 20px;
		top: 10px;
		font-size: 20px;
	}
	#score{
		position: absolute;
		right: 20px;
		top: 10px;
		font-size: 20px;
	}
	.outer-div{
		display: flex;
		justify-content: center;
		margin: 30px 0 30px 0;
	}
	.outer-div-modi{
		display: flex;
		justify-content: center;
		margin: 30px 0 30px 0;
	
	}
	body form{
		display: flex;
		justify-content: center;
	}
	#card-content{
		font-size: 15px;
		margin-top: 5%;
	
	}
	.content-box{
		border: 1px solid gray; 
		width: 100%; 
		height: 80px; 
		margin-top: 5px;
	}
	.card{
		position: relative;
	}
	.btn-box{
		position: absolute;
		right: 20px;
		bottom: 20px;
	}
	.outer-div-modi{
		display: flex;
		justify-content: center;
		display: none;
		
	}
	.outer-div-modi .card{
		border: 5px solid black; 
	}
	
	textarea{
		width: 100%;
	    height: 6.25em;
	    border: 1px solid black;
	    resize: none;
	}
	
</style>
</head>

<body>

<c:forEach var="rv" items="${rv.list }">
	
	
	<div class="outer-div" id="outer-div${rv.review_no }">
	
		<div class="card mb-3" style="width: 700px; height: 210px; ">
				<div class="row g-0">
					<div class="col-md-4">
					<c:if test="${!empty rv.img.filename_real }">
						<img src="/hotel/upload/${rv.img.filename_real }" class="img-fluid rounded-start" alt="..." width="200px">
					</c:if>
					<c:if test="${empty rv.img.filename_real }">
						<img src="/hotel/image/hotel/ex_room.jpg" class="img-fluid rounded-start" alt="..." width="200px">
					</c:if>
					
					</div>
				
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title"> ${rv.review_title }</h5>
							
							<div id="score">
								<img alt="평점 :" src="/hotel/image/mypage/star.png" width="30px"> ${rv.review_score }점
							</div>
							<div>
								호텔  ${rv.hotel_name }
							</div>
							
							<div class="content-box" >
								<p class="card-text" >
									<div id="card-content">
										<pre>${rv.review_content }</pre>
									</div>
								</p>
							</div>
							
							<p class="card-text">
								<small class="text-muted">
									작성일 &nbsp;<fmt:formatDate value="${rv.review_regdate }" pattern="yyyy-MM-dd"/>
								</small>
							</p>
							
						</div>
					</div>
				</div>
							<div class="btn-box">
								<button class="btn" onclick="modi(${rv.review_no })" >수정</button>
								<button class="btn" onclick="del(${rv.review_no })">삭제</button>
							</div>
			</div>
		</div>
		
		
		
		
		
		<!-- 수정 BOX!! -->
		<form method="post" id="form${rv.review_no }" action="../review/update.do">
		
			<div class="outer-div-modi" id="outer-div-modi${rv.review_no }">
			<input type="hidden" name="review_score" id="${rv.review_no }" value="${rv.review_score }">
			<input type="hidden" name="review_no" value="${rv.review_no }">
			<input type="hidden" name="hotel_no" value="${rv.hotel_no }">
			<input type="hidden" name="room_no" value="${rv.room_no }">
		
			<div class="card mb-3" style="width: 700px; height: 210px; ">
					<div class="row g-0">
						<div class="col-md-4">
						<c:if test="${!empty rv.img.filename_real }">
							<img src="/hotel/upload/${rv.img.filename_real }" class="img-fluid rounded-start" alt="..." width="200px">
						</c:if>
						<c:if test="${empty rv.img.filename_real }">
							<img src="/hotel/image/hotel/ex_room.jpg" class="img-fluid rounded-start" alt="..." width="200px">
						</c:if>
						
						</div>
					
						<div class="col-md-8" >
							<div class="card-body">
								제목: <input class="card-title" name="review_title" value="${rv.review_title }">
								
								<div class="score">
									<img src="/hotel/image/mypage/emptyStar_icon.png" data-review_no="${rv.review_no }" width="25px">
									<img src="/hotel/image/mypage/emptyStar_icon.png" data-review_no="${rv.review_no }" width="25px">
									<img src="/hotel/image/mypage/emptyStar_icon.png" data-review_no="${rv.review_no }" width="25px">
									<img src="/hotel/image/mypage/emptyStar_icon.png" data-review_no="${rv.review_no }" width="25px">
									<img src="/hotel/image/mypage/emptyStar_icon.png" data-review_no="${rv.review_no }" width="25px">
								</div>
								
								<div>
									호텔:  ${rv.hotel_name }
								</div>
											
									<textarea name="review_content">${rv.review_content }</textarea>
											
								
								<p class="card-text">
									<small class="text-muted">
										작성일 &nbsp;<fmt:formatDate value="${rv.review_regdate }" pattern="yyyy-MM-dd"/>
									</small>
								</p>
					<div class="btn-box">
						<button class="btn" type="submit" >수정하기</button>
						<button type="button" class="btn btn-cancel"  >취소</button>
					</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- End-수정!! -->

	</c:forEach>

</body>
</html>