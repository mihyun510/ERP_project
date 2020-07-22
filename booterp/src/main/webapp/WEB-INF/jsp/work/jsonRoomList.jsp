<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> roomList =(List<Map<String,Object>>) request.getAttribute("roomList");
	Gson g = new Gson();
	String rList = g.toJson(roomList);
	out.print(rList);
%>