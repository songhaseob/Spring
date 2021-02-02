<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>
	img{
		width: 100px;
		height: 100px;
	}
	
</style>

<!-- Bootstrap core CSS -->
<%@include file="../common/common_lib.jsp"%>
<link href="${cp}/css/dashboard.css" rel="stylesheet">
<link href="${cp}/css/blog.css" rel="stylesheet">
<script>
	$(function(){
		$('#modifyBtn').on("click",function(){
			$('#frm').attr("method","get");
			$('#frm').attr("action","${cp}/user/modifyuser");
			$('#frm').submit();
			
		})
		$('#deleteBtn').on("click",function(){
			$('#frm').attr("method","post");
			$('#frm').attr("action","${cp}/user/deleteUser");
			$('#frm').submit();
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
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">JSP/SPRING</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Dashboard</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>
					<li><a href="#">Help</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
		
			
		
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

			
				<form class="form-horizontal" id="frm" role="form">
					<input type="hidden"  name="userid" value="${detaillist.userid }">
					
					<div class="form-group">
						<label id="img" for="userNm" class="col-sm-2 control-label">사용자 사진</label>
						<div class="col-sm-10">
								<%-- <img src="${cp}/profile/${uservo.userid }.png"> --%>
								<a href="/profileDownload?userid=${detaillist.userid }">
									<img src="${cp}/profile?userid=${detaillist.userid }">
								</a>
								
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 아이디</label>
						<div class="col-sm-10">
								<label class="control-label">${detaillist.userid }</label>
						</div>
					</div>


					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
						<div class="col-sm-10">
								<label class="control-label">${detaillist.usernm }</label>
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">별명</label>
						<div class="col-sm-10">
							<label class="control-label">${detaillist.alias }</label>
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<label class="control-label">${detaillist.pass }</label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">등록일시</label>
						<div class="col-sm-10">
							<label class="control-label"><fmt:formatDate value="${detaillist.reg_dt }" pattern="yyyy.MM.dd"/></label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">우편번호</label>
						<div class="col-sm-10">
							<label class="control-label">${detaillist.zipcode }</label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">도로주소</label>
						<div class="col-sm-10">
							<label class="control-label">${detaillist.addr1 }</label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">상세주소</label>
						<div class="col-sm-10">
							<label class="control-label">${detaillist.addr2 }</label>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<%-- 사용자 수정 : method : get action= ${cp}/userModify
								 사용자 삭제 : method : post action= ${cp}/deleteUse 
								 파라미터는 둘다 userid 하나만 있으면 가능
							--%>
							<button type="button" id="modifyBtn" class="btn btn-primary">사용자 수정</button>
							<button type="button" id="deleteBtn" class="btn btn-danger">사용자 삭제</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>