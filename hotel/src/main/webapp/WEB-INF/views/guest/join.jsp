<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>회원가입</title>
    
   <link rel="stylesheet" href="/hotel/css/reset.css"/>
    <link rel="stylesheet" href="/hotel/css/contents.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
    	function goSave() {
    		if ($("#guest_id").val().trim() == '') {
    			alert('아이디를 입력해 주세요');
    			$("#guest_id").focus();
    			return;
    		}
    		if ($("#guest_email").val().trim() == '') {
    			alert('이메일을 입력해 주세요');
    			$("#guest_email").focus();
    			return;
    		}
    		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    		if(!reg_email.test($("#guest_email").val())) {
    			alert('이메일 형식이 올바르지 않습니다.');
    			return;
    		}
    		var isCon = true;
    		$.ajax({
				url : 'emailDupCheck.do',
				data:{guest_email:$("#guest_email").val()},
				async:false,
				success:function(res) {
					if (res == 'true') {
						alert('입력한 이메일이 중복되었습니다. 다른 이메일을 입력해 주세요.');
						$("#guest_email").val('');
						$("#guest_email").focus();
						isCon = false;
						//return;
					}
				}
			});
    		$.ajax({
				url : 'idDupCheck.do',
				data:{guest_id:$("#guest_id").val()},
				async:false,
				success:function(res) {
					if (res == 'true') {
						alert('입력한 아이디가 중복되었습니다. 다른 아이디를 입력해 주세요.');
						$("#guest_id").val('');
						$("#guest_id").focus();
						isCon = false;
						//return;
					}
				}
			});
    		$.ajax({
    			url : 'hpDupCheck.do',
    			data : {guest_hp:$("#guest_hp").val()},
    			async:false,
    			success:function(res) {
    				if (res =='true') {
    					alert('입력한 휴대폰번호가 중복되었습니다. 다른 번호를 입력해 주세요');
    					$("#guest_hp").val('');
    					$("#guest_hp").focus();
    					isCon = false;
    				}
    			}
    		});
    		if (!isCon) return;
    		if ($("#guest_pwd").val().trim() == '') {
    			alert('비밀번호를 입력해 주세요');
    			$("#guest_pwd").focus();
    			return;
    		}
    		var reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
    		if( !reg_pwd.test($("#guest_pwd").val()) ) {
    			alert("비밀번호는 영문,숫자,특수문자 조합으로 8자 이상 입력하세요.");
    			return;
    		}
    		if ($("#guest_pwd").val() != $("#guest_pwd_check").val()) {
    			alert('비밀번호를 확인해주세요.');
    			$("#guest_pwd_check").focus();
    			return;
    		}
    		if ($("#guest_name").val().trim() == '') {
    			alert('이름을 입력해 주세요');
    			$("#guest_name").focus();
    			return;
    		}
    		if ($("#guest_hp").val().trim() == ''){
    			alert('휴대폰번호를 입력해 주세요');
    			$("#guest_hp").focus();
    			return;
    		}
    		$("#frm").submit();
    		alert('가입을 축하드립니다');
    		
    	}
    	$(function(){
    		$("#edupCheckBtn").click(function(){
    			if ($("#guest_email").val().trim() == '') {
    				alert('이메일을 입력해 주세요');
    				$("#guest_email").focus();
    			} else {
	    			$.ajax({
	    				url : 'emailDupCheck.do',
	    				data:{guest_email:$("#guest_email").val()},
	    				success:function(res) {
	    					if (res == 'true') {
	    						alert('사용 불가');
	    					} else {
	    						alert('사용 가능');
	    					}
	    				}
	    			});
    			}
    		});
    		$("#idupCheckBtn").click(function(){
    			if ($("#guest_id").val().trim() == '') {
    				alert('아이디를 입력해 주세요');
    				$("#guest_id").focus();
    			} else {
	    			$.ajax({
	    				url : 'idDupCheck.do',
	    				data:{guest_id:$("#guest_id").val()},
	    				success:function(res) {
	    					if (res == 'true') {
	    						alert('사용 불가');
	    					} else {
	    						alert('사용 가능');
	    					}
	    				}
	    			});
    			}
    		});
    		$("#hpdupCheckBtn").click(function(){
    			if ($("#guest_hp").val().trim() == '') {
    				alert('휴대폰번호를 입력해 주세요');
    				$("#guest_hp").focus();
    			} else{
    				$.ajax({
    					url : 'hpDupCheck.do',
    					data:{guest_hp:$("#guest_hp").val()},
    					success:function(res) {
    						if (res == 'true') {
    							alert('사용 불가');
    						} else {
    							alert('사용 가능');
    						}
    					}
    				});
    			}
    		});
    	
    		$( "#birthday" ).datepicker({
                dateFormat: 'yymmdd' //Input Display Format 변경
                    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                    ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                    ,changeYear: true //콤보박스에서 년 선택 가능
                    ,yearRange: "c-100:c+10"
                    ,changeMonth: true //콤보박스에서 월 선택 가능                
                    ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                    ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                    ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                    ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                    ,minDate: "-120Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                    ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
                });
    		
    		
    	});
    	function bankCheck() {
        		$.ajax({
        			url: "realNameApi.do",
        			type:"POST",
        			data : 
        			{
        				  bank_code_std: $("#bank").val(),
        				  account_num: $("#account_num").val(),
        				  account_holder_info: ($("#birthday").val()).substring(2,8),
        			},
        			  success: function(res) {
        				  if(res) {
        					alert('인증되었습니다.코드넘버:${code}${JSON}');
        					console.log(res);
        				  } else{
        					 alert('인증 실패하였습니다');
        					 console.log(res);
        				  }
        			  }
        	});
    	};
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function zipcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                	addr += extraAddr;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode;
	                document.getElementById("guest_addr1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("guest_addr2").focus();
	            }
	        }).open();
	    }
	</script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/G_header.jsp"/> 
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">GUEST 회원가입</h3>
                <form name="frm" id="frm" action="join.do" method="post">
                <table class="board_write">
                    <caption>회원가입</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                    	<tr>
                            <th>*ID</th>
                            <td>
                                <input type="text" name="guest_id" id="guest_id" class="inNextBtn" style="float:left;">
                                <span class="guest_id_check"><a href="javascript:;"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="idupCheckBtn">중복확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>*이메일</th>
                            <td>
                                <input type="text" name="guest_email" id="guest_email" class="inNextBtn" style="float:left;">
                                <span class="guest_email_check"><a href="javascript:;"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="edupCheckBtn">중복확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>*비밀번호</th>
                            <td><input type="password" name="guest_pwd" id="guest_pwd" style="float:left;"> <span class="ptxt">비밀번호는 숫자, 영문, 특수문자 조합으로 8자 이상으로 입력해주세요.</span> </td>
                        </tr>
                        <tr>
                            <th>*비밀번호<span>확인</span></th>
                            <td><input type="password" name="guest_pwd_check" id="guest_pwd_check" style="float:left;"></td>
                        </tr>
                        <tr>
                            <th>*이름</th>
                            <td><input type="text" name="guest_name" id="guest_name" style="float:left;" maxlength="5" required> </td>
                        </tr>                   
                        <tr>
                            <th>*휴대폰 번호</th>
                            <td>
                                <input type="text" name="guest_hp" id="guest_hp" value=""  maxlength="15" style="float:left;">
                            	<span class="guest_hp_check"><a href="javascript:;" class="btn bgGray" style="float:left; width:auto; clear:none;" id="hpdupCheckBtn">중복확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th rowspan="3">주소</th>
                            <td>
                                <input type="text" name="zipcode" id="zipcode" class="inNextBtn" style="float:left;" readonly>
                                <span class="email_check"><a href="javascript:zipcode();"  class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            	<input type="text" name="guest_addr1" id="guest_addr1" style="width:80%" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            	<input type="text" name="guest_addr2" id="geust_addr2" style="width:80%">
                            </td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><input type="text" name="guest_birth" id="birthday" style="float:left;" autocomplete="off"></td>
                        </tr>   
                        <tr>
                            <th>은행</th>
                            <td>
                            	<div class="select_pack">
									<select name="bank_code" id="bank" required="required" style="height:30px;">
										<option value="218">KB증권 (218)</option>
										<option value="227">KTB투자증권 (227)</option>
										<option value="238">미래에셋증권 (238)</option>
										<option value="240">삼성증권 (240)</option>
										<option value="243">한국투자증권 (243)</option>
										<option value="247">NH투자증권 (247)</option>
										<option value="261">교보증권 (261)</option>
										<option value="262">하이투자증권 (262)</option>
										<option value="263">현대차증권 (263)</option>
										<option value="264">키움증권 (264)</option>
										<option value="265">이베스트투자증권 (265)</option>
										<option value="266">SK증권 (266)</option>
										<option value="267">대신증권 (267)</option>
										<option value="269">한화투자증권 (269)</option>
										<option value="270">하나금융투자 (270)</option>
										<option value="271">토스증권 (271)</option>
										<option value="278">신한금융투자 (278)</option>
										<option value="279">DB금융투자 (279)</option>
										<option value="280">유진투자증권 (280)</option>
										<option value="287">메리츠증권 (287)</option>
										<option value="296">오픈증권 (296)</option>
										<option value="002">산업 (002)</option>
										<option value="003">기업 (003)</option>
										<option value="004">국민 (004)</option>
										<option value="007">수협 (007)</option>
										<option value="011">농협 (011)</option>
										<option value="012">농협중앙 (012)</option>
										<option value="020">우리 (020)</option>
										<option value="023">SC제일 (023)</option>
										<option value="027">씨티 (027)</option>
										<option value="031">대구 (031)</option>
										<option value="032">부산 (032)</option>
										<option value="034">광주 (034)</option>
										<option value="035">제주 (035)</option>
										<option value="037">전북 (037)</option>
										<option value="039">경남 (039)</option>
										<option value="045">새마을 (045)</option>
										<option value="048">신협 (048)</option>
										<option value="050">상호저축 (050)</option>
										<option value="064">산림조합 (064)</option>
										<option value="071">우체국 (071)</option>
										<option value="081">KEB하나 (081)</option>
										<option value="088">신한 (088)</option>
										<option value="089">케이뱅크 (089)</option>
										<option value="090">카카오 (090)</option>
										<option value="092">토스 (092)</option>
										<option value="097">오픈 (097)</option>
									</select>
								</div>
							</td>
                        </tr>
                        <tr>
                            <th>계좌번호</th>
                            <td>
                                <input type="text" name="g_accountno" id="account_num" value="${data.account_num}"  maxlength="20" style="float:left;" />
                                <span class="guest_accountno_check"><a href="javascript:;" onclick="bankCheck()"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="bankCheck"
                                 >계좌확인</a></span>
                            </td>
                        </tr>
          	
                        <tr>
                            <th>성별</th>
                            <td>
                            <select name="g_gender" id="g_gender" style="height:30px;">
                            <option value="1">남성</option>
                            <option value="2">여성</option>
                            </select> 
                            </td>
                        </tr>
                    </tbody>
                </table>
                        <input type="hidden" name="guest_checkEmail" id="guest_checkEmail" value="0"/>
                </form>
                <!-- //write--->
                <div class="btnSet clear">
                	<div>
                    	<a class="btn bgGray" href="javascript:;"  onclick="goSave()">가입</a> &nbsp;&nbsp;
                    	<a class="btn bgGray" href="javascript:;"  onclick="history.back()">취소</a> &nbsp;&nbsp;
                    	<a class="btn bgGray" href="login.do" >로그인 </a>
                    </div>
                </div>
                
            </div>
        </div>
        
</body>
</html>