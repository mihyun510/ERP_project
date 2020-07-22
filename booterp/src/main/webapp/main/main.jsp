<%@page import="java.util.ArrayList"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("emp_no")!= null){
	 	String emp_name = (String)session.getAttribute("emp_name");
		String dept_name = (String)session.getAttribute("dept_name");	
		
		int timeGap = 0;
		boolean flag = false;
		List<Map<String ,Object>> inOutList =(List<Map<String,Object>>) request.getAttribute("taskTimeList");
		 if(inOutList.size() != 0){
			Map<String, Object> rmap = inOutList.get(0);
			timeGap = Integer.parseInt(rmap.get("WORK_MINUTE").toString());
			flag = true;
		} else {
			inOutList = new ArrayList();
			//timeGap = 0;
			flag = false;
		} 
%>
<!DOCTYPE html> 
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	<!--관리자 로그에 필요한 코드 시작=================================================================================-->
	
	<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css" />
	<link href="../common/main.css" rel="stylesheet" />
	<link href="../common/css/custom.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
	<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
	
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

	<title>2RP PROGRAM</title>
<script type="text/javascript">
	sessionStorage.setItem("emp_name", "<%=emp_name %>");
	sessionStorage.setItem("dept_name", "<%=dept_name %>");
</script>
<script type="text/javascript">
		var interver = null;
		//var x = 10;
/******************************* clock thread start **********************************/
		function clockAutoLoad1(){
			var today = new Date();
			var hh = today.getHours().toString(); // 시
			var mm = today.getMinutes().toString();  // 분
			var ss = today.getSeconds().toString();  //초
			var getTime = (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
			$('#men1').css('visibility','visible');
			$('#clock1').css('visibility',"visible");
			$('#clock1').text(getTime);
		}
		function clockAutoLoad2(){
			var today = new Date();
			var hh = today.getHours().toString(); // 시
			var mm = today.getMinutes().toString();  // 분
			var ss = today.getSeconds().toString();  //초
			var getTime = (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
			$('#men2').css('visibility','visible');
			$('#clock2').css('visibility',"visible");
			$('#clock2').text(getTime);
			
		}
		function clockAutoLoad3(){
			var today = new Date();
			var hh = today.getHours().toString(); // 시
			var mm = today.getMinutes().toString();  // 분
			var ss = today.getSeconds().toString();  //초
			var getTime = (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
			$('#men3').css('visibility','visible');
			$('#clock3').css('visibility',"visible");
			$('#clock3').text(getTime);
		}
		function clockAutoLoad4(){
			var today = new Date();
			var hh = today.getHours().toString(); // 시
			var mm = today.getMinutes().toString();  // 분
			var ss = today.getSeconds().toString();  //초
			var getTime = (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
			$('#men4').css('visibility','visible');
			$('#clock4').css('visibility',"visible");
			$('#clock4').text(getTime);
		}
		function clockAutoLoad5(){
			var today = new Date();
			var hh = today.getHours().toString(); // 시
			var mm = today.getMinutes().toString();  // 분
			var ss = today.getSeconds().toString();  //초
			var getTime = (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
			$('#men5').css('visibility','visible');
			$('#clock5').css('visibility',"visible");
			$('#clock5').text(getTime);
		}
		function clockAutoLoad6(){
			var today = new Date();
			var hh = today.getHours().toString(); // 시
			var mm = today.getMinutes().toString();  // 분
			var ss = today.getSeconds().toString();  //초
			var getTime = (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
			$('#men6').css('visibility','visible');
			$('#clock6').css('visibility',"visible");
			$('#clock6').text(getTime);
		}
		function clockAutoLoad7(){
			var today = new Date();
			var hh = today.getHours().toString(); // 시
			var mm = today.getMinutes().toString();  // 분
			var ss = today.getSeconds().toString();  //초
			var getTime = (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
			$('#men7').css('visibility','visible');
			$('#clock7').css('visibility',"visible");
			$('#clock7').text(getTime);
		}
		function clockAutoLoad8(){
			var today = new Date();
			var hh = today.getHours().toString(); // 시
			var mm = today.getMinutes().toString();  // 분
			var ss = today.getSeconds().toString();  //초
			var getTime = (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
			$('#men8').css('visibility','visible');
			$('#clock8').css('visibility',"visible");
			$('#clock8').text(getTime);
		}
		function clockAutoLoad9(){
			var today = new Date();
			var hh = today.getHours().toString(); // 시
			var mm = today.getMinutes().toString();  // 분
			var ss = today.getSeconds().toString();  //초
			var getTime = (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
			//$('#men9').css('visibility','visible');
			$('#clock9').css('visibility',"visible");
			$('#clock9').text(getTime);
		}
/******************************* clock thread end**********************************/
</script>

</head>
<body class="sb-nav-fixed">

<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>메인</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->

<div class="row">
	<div class="col-lg-6">
		<h2 style="text-align: center;">출근|퇴근|외출 상황</h2>
		<div id="emp_table" style="width: 100%; height: 300px;">
			<div class="table-responsive">
				<table id="testTable" class="table table-hover" data-toggle="table"
					data-url="inoutList">
					<thead class="thead-light">
						<tr>
							<th data-field="STATE">상태</th>
							<th data-field="TIME">시간</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<hr>
	</div>

	<div class="col-lg-6">

		<h2 style="text-align: center;">회의실</h2>
		<div id="cf_table" style="width: 100%;; height: 300px;"></div>
		<!-- <script src="../mihyun_main/js/react/cfTableContainer.bundle.js"></script> -->
		<script src="../mihyun_main/js/react/cfTableContainer.bundle.js"></script>
		<hr>
	</div>
</div>


<div class="row">

	<div class="col-lg-6">

		<div id="todo_table"></div>
		<script src="../mihyun_main/js/react/todoContainer.bundle.js"></script>
	</div>

	<div class="col-lg-6">
		<div id="text"></div>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<table style="width: 100%; height: 100%;">
						<tbody>
							<tr>
								<td>
									<div id="clock1"
										style="font-size: 2em; font-weight: bold; text-align: center; visibility: hidden;">현재시간</div>
								</td>
								<td>
									<div id="clock2"
										style="font-size: 2em; font-weight: bold; text-align: center; visibility: hidden;">현재시간</div>
								</td>
								<td>
									<div id="clock3"
										style="font-size: 2em; font-weight: bold; text-align: center; visibility: hidden;">현재시간</div>
								</td>
								<td>
									<div id="clock4"
										style="font-size: 2em; font-weight: bold; text-align: center; visibility: hidden;">현재시간</div>
								</td>
								<td>
									<div id="clock5"
										style="font-size: 2em; font-weight: bold; text-align: center; visibility: hidden;">현재시간</div>
								</td>
								<td>
									<div id="clock6"
										style="font-size: 2em; font-weight: bold; text-align: center; visibility: hidden;">현재시간</div>
								</td>
								<td>
									<div id="clock7"
										style="font-size: 2em; font-weight: bold; text-align: center; visibility: hidden;">현재시간</div>
								</td>
								<td>
									<div id="clock8"
										style="font-size: 2em; font-weight: bold; text-align: center; visibility: hidden;">현재시간</div>
								</td>
								<td>
									<div id="clock9"
										style="font-size: 2em; font-weight: bold; text-align: center; visibility: hidden;">현재시간</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
										<img id="men1" alt="달리는 사람" src="../mihyun_main/img/run2.gif"
											style="width: 100%; height: 100%; visibility: hidden;" />
									</div>
								</td>
								<td><div>
										<img id="men2" alt="달리는 사람" src="../mihyun_main/img/run2.gif"
											style="width: 100%; height: 100%; visibility: hidden;" />
									</div></td>
								<td><div>
										<img id="men3" alt="달리는 사람" src="../mihyun_main/img/run2.gif"
											style="width: 100%; height: 100%; visibility: hidden;" />
									</div></td>
								<td><div>
										<img id="men4" alt="달리는 사람" src="../mihyun_main/img/run2.gif"
											style="width: 100%; height: 100%; visibility: hidden;" />
									</div></td>
								<td><div>
										<img id="men5" alt="달리는 사람" src="../mihyun_main/img/run2.gif"
											style="width: 100%; height: 100%; visibility: hidden;" />
									</div></td>
								<td><div>
										<img id="men6" alt="달리는 사람" src="../mihyun_main/img/run2.gif"
											style="width: 100%; height: 100%; visibility: hidden;" />
									</div></td>
								<td><div>
										<img id="men7" alt="달리는 사람" src="../mihyun_main/img/run2.gif"
											style="width: 100%; height: 100%; visibility: hidden;" />
									</div></td>
								<td><div>
										<img id="men8" alt="달리는 사람" src="../mihyun_main/img/run2.gif"
											style="width: 100%; height: 100%; visibility: hidden;" />
									</div></td>
								<td><div><i class="fas fa-home" style="width: 100%; height: 100%;"></div></td>
							</tr>
							<tr style="font-size: 18px; text-align: center">
								<td>출근</td>
								<td>1시간</td>
								<td>2시간</td>
								<td>3시간</td>
								<td>4시간</td>
								<td>5시간</td>
								<td>6시간</td>
								<td>7시간</td>
								<td>퇴근(8시간)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function() {
		
		
	 	var flag = <%=flag %>
		if(flag == true){
	var timeGap =<%=timeGap%>;
	 	//var timeGap =500; 

		if (timeGap < 60) {//출발 0시간
			function start1() {
				intervel = setInterval(clockAutoLoad1, 1000);
			}
			start1();
		} else if (timeGap > 60 && timeGap <= 120) { //1시간
			function start2() {
				intervel = setInterval(clockAutoLoad2, 1000);
			}
			start2();
		} else if (timeGap > 120 && timeGap <= 180) { //2시간
			function start3() {
				intervel = setInterval(clockAutoLoad3, 1000);
			}
			start3();
		} else if (timeGap > 180 && timeGap <= 240) { //3시간
			function start4() {
				intervel = setInterval(clockAutoLoad4, 1000);
			}
			start4();
		} else if (timeGap > 240 && timeGap <= 300) { //4시간
			function start5() {
				intervel = setInterval(clockAutoLoad5, 1000);
			}
			start5();
		} else if (timeGap > 300 && timeGap <= 360) { //5시간
			function start6() {
				intervel = setInterval(clockAutoLoad6, 1000);
			}
			start6();
		} else if (timeGap > 360 && timeGap <= 440) { //6시간 
			function start7() {
				intervel = setInterval(clockAutoLoad7, 1000);
			}
			start7();
		} else if (timeGap > 440 && timeGap <= 500) { //7시간
			function start8() {
				intervel = setInterval(clockAutoLoad8, 1000);
			}
			start8();
		} else if (timeGap > 500 ) {
			function start9() { //퇴근 8시간
				intervel = setInterval(clockAutoLoad9, 1000);
			}
			start9();
		}
	}
	}); 
</script>




     	
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
<script src="../common/js/topNav.js?after"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js?ver2"></script>

<script src="../common/scripts.js"></script>
<!-- 버거 메뉴 활성화 -->
</body>
</html>

<%
	} else {
%>
	<script type="text/javascript">
		location.href="http://localhost:5000/main/login.jsp";
	</script>
<%	}

%>

