<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action='<c:url value="/user/login"/>' method="post">
		 <input type="text" name="email" id="email"/>
		 <input type="password" name="passwd" id="passwd"/>
		 <input type="submit" value="완료">
	</form>
</body>
</html>