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

</head>

<body>
				<div class="row">

					<div class="col-sm-8 blog-main">

						<div class="blog-post">
							<h1>사용자현황(tiles)</h1>
							<br>
							<table class="table table-striped">
								<tr>
									<th class="th">아이디</th>
									<th class="th">이름</th>
									<th class="th">별명</th>
									<th class="th">날짜</th>
								</tr>
								
								<c:forEach items="${userlist}" var="user">
								<tr>
									<td>${user.userid}</td>
									<td>${user.usernm}</td>
									<td>${user.alias}</td>
									<td><fmt:formatDate value="${user.reg_dt }" pattern="yyyy.MM.dd"/></td>
								</tr>
								</c:forEach>						
						</table>
						
						<a class="btn btn-default pull-right">사용자 등록</a>

						<div class="text-center">
							<ul class="pagination">
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
							</ul>
						</div>
						</div>
					</div>
					<!-- /.blog-main -->
				</div>
	
</body>
</html>