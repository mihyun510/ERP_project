<%@page import="erp.work.DBConnect"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	DBConnect dbc = new DBConnect();
	List<Map<String,Object>> clist = dbc.select();
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
			{"c":[{"v":"<%=cmap.get("w_day").toString()%>","f":null},{"v":<%=Integer.parseInt(cmap.get("w_time").toString())%>,"f":null}]},
		<%
	    	}else {
		%>
		
			{"c":[{"v":"<%=cmap.get("w_day").toString()%>","f":null},{"v":<%=Integer.parseInt(cmap.get("w_time").toString())%>,"f":null}]}
		<%
		}
			}
		%>
	]
}