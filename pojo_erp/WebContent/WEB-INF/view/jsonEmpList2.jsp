<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="Application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> rList = (List<Map<String, Object>>)request.getAttribute("empList");
	Gson g = new Gson();
	out.print(g.toJson(rList));

	/* 	String imsi = g.toJson(rList);
	out.print(imsi); */
	
%>