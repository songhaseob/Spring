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
	
	pagingUserAjax(1,5);
	
	
	$('#userTbody').on("click",".user",function(){
		// this : 클릭 이벤트가 발생 한 element
		// data - 속성명 data-userid, 속성명은 대소문자 무시하고 소문자로 인식
		// data-userId ==> data-userid
		var userid = $(this).data("userid");
		$('#userid').val(userid);
		$('#frm').submit();
	});
});

function pagingUserAjax(page,pageSize){
	//ajax를 통해 사용자 리스트를 가져온다:1page, 5pageSize
	$.ajax({
// 		url :"/user/pagingUserAjax",
		url : "/user/pagingUserAjaxHtml",
		data : "page="+page+"& pageSize="+pageSize,
		success : function(data){
// 			var html = "";
// 			$.each(data.userList,function(i,user){
// 				html +=" <tr class='user' data-userid='"+user.userid+"'>";
// 				html +="			<td>"+ user.userid +"</td>        ";
// 				html +="			<td>"+ user.usernm+"</td>        ";
// 				html +="			<td>"+ user.alias+"</td>        ";
// 				html +="			<td>"+ user.reg_dt_fmt+"</td>        ";
// 				html +="	    </tr>                ";
// 			})
			var html = data.split("####################");
			$('#userTbody').html(html[0]);
			$('#pagination').html(html[1]);
		}
	})
}
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
								<tbody id="userTbody">
								</tbody>
						</table>
						
						
						<a class="btn btn-success" href="${cp }/user/registUser">사용자 등록</a>
						<a class="btn btn-primary" href="${cp }/user/excelDownload">사용자 엑셀다운로드</a>
						
						<div class="text-center">
							
							<ul class="pagination" id="pagination">
								
								
							</ul>
						</div>
						</div>
					</div>
					<!-- /.blog-main -->
				</div>
	
</body>
</html>