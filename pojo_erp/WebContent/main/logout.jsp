<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("emp_no")!= null){
	    session.invalidate(); // 모든세션정보 삭제
	    response.sendRedirect("http://localhost:5000/main/login.jsp");	
	}
%>
