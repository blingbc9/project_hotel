<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>내정보로그인</title>
    <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
		function confirm() {
			if($("#guest_pwd").val().trim() == ''){
				alert('비밀번호를 입력해주세요');
				$("#guest_pwd").focus();
				return;
			} else{
				$.ajax({
					type: "post",
					url : "myinfoLogin.do",
					data : {guest_pwd:$("#guest_pwd").val()},
					success:function(res){
						if(res=='true') {
							alert('환영합니다');
							console.log(res);
							$("#frm").submit();
						}else{
							alert('다시 입력하세요');
							console.log(res);
							$("#guest_pwd").val('');
							$("#guest_pwd").focus();
						}
						
					}
				});
			}
		};
	
	</script>
</head>
<style>
</style>
<body>
     <%@ include file="/WEB-INF/views/includes/G_header.jsp"  %>
    	<form id="frm" name="frm" method="post" action="myinfoModify.do">
            <div class="sub">
            	<div class="size">
                    <h1 class="sub_title">내정보관리</h1>
                        <p class="sub_a" style="text-align:center;" >GUEST</p>
                        <table class="board_write" border="1" solid="black" style="width:750px;  height:80px;  position:relative; left:18%;">
                        	<caption>회원수정로그인</caption>
                        	<tbody>
                        	<tr>
                        		<th>아이디</th>
                        		<td>${loginInfo.guest_id}</td>
                        		<td></td>
                        	</tr>
                        	<tr>
                        		<th>비밀번호</th>
                        		<td><input hidden="hidden" /><input type="password" id="guest_pwd" name="guest_pwd" /></td>
                        		<td><input type="button" href="javascript:;" onclick="confirm();" value="비밀번호확인" onsubmit="return false;" style="background-color:gray; color:white;"/></td>
                        	</tr>
                        	</tbody>
                        </table>
              		</div>
              </div>
       </form>
</body>
</html>