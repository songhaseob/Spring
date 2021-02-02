<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <%@include file="./common/common_lib.jsp"%>
    <%-- common_lib.jsp의 내용을 지금 기술되는 부분에 코드를 복사해서 붙여넣기 --%>
    
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="${cp}/css/signin.css" rel="stylesheet">
    
    <script>
    	//html 문서 로딩이 완료 되고 나서 실행 되는 코드
    	$(function(){
    	// userid, rememberme 쿠키를 확인하여 존재 할 경우 값 설정 체크
    		$('#userid').val(Cookies.get("userid"))
    		if(Cookies.get('rememberme')=='Y'){
    			$('#rememberme').attr("checked",true) 
    		}
    		
    	// singin 아이디를 select
    	$('#signin').on("click",function(){
    		if($("#rememberme").is(":checked")==true){
    		// userid input에 있는 값을 userid 쿠키로 저장
    		// rememberme 체크박스가 체크 되어있는지 확인
    		
    		// 체크 되었을 경우
    		Cookies.set("userid",$("#userid").val());
    		// rememberme 쿠키 Y 값을 저장
    		Cookies.set("rememberme","Y");
    			
    		// 체크 해제 되어 있는 경우 : 더이상 사용하지 않는다는 의미 이므로 userid, rememberme 쿠키 삭제
    		}else{
				Cookies.remove("userid");
				Cookies.remove("rememberme");
    		}
    		
    		// form태그를 이용하여 signin 요청
    		$("#frm").submit();
    	});
   
    	
    });
    	
    	/* function getCookieValue(cookieStr, cookieName){
    		var cookies = cookieStr.split(";");
    			for(var i in cookies){
    				var cookie  = cookies[i].split("=");
    				
    				if(cookie[0] == cookieName) {
    					return cookie[1];
    				}
    			}
    		
    		return "";
    	}
    	
    	// cookieName : 추가하고자 하는 쿠키 이름
    	// cookieValue : 쿠키의 값
    	// expires : 요효기간(일수)
    	function addCookie(cookieName, cookieValue, expires){
    		var dt = new Date(); // 지금 현재 날짜 ==> expires 만큼 미래날짜로 변경
    		dt.setDate(dt.getDate() + parseInt(expires));
    		console.log(dt)
    		
    		document.cookie = cookieName + "=" + cookieValue + ";"+ "path=/; expires=" + dt.toGMTString();
    	}
    	
    	function deleteCookie(cookieName){
    		addCookie(cookieName,"",-1);	
    	} */
    	/* //brown
    	var cookievalue = getCookieValue(document.cookie,"userid");
    	console.log(cookievalue); */
    	
    	//singin 아이디를 select
    	
    </script>
  </head>

  <body>

    <div class="container">
<%--     	cp : ${cp }<%=application.getAttribute("cp") %> --%>
      <form class="form-signin" id="frm" action="${cp }/login/process" method="POST">
        <h2 class="form-signin-heading">로그인 페이지</h2>
        <label for="user_id" class="sr-only">user_id</label>
        <input type="text" id="userid" name="userid" value="brown" class="form-control" placeholder="아이디를 입력하세요"><br>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="pass"  class="form-control" value="brownPass" placeholder="비밀번호를 입력하세요" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" id="rememberme" value="remember-me"> ID 저장하기
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="button" id="signin">로그인</button>
      </form>
      
    </div> <!-- /container -->
  </body>
</html>
