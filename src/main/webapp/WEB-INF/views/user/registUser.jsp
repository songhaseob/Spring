<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>user</title>

<!-- Bootstrap core CSS -->
<%@include file="../common/common_lib.jsp"%>
<link href="${cp}/css/dashboard.css" rel="stylesheet">
<link href="${cp}/css/blog.css" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	$('select[name=lang]').val("${param.Lang}")
	$('select[name=lang]').on("change",function(){
		console.log("on change");
		document.location="/user/registUser?lang=" + $(this).val();
	})
	// 주소검색 버튼이 클릭 되었을 때 다음 주소 api 팝업을 실행
	$('#addrBtn').on("click",function(){
		
    new daum.Postcode({
        oncomplete: function(data) {
        	
            $('#addr1').val(data.roadAddress); // 도로주소
            $('#zipcode').val(data.zonecode);    // 우편번호 
            
            // 사용자 편의성을 위해 상세주소 입력 input 태그로 focus 설정
            $('#addr2').focus();
            
        }
    }).open();
	})
	
	$('#samebtn').on("click",function(){
		var userid = $('#userid').val();
		$.ajax({
			url : "${cp}/registUser",
			type : "get",
			data : {
				"userid" : userid 
			},
			success : function(res) {
				
				if(res.cnt == 0 ){
					alert("사용가능한 아이디입니다.");
				}else{
					alert("중복된 아이디입니다.")
				}
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status)
			},
			dataType : "json"
		})
	})
	
	
})

</script>
</head>
<body>
<body>
	<%@include file="../common/header.jsp"%>
	
	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar">
			<!-- left -->
			<%@include file="../common/left.jsp"%>
			</div>
	</div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
		
			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			spring message : <spring:message code="LANG" arguments="brown"/>
			
				<form class="form-horizontal" role="form" action="${cp}/user/insertUser" method="POST" enctype="multipart/form-data">
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label"></label>
						<div class="col-sm-8">
								<input type="text" class="form-control" id="userid" name="userid"
						placeholder="사용자 아이디" ><br>
						<span style="color:red"><form:errors path="UserVo.userid"/></span>
						<input type="file" class="form-control" name="file"><br>
						</div>
						<div class="col-sm-2">
						<button type="button" id="samebtn" class="btn btn-default">중복 검사</button>
						</div>
						
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
						<div class="col-sm-10">
								<input type="text" class="form-control" id="usernm" name="usernm"
						placeholder="사용자 이름" >
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">별명</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userAlias" name="alias"
						placeholder="사용자 아이디" >
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="pass" name="pass"
						placeholder="사용자비밀번호" >
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">우편번호</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="zipcode" name="zipcode"
						placeholder="우편번호"  readonly>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">도로주소</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="addr1" name="addr1"
						placeholder="주소" readonly>
						</div>
						<div class="col-sm-2">
						<button type="button" id="addrBtn" class="btn btn-default">주소 검색</button>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">상세주소</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="addr2" name="addr2"
						placeholder="상세주소">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">사용자등록</button>
							
						</div>
					</div>
				</form>
				
				<select name="lang">
								<option value="">언어설정</option>
								<option value="ko">한국어</option>
								<option value="en">영어</option>
			    </select>

			</div>
		</div>
	</div>
</body>
</html>