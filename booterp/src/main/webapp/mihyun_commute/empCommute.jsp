<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--         <%
    //출퇴 테이블의 값은 세션과 리스트? 로 가져오고 차트의 원형(일정) 아니다. 원형도 리스트로 받아오자 , 꺽은선 차트는 json으로 가져오기
    	session.setAttribute("name", "사원명");
    	session.setAttribute("dept", "부서");
    	String name = (String) session.getAttribute("name");
    	String dept = (String) session.getAttribute("dept");
    	if(name == null || dept == null){
    		name = "-";
    		dept = "-";
    	}
    %> --%>
    <%
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <link href="main.css?after" rel="stylesheet" />

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!-- ===========bootstrap=========== -->
<link rel="stylesheet"  type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet"  type="text/css" href="../css/bootstrap-grid.css">
<link rel="stylesheet"  type="text/css" href="../css/bootstrap-reboot.css">

<link href="./main.css" rel="stylesheet" />

<script src="../js/bootjs/bootstrap.min.js"></script>
<title>2RP PROGRAM</title>

      <script type="text/javascript">
      /***************** PIE CHART ********************/
      	var chartData = null;
	      google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(pieDrawChart);
		 
		function pieDrawChart() {
			var jsonData = $.ajax({
				url: "./chartjson.jsp"
				,dataType: "json"
				,async: false
			}).responseText;
			alert(jsonData);
			var pieData = new google.visualization.DataTable(jsonData);
/*  			pieData.addColumn('string', 'SCHEDULE');
			pieData.addColumn('number', 'TIME'); */
			
 	/*		pieData.addRows([
				['점심시간 12:00~1:00',60]
			]);  */
			var pieOptions = {
			  title: '근무일정[분 단위]'
			  ,'width':'100%'
			  ,'height':400
			  ,pieSliceText: 'label'
			  ,pieStartAngle: 180
			  ,legend: 'none'
			  , slices: {0: {offset: 0.2}}/* jsonData.length  */
			};
			var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(pieData, pieOptions);
			window.addEventListener('resize', pieDrawChart, false);
		}
		
      /***************** CURVE CHART ********************/
      /* google.charts.load('current', {'packages':['corechart']}); */
      google.charts.setOnLoadCallback(curvDrawChart);

      function curvDrawChart() {
    	  var jsonData1 = $.ajax({
				url: "./curvchartdata.jsp"
				,dataType: "json"
				,async: false
			}).responseText;
        var curvData = new google.visualization.DataTable(jsonData1);
/*           ['day', '근무시간'],
          ['월',  2],
          ['화',  4],
          ['수',  8],
          ['목',  10],
          ['금',  8] */
          
        var options = {
          title: '근무시간[주 단위]'
          ,curveType: 'function'
          ,'width':'100%'
		  ,'height':400
		  ,colors:['pink']
          ,legend: { position: 'bottom' }
        };
        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
        chart.draw(curvData, options);
        window.addEventListener('resize', curvDrawChart, false);
      }
      function go(){
    	  var goText = $("#go").text();
    	  alert("출근");
    	  alert(goText+" goTex");
    	  var today = new Date();   
    	  var  hours = today.getHours(); // 시
    	  var minutes = today.getMinutes();  // 분
    	  var second  = today.getSeconds();
    	  hours = hours < 10 ? '0'+hours : hours;
    	  minutes = minutes < 10 ? '0'+minutes : minutes;
    	  second = second < 10 ? '0'+second : second;
    	  alert(hours+ ':' + minutes + ':' +second);
    	  var msg = hours+ ':' + minutes + ':' +second;
    	  if(goText == "-"){
	          $("#go").text(msg);
	          $.ajax({
	        	  url:"?xxx="+msg,
	        	  success:function(data){
	        		  alert("업데이트 성공"+data);
	        	  }
	          });
     	 }else{
     		 alert("이미 출근하셨습니다.");
     	 }
      }
      function out(){
          var outText = $("#out").text();
    	  alert("외출")
    	  alert(outText+" outText");
    	  var today = new Date();   
    	  var  hours = today.getHours(); // 시
    	  var minutes = today.getMinutes();  // 분
    	  var second  = today.getSeconds();
    	  hours = hours < 10 ? '0'+hours : hours;
    	  minutes = minutes < 10 ? '0'+minutes : minutes;
    	  second = second < 10 ? '0'+second : second;
    	  alert(hours+ ':' + minutes + ':' +second);
    	  var msg = hours+ ':' + minutes + ':' +second;
    	  if(outText == "-"){
	          $("#out").text(msg);
	          $.ajax({
	        	  url:"?xxx="+msg,
	        	  success:function(data){
	        		  alert("업데이트 성공"+data);
	        	  }
	          });
    	  }else{
      		 alert("이미 외출하셨습니다.");
      	 }
      }
      function comeback(){
          var comeBackText = $("#comeBack").text();
    	  alert("외츨복귀")
    	  alert(comeBackText+" comeBackText");
    	  var today = new Date();   
    	  var  hours = today.getHours(); // 시
    	  var minutes = today.getMinutes();  // 분
    	  var second  = today.getSeconds();
    	  hours = hours < 10 ? '0'+hours : hours;
    	  minutes = minutes < 10 ? '0'+minutes : minutes;
    	  second = second < 10 ? '0'+second : second;
    	  alert(hours+ ':' + minutes + ':' +second);
    	  var msg = hours+ ':' + minutes + ':' +second;
    	  var outText = $("#out").text();
    	  alert(outText+" outText");
    	  if(outText != "-"){
	          $("#comeBack").text(msg);
	          $.ajax({
	        	  url:"?xxx="+msg,
	        	  success:function(data){
	        		  alert("업데이트 성공"+data);
	        	  }
	          });
    	  }else{
      		 alert("외출을 하지 않으셨습니다.");
      	 }
      }
      function leave(){
    	  var leaveText = $("#leave").text();
    	  alert("퇴근");
    	  alert(leaveText+" leaveText");
    	  var today = new Date();   
    	  var  hours = today.getHours(); // 시
    	  var minutes = today.getMinutes();  // 분
    	  var second  = today.getSeconds();
    	  hours = hours < 10 ? '0'+hours : hours;
    	  minutes = minutes < 10 ? '0'+minutes : minutes;
    	  second = second < 10 ? '0'+second : second;
    	  alert(hours+ ':' + minutes + ':' +second);
    	  var msg = hours+ ':' + minutes + ':' +second;

    	  if(leaveText == "-"){
	          $("#leave").text(msg);
	          $.ajax({
	        	  url:"?xxx="+msg,
	        	  success:function(data){
	        		  alert("업데이트 성공"+data);
	        	  }
	          });
    	  }else{
       		 alert("이미 퇴근하셨습니다.");
       	 }
      }
</script>
</head>
   <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color:#282828; text-align: center;">
           <!-- 버거바 -->
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- 메인 이름 -->
            <a class="navbar-brand" href="1.jsp" style="width:100%;" >2RP PROGRAM</a>
            <!-- 홈버튼 위치 -->
      </nav>
       <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color:#323232 ">
                
                    <div class="sb-sidenav-footer" style="background-color:#323232; margin-top:10px;">
                       <div class="container">
                          <div class="row"><!-- margin-left:-5px; margin-left:-50px;-->
                              <div class="col" style="width:40%; "><img class="rounded-circle" alt="사원얼굴" src="111111.jpg" style="width:60px; height:60px;"></div>
                              <div class="col" style="width:60%; text-align:center; padding: 20px 0px;">개구리 사원</div>
                           </div>
                           <div class="row">
                              <div style="width:50%; padding: 5px 3px;"><button class="bg-dark">회원수정</button></div>
                              <div style="width:50%; padding: 5px 3px;"><button class="bg-white">로그아웃</button></div>
                           </div>
                       </div>
                    </div>
                    
                    
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                 My Service
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                            
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                               <nav class="sb-sidenav-menu-nested nav">
                              <!--  <a class="nav-link" href="javascript:nextClick()">출|퇴관리</a> -->
                              <a class="nav-link" href="#">출|퇴관리</a>
                               <a class="nav-link" onclick="empSal()">급여관리</a>
                               <a class="nav-link" href="layout-sidenav-light.html">개인일정</a>
                               </nav>
                            </div>
               
                          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                               Work    
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                     		                     전자결제
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="login.html">내 결제함</a>
                                        <a class="nav-link" href="register.html">결제양식</a>
                                        <a class="nav-link" href="password.html">결제신청</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                 		      인사
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="401.html">조직도</a>
                                        <a class="nav-link" href="404.html">사원관리</a>
                                        <a class="nav-link" href="500.html">파견사원</a>
                                        </nav>
                                    </div>
                                     <a class="nav-link" href="#" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                      	 부서일정
                                     <div class="sb-sidenav-collapse-arrow"></div></a>
                                     <a class="nav-link" href="#" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                 		     관리자
                                     <div class="sb-sidenav-collapse-arrow"></div></a>
                                </nav>
                            </div>
                            
                            <a class="nav-link" href="charts.html"
                                ><div class="sb-nav-link-icon"><i class="fas fa-calendar"></i></div>
                               Conference</a
                            ><a class="nav-link" href="tables.html"
                                ><div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
                                Chat</a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main id="input_div" >
                <!-- insert here -->
				<div id="frame_div" style="border: 1px solid black;">
					<div id="page_title" style="border: 1px solid red; margin: 30px 30px;"><h2>출근|퇴근|외출 관리</h2></div>
					<div id="page_contents" style="border: 1px solid yellow; margin: 50px 50px;">
					<!-- 여기서부터 버튼태그 -->
						<div style="margin-top: 10px;" class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-10">
							<div class="small-unit" align="right">
								<button type="button" onclick="go()" class="btn btn-info" style="width:100px;">출근</button>
								<button type="button" onclick="out()" class="btn btn-info" style="width:100px;">외출</button>
								<button type="button" onclick="comeback()" class="btn btn-info" style="width:100px;">복귀</button>
								<button type="button" onclick="leave()" class="btn btn-info" style="width:100px;">퇴근</button>
							</div>
						</div>
						<div class="col-lg-1"></div>
						</div>
						<!--테이블 태그 -->
						<div class="row" style="margin-top: 10px; width: 100%; height: 100%;">
							<!-- <div class="col-1"></div> -->
							<div class="col-12">
								<table class="table table-bordered" style="width: 100%; height:80%; ">
									<thead class="thead-dark">
										<tr>
											<th scope="col" style="text-align: center;">부서명</th>
											<th scope="col" style="text-align: center;">사원명</th>
											<th scope="col" style="text-align: center;">출근</th>
											<th scope="col" style="text-align: center;">퇴근</th>
											<th scope="col" style="text-align: center;">외출</th>
											<th scope="col" style="text-align: center;">복귀</th>
											<th scope="col" style="text-align: center;">병가</th>
											<th scope="col" style="text-align: center;">휴가</th>
										</tr>
								</thead>
								<tbody>
									<tr >
										<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;">-</td>
										<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;">-</td>
										<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="go">-</td>
										<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="leave">-</td>
										<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="out">-</td>
										<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="comeBack">-</td>
										<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;">-</td>
										<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;">-</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- <div class="col-lg-1"></div> -->
				</div>
				<!--테이블 끝태그  style="justify-content: center"-->
				<div class="row" style="background-color: #DCEBFF; width: 100%; height: 100%; float: center;" align="center">
					<div class="col-lg-6" style="padding: 12px; width: 100%; height: 100%;">
						<div style="width: 100%; height: 100%; float: center" align="center" id="piechart"></div>
					</div>
					<div class="col-lg-6" style="padding: 12px; width: 100%; height: 100%;">
						<div style="width: 100%; height: 100%;" align="center" id="curve_chart"></div>
					</div>
					<!-- <div class="col-6" style="width: 100%; height: 100%; background-color: black;" align="center" id="piechart"></div> -->
					<!-- <div class="col-6" style="width: 100%; height: 100%; background-color: black;" align="center" id="curve_chart"></div> -->
				</div>
				</div>
		</div>
                <!-- end of insert here -->
     </main>
     </div>
   </div>
        <!-- 슬라이드바 사용할때 필요 -->
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
       	    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
       <!-- 버거 메뉴 활성화 -->
        <script src="../dist/js/scripts.js"></script>
        
<!--         <script type="text/javascript">
        	$(document).ready(function(){
        		$.ajax({
        			url:'./ChartData.json'
        			,success:function(data){
        				alert('data: '+ data);
        				var result = JSON.stringify(data); //값이 덩어리로 들어있음.
        				chartData = result;
        				alert('chartData: '+ chartData);
						//var jsonDoc = JSON.parse(result); //값을 파싱해온다. - 데이터 한개씩 배열방 한칸에 담기
						/* for(var i = 0; i<jsonDoc.length; i++){ //json의 정보갯수 만큼 for문이 돌고 
						}); */
        			}
        		})
        	});
  </script> -->
        
</body>
</html>