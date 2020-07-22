<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> myScheduleList = (List<Map<String,Object>>) request.getAttribute("myScheduleList");
	Gson g = new Gson();
	String rList = g.toJson(myScheduleList);
	out.print(rList);
%>
