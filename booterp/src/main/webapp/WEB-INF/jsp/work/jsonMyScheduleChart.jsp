<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//number로 받아야되는데 프로시져가 9:00이런식으로 반환해서 차트를 그릴수가 없다.
	List<Map<String,Object>> clist = (List<Map<String,Object>>)request.getAttribute("myScheduleChart");
	System.out.println("clist: "+clist.size());
	if(clist == null || clist.size() == 0) {
%>
{
	"cols": [
		{"id":"","label":"SCHEDULE","pattern":"","type":"string"},
		{"id":"","label":"TIME","pattern":"","type":"number"}
	],   
	"rows": [
			{"c":[{"v":"일정이 없습니다.","f":null},{"v":100,"f":null}]}
	]
}
<%
	}else if(clist != null && clist.size() > 0){
%>
{
	"cols": [
		{"id":"","label":"SCHEDULE","pattern":"","type":"string"},
		{"id":"","label":"TIME","pattern":"","type":"number"}
	
	],   
	"rows": [
	<%
		for (int i=0; i < clist.size(); i++){
			Map<String, Object> cmap = clist.get(i);
	    	if(i<clist.size()-1){
	  
    %>
			{"c":[{"v":"<%=cmap.get("title")%>","f":null},{"v":<%=Integer.parseInt(cmap.get("TIME").toString())%>,"f":null}]},
		<%
	    	}else {
		%>
		
			{"c":[{"v":"<%=cmap.get("title")%>","f":null},{"v":<%=Integer.parseInt(cmap.get("TIME").toString())%>,"f":null}]}
		<%
		}
			}
		%>
	]
}
<%
	}
%> 









