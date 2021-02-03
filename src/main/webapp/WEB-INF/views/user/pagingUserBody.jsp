<%@page import="kr.or.ddit.user.model.PageVo"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>





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


<body>
	<form id="frm" action="${cp}/user/detailuser" >
		<input type="hidden" id="userid" name="userid" value="">
	</form>

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
						<a class="btn btn-primary" href="${cp }/user/excelDownload">사용자 엑셀다운로드</a>
						
						<div class="text-center">
							
							<ul class="pagination">
								
								<%-- pagination 값이 4이므로 1부터 4까지 4번 반복된다
								     전체 사용자수 : 16명
								     페이지 사이즈 : 5
								     전체 페이지 수 : 4페이지
								 --%> 
								 <li class="prev">
									<a href="${cp}/user/pagingUserTiles?page=1&pageSize=${pageVo.getPageSize()}">«</a>
								</li>
								<c:forEach begin="1" end="${pagination}" var="i">
									<c:choose>
										<c:when test="${pageVo.getPage() == i }">
											<li class="active"><span>${i }</span></li>
										</c:when>
										<c:otherwise>
										<li><a href="${cp}/user/pagingUserTiles?page=${i }&pageSize=${pageVo.getPageSize()}">${i }</a></li>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
								
								<li class="next">
									<a href="${cp}/user/pagingUserTiles?page=${pagination}&pageSize=${pageVo.getPageSize()}">»</a>
								</li>
							</ul>
						</div>
						</div>
					</div>
					<!-- /.blog-main -->
				</div>
	
</body>
</html>