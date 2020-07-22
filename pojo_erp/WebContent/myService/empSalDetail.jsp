<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	List<Map<String,Object>> rlist = (List<Map<String,Object>>)request.getAttribute("monthPayList");
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

<title>2RP PROGRAM</title>

<script type="text/javascript">
//<![CDATA[
function printPage(){
 var initBody;
 window.onbeforeprint = function(){
  initBody = document.body.innerHTML;
  document.body.innerHTML =  document.getElementById('print').innerHTML;
 };
 window.onafterprint = function(){
  document.body.innerHTML = initBody;
 };
 window.print();
 return false;
}
//]]>
</script>
</head>
<body class="sb-nav-fixed">
<% 
  try{
  Map<String,Object> rMap = rlist.get(0);
 %>
	<nav id="topNav"></nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav"></div>
		<div id="layoutSidenav_content">
			<main id="input_div">
				<div id="frame_div" style="border: 1px solid black;">
					<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
						<h2>상세 급여</h2>
					</div>
					<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->
						<div style="text-align: right; margin-bottom: 20px">
							<button class="btn btn-secondary" onclick="printPage()">인쇄</button>
							<button class="btn btn-secondary" onclick="location.href='http://localhost:5000/myService/allPay.erp'">돌아가기</button>
						</div>
						<div class="container"style="  overflow: scroll;" id="print">
<table class="table table-bordered table-sm thead-light"style="border: solid 1px; width: 950px; height: 100%; text-align: center;">
	<thead>
		<tr>
			<th style="padding-top: 60px; font-size: 45px;">우리를 JAVA 급여 명세서</th>
		</tr>
		<tr>
			<td style="text-align: -webkit-center; padding-top: 35px;">
				<table style="border-collapse: collapse; width: 900px; text-align: center;">
					<thead>
					<!-- =============================================================================================================== -->
						<tr>
							<td colspan="4" style="text-align: right; padding-right: 20px;padding-bottom: 5px;"> 지급일자 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rMap.get("SAL_PAYDAY") %></td>
						</tr>
						<tr>
							<td style="height:30px;">사번</td>
							<td style="">A1234</td>
							<td style="">성명</td>
							<td style=""><%=rMap.get("EMP_NAME") %></td>
						</tr>
						<tr>
							<td style="height:30px;">부서</td>
							<td style=""><%=rMap.get("DEPT_NAME") %></td>
							<td style="">직책/직급</td>
							<td style=""><%=rMap.get("EMP_POSITION") %></td>
						</tr>
					<!-- =============================================================================================================== -->
						<tr>
							<td colspan="4" style="text-align: left; padding-left: 20px; padding-top:25px;padding-bottom: 5px;"> 급여계좌</td>
						</tr>
						<tr>
							<td style="height:30px;">은행</td>
							<td style=""><%=rMap.get("EMP_BANK") %></td>
							<td style="">계좌번호</td>
							<td style=""><%=rMap.get("EMP_ACCOUNT") %></td>
						</tr>
					<!-- =============================================================================================================== -->
						<tr>
							<td colspan="4" style="text-align: left; padding-left: 20px; padding-top:25px;padding-bottom: 5px;"> 급여 내역</td>
						</tr>
						<tr>
							<td style="" colspan="2">급여내역</td>
							<td style="" colspan="2">공제내역</td>
						</tr>
						<tr>
							<td style="height:30px;">기본급</td>
							<td style=""><%=rMap.get("BASE_PAY") %></td>
							<td style="">소득세</td>
							<td style=";"><%=rMap.get("EI_PAY") %></td>
						</tr>
						<tr>
							<td style="height:30px;">성과급</td>
							<td style=""></td>
							<td style="">주민세</td>
							<td style=""><%=rMap.get("HI_PAY") %></td>
						</tr>
						<tr>
							<td style="height:30px;"></td>
							<td style=""></td>
							<td style="">고용보험</td>
							<td style=""><%=rMap.get("NP_PAY") %></td>
						</tr>
						<tr>
							<td style="height:30px;"></td>
							<td style=""></td>
							<td style="">국민연금</td>
							<td style=""><%=rMap.get("IT_PAY") %></td>
						</tr>
						<tr>
							<td style="height:30px;"></td>
							<td style=""></td>
							<td style="">건강보험</td>
							<td style=""><%=rMap.get("RD_PAY") %></td>
						</tr>
						<tr>
							<td style="height:30px;"></td>
							<td style=""></td>
							<td style="">공제합계</td>
							<td style=""><%=rMap.get("TAX_SUM") %></td>
						</tr>
						<tr>
							<td style="height:30px;"></td>
							<td style=""></td>
							<td style=""></td>
							<td style=""></td>
						</tr>
						<tr>
							<td style="height:30px;"></td>
							<td style=""></td>
							<td style=""></td>
							<td style=""></td>
						</tr>
						<tr>
							<td style="height:30px;"></td>
							<td style=""></td>
							<td style=""></td>
							<td style=""></td>
						</tr>
						<tr>
							<td style="height:30px;"></td>
							<td style=""></td>
							<td style=""></td>
							<td style=""></td>
						</tr>
						<tr>
							<td style="height:30px;"></td>
							<td style=""></td>
							<td style=""></td>
							<td style=""></td>
						</tr>
				<!-- =============================================================================================================== -->
						<tr>
							<td colspan="4" style="text-align: left; padding-left: 20px; padding-top:20px;"></td>
						</tr>
						<tr>
							<td style="height:20px;">급여합계</td>
							<td style=""><%=rMap.get("BASE_PAY") %></td>
							<td style="">공제합계</td>
							<td style=""><%=rMap.get("TAX_SUM") %></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: left; padding-left: 20px; padding-top:5px;"></td>
						</tr>
						<tr>
							<td style="height:20px; border-top: none; border-left: none;border-bottom: none;border-right: none;"></td>
							<td style=""></td>
							<td style="">실수령액</td>
							<td style=""><%=rMap.get("RECEIPT") %></td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			  <%}catch(Exception e){
			  	e.printStackTrace();
			  }
			  %>
			</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="padding-top:33px; text-align: center;">귀하의 노고에 감사드립니다.</td>
		</tr>
		<tr>
			<td style="text-align: right; padding-right: 50px;">우리를 JAVA</td>
		</tr>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>



<!-- 탑메뉴 사용 -->
<script src="../common/js/topNav.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common//js/sideNav.js?ver=2"></script>

<script src="../common/scripts.js"></script>
<!-- 버거 메뉴 활성화 -->
</body>
</html>