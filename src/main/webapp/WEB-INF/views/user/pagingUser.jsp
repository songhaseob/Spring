<%@page import="kr.or.ddit.user.model.PageVo"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Main</title>
<style>
	table{
		text-align: center;
	}
	.th{
		text-align: center;
	}
</style>
<!-- Bootstrap core CSS -->
<%@include file="../common/common_lib.jsp"%>
<link href="${cp}/css/dashboard.css" rel="stylesheet">
<link href="${cp}/css/blog.css" rel="stylesheet">
<script>
// 문서 로딩이 완료되고 나서 실행되는 영역
$(function(){
	$('.user').on("click",function(){
		// this : 클릭 이벤트가 발생 한 element
		// data - 속성명 data-userid, 속성명은 대소문자 무시하고 소문자로 인식
		// data-userId ==> data-userid
		var userid = $(this).data("userid");
		$('#userid').val(userid);
		$('#frm').submit();
	});
});
</script>
</head>

<body>
	<form id="frm" action="${cp}/user/detailuser" >
		<input type="hidden" id="userid" name="userid" value="">
	</form>
	
	<!-- header -->
	<%@include file="../common/header.jsp"%>
	
	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar">
			<!-- left -->
			<%@include file="../common/left.jsp"%>
			</div>
			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<div class="blog-header">
					
				</div>

				<div class="row">

					<div class="col-sm-8 blog-main">

						<div class="blog-post">
							<h1>사용자현황</h1>
							<br>
							<table class="table table-striped">
								<tr>
									<th class="th">아이디</th>
									<th class="th">이름</th>
									<th class="th">별명</th>
									<th class="th">날짜</th>
								</tr>
								
							<c:forEach items="${userList}" var="user">
								<tr class="user" data-userid="${user.userid}">
									<td>${user.userid}</td>
									<td>${user.usernm}</td>
									<td>${user.alias}</td>
									<td><fmt:formatDate value="${user.reg_dt }" pattern="yyyy.MM.dd"/></td>
								</tr>
							</c:forEach>
						</table>
						
						
						<a class="btn btn-success" href="${cp }/user/registUser">사용자 등록</a>
						
						<div class="text-center">
							
							<ul class="pagination">
								
								<%-- pagination 값이 4이므로 1부터 4까지 4번 반복된다
								     전체 사용자수 : 16명
								     페이지 사이즈 : 5
								     전체 페이지 수 : 4페이지
								 --%> 
								 <li class="prev">
									<a href="${cp}/user/pagingUser?page=1&pageSize=${pageVo.getPageSize()}">«</a>
								</li>
								<c:forEach begin="1" end="${pagination}" var="i">
									<c:choose>
										<c:when test="${pageVo.getPage() == i }">
											<li class="active"><span>${i }</span></li>
										</c:when>
										<c:otherwise>
										<li><a href="${cp}/user//pagingUser?page=${i }&pageSize=${pageVo.getPageSize()}">${i }</a></li>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
								
								<li class="next">
									<a href="${cp}/user//pagingUser?page=${pagination}&pageSize=${pageVo.getPageSize()}">»</a>
								</li>
							</ul>
						</div>
						</div>
					</div>
					<!-- /.blog-main -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>