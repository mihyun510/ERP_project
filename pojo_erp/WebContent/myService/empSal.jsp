<%@page import="org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> rlist = (List<Map<String,Object>>)request.getAttribute("allPayList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	<!--관리자 로그에 필요한 코드 시작=================================================================================-->
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous"/>
	
	<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css" />
	<link href="../common/main.css" rel="stylesheet" />
	<link href="../common/css/custom.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
	<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<title>2RP PROGRAM</title>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>급여 관리</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->
	
   <div id="t_table">
        <table class="table table-bordered table-hover" 
                       id="table" 
				 data-toggle="table"
				 data-pagination="true"
				 data-click-to-select="true"
				 data-show-toggle="true"
				 data-show-refresh="true"
				 data-show-columns="true"
		>
               
    <thead>
      <tr >
 
      	
        <th>날짜</th>
        <th>사원명</th>
        <th>부서</th>
        <th>직급</th>
        <th>기본급</th>
        <th>소득세</th>
        <th>주민세</th>
        <th>고용보험</th>
        <th>국민연금</th>
        <th>건강보험</th>
        <th>공제계</th>
        <th>실수령액</th>
       
      </tr>
    </thead>
    <tbody id="t_body">
    		
    		<% 
    		try{
    		for(int i=0; i<rlist.size(); i++){
    			Map<String,Object> rMap = rlist.get(i);
    		%>  		
    	<tr onclick="location.href='./monthPay.erp?SAL_PAYDAY=<%= rMap.get("SAL_PAYDAY")%>'">
    		
    		<td><%= rMap.get("SAL_PAYDAY") %></td>
    		<td><%= rMap.get("EMP_NAME") %></td>
    		<td><%= rMap.get("DEPT_NAME") %></td>
    		<td><%= rMap.get("EMP_POSITION") %></td>
    		<td><%= rMap.get("BASE_PAY") %></td>
    		<td><%= rMap.get("EI_PAY") %></td>
    		<td><%= rMap.get("HI_PAY") %></td>
    		<td><%= rMap.get("NP_PAY") %></td>
    		<td><%= rMap.get("IT_PAY") %></td>
    		<td><%= rMap.get("RD_PAY") %></td>
    		<td><%= rMap.get("TAX_SUM") %></td>
    		<td><%= rMap.get("RECEIPT") %></td> 	
    	</tr>

    		<%
    			}
    		for(int l=0; l<10-rlist.size(); l++){%>
    		
    		<tr>
    		
    		<td>-</td>
    		<td>-</td>
    		<td>-</td>
    		<td>-</td>
    		<td>-</td>
    		<td>-</td>
    		<td>-</td>
    		<td>-</td>
    		<td>-</td>
    		<td>-</td>
    		<td>-</td>
    		<td>-</td> 	
    	</tr>
    		<% 
    			
    		}
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    		%>
    </tbody>
  </table>
  </div>


     	
     			<!-- 컨텐츠 들어갈내용 끝   -->
     			</div>
			</div>
		</main>
	</div>
</div>


<!-- 슬라이드바 사용할때 필요 -->
	<!-- 슬라이드바 사용할때 필요 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!-- 탑메뉴 사용 -->
	<script src="../common/js/topNav.js?ver221"></script>
	<!-- 사이드 메뉴 사용 -->
	<script src="../common//js/sideNav.js?ver=0909r"></script>

	<script src="../common/scripts.js"></script>
	<!-- 버거 메뉴 활성화 -->
	
	<!-- 테이블 디폴트 10개 -->
</body>
</html>
