<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% UserVo uservo = (UserVo)request.getAttribute("userid");
	
	if(uservo == null){%>
		{
		"cnt" : "0"
		}
		<% 
	}else{%>
		
		{
		"cnt" : "1"
		}
		
	<% }%>

