<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/mvc/multi/param" method="post">
	userid : <input type="text" name="userid" value="brown"/>
	userid : <input type="text" name="userid" value="sally"/>
	<input type="submit" value="전송">
	</form>
	<h1>List&lt;UserVo&gt;</h1>
	<form action="/mvc/multi/param" method="post">
	userid : <input type="text" name="userVoList[0].userid" value="brown"/><br>
	userid : <input type="text" name="userVoList[1].userid" value="sally"/><br>
	
	usernm : <input type="text" name="userVoList[0].userid" value="브라운"/><br>
	usernm : <input type="text" name="userVoList[1].userid" value="샐리"/><br>
	
	<input type="submit" value="전송">
	</form>
</body>
</html>