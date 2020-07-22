<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
	List<Map<String,Object>> rlist = (List<Map<String,Object>>)request.getAttribute("outsideWorker");
	Gson g = new Gson();
	String imsi = g.toJson(rlist);
	out.print(imsi);
%>