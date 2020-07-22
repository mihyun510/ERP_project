<%@page import="org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> rlist = (List<Map<String,Object>>)request.getAttribute("dispatchList");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->  
<!--관리자 로그에 필요한 코드 시작=================================================================================-->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
  	  rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" ></script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
	
	<title>2RP PROGRAM</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39e05403ed4b21e961251256b8fff8ed&libraries=services"></script>

<script type="text/javascript">
	
	function outsideWorker(){
		var lat = "";
		var lng = "";
		var doc = "";
		var doc2 = "";
		var workername = $("#worker option:selected").val();
		var param = "emp_no="+workername ;
		$.ajax({
			url : "http://localhost:5000/work/outsideSEL"
		   ,method : "post"
		   ,data : param
		   ,success : function(result){
			   doc = JSON.stringify(result);
			   doc2 = JSON.parse(doc);
			  lat = doc2[0].DL_LATITUDE ;
			  lng = doc2[0].DL_LONGITUDE;
				    $("#work_name").val(doc2[0].DL_NAME);
				    $("#work_num").val(doc2[0].DL_TEL);
				    $("#work_addr").val(doc2[0].DL_ADDRESS);
				    $("#emp_no").val(doc2[0].EMP_NAME);
				    $("#emp_phone").val(doc2[0].EMP_PHONE);
				    $("#start").val(doc2[0].DP_SDATE);
				   	$("#end").val(doc2[0].DP_EDATE);
			        $("#lat").val(doc2[0].DL_LATITUDE);
			        $("#lng").val(doc2[0].DL_LONGITUDE);
	
			    //지도를 미리 생성
			    var map = new daum.maps.Map(mapContainer, mapOption);

			    var marker = new daum.maps.Marker({
			        position: new daum.maps.LatLng(50.537187, 127.005476),
			        map: map
			    	});
			    var infoWindow;
			   
			      var coords = new daum.maps.LatLng(lat, lng);
			                       
			                        map.setCenter(coords);
			                        // 마커를 결과값으로 받은 위치로 옮긴다.
			                        marker.setPosition(coords)
			                        daum.maps.event.addListener(marker,'click',function(){
			                           infoWindow.open(map,marker);
			                        
			                        });
			    
			    mapContainer.style.display = "block";
			    map.relayout();	
			    
		}
	});
	}
		
</script>

</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>파견 사원</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->


						<div class="row">

							<div class="col-6">
								<!--  -->
								<div class="text-center"
									style="border-bottom: 2px solid gray; border-top: 2px solid gray;">
									<h4>파견사원 조회</h4>
								</div>
								<!-- 사원명 -->
								<div class="row" style="padding: 5px;">
									<div class="col-2">
										<label>사원명 : </label>
									</div>
									<!-- 콤보박스 -->
									<div class="col-8">
										<select class="form-control" id="worker">
										<% 
										try{
										for(int i=0; i<rlist.size();i++){
										Map<String,Object> rMap = rlist.get(i);
										%>
											<option value="<%=rMap.get("EMP_NO")%>"><%=rMap.get("EMP_NAME")%></option>
										<%
										}
										}catch(Exception e){
											e.printStackTrace();
										}
										%>
										</select>
									</div>
									<!-- 버튼 -->
									<div class="col-2">
										<button class="btn btn-secondary" onclick="outsideWorker()">조회</button>
									</div>
								</div>
								<!-- 회사정보 -->
								<div class="text-center"
									style="border-bottom: 2px solid gray; border-top: 2px solid gray;">
									<h4>회사정보</h4>
								</div>
								<!-- 회사명 -->
								<div class="row" style="padding: 5px;">
									<div class="col-2">
										<label>회사명 : </label>
									</div>

									<div class="col-8">
										<input readonly class="form-control mr-2" id="work_name"
											type="search" placeholder="" aria-label="Search">
									</div>
								</div>
								<!-- 회사전화번호 -->
								<div class="row" style="padding: 5px;">
									<div class="col-2 ">
										<label>회사번호 : </label>
									</div>

									<div class="col-8">
										<input readonly class="form-control mr-2" id="work_num"
											type="search" placeholder="" aria-label="Search">
									</div>
								</div>
								<!-- 회사상세주소 -->
								<div class="row" style="padding: 5px;">
									<div class="col-2 ">
										<label>회사주소 : </label>
									</div>

									<div class="col-8">
										<input readonly class="form-control mr-2" id="work_addr"
											type="search" placeholder="" aria-label="Search">
									</div>
								</div>
								<!-- 사원정보 -->
								<div class="text-center"
									style="border-bottom: 2px solid gray; border-top: 2px solid gray;">
									<h4>사원정보</h4>
								</div>
								<!-- 사원명 -->
								<div class="row" style="padding: 5px;">
									<div class="col-2">
										<label>사원명 : </label>
									</div>

									<div class="col-8">
										<input readonly class="form-control mr-2" id="emp_no"
											type="search" placeholder="" aria-label="Search">
									</div>
								</div>
								<!-- 사원연락처 -->
								<div class="row" style="padding: 5px;">
									<div class="col-2">
										<label>사원연락처 : </label>
									</div>

									<div class="col-8">
										<input readonly class="form-control mr-2" id="emp_phone"
											type="search" placeholder="" aria-label="Search">
									</div>
								</div>
								<!-- 파견시작일 -->
								<div class="row" style="padding: 5px;">
									<div class="col-2">
										<label>파견시작일 : </label>
									</div>

									<div class="col-8">
										<input readonly class="form-control mr-2" id="start"
											type="search" placeholder="" aria-label="Search">
									</div>
								</div>
								<!-- 파견종료일 -->
								<div class="row" style="padding: 5px;">
									<div class="col-2">
										<label>파견종료일 : </label>
									</div>

									<div class="col-8">
										<input readonly class="form-control mr-2" id="end"
											type="search" placeholder="" aria-label="Search">
									</div>
								</div>
								<!-- bottom -->
								<div class="text-center" style="border-top: 2px solid gray;">

								</div>
								<!-- ㄴㅇㅁㅇㄱ -->
							</div>

							<!-- 지도 -->
							<div class="col-6">
								<div class="row" style="padding: 5px; text-align: right;">
									<div class="col-12">
										<button class="btn btn-secondary" onclick="location.href='http://localhost:5000/work/outsideWorkPlaceEdit.jsp'">파견지 등록</button>
										<button class="btn btn-secondary" onclick="location.href='http://localhost:5000/work/outsideWorkPlace.jsp'">파견지 조회</button>
									</div>
								</div>
								<div class="col-md">
									<div id="map" style="width: 100%; height: 460px;"></div>
								</div>
							</div>
							<!-- 지도 end -->
						</div>


						<!-- 컨텐츠 들어갈내용 끝   -->
     			</div>
			</div>
		</main>
	</div>
</div>
<!-- 슬라이드바 사용할때 필요 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!-- 탑메뉴 사용 -->
<script src="../common/js/topNav.js?"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js?"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="../common/scripts.js"></script>
<!-- 버거 메뉴 활성화 -->

		<script type="text/javascript">
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				    mapOption = {
			         center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			         level: 5 // 지도의 확대 레벨
			     };
			 var element_wrap = document.getElementById('wrap');
			 //지도를 미리 생성
			 var map = new daum.maps.Map(mapContainer, mapOption);
			 //주소-좌표 변환 객체를 생성
			 var geocoder = new daum.maps.services.Geocoder();
			 //마커를 미리 생성
			 var marker = new daum.maps.Marker({
			     position: new daum.maps.LatLng(lat, lng),
			     map: map
			 	});
			
			 var infoWindow;
			 var sample =  "<div><h2>교육센터위치</h2><p>내용처리</p>";
			 sample+="<a href='http://www.naver.com'>링크</a></div>";
				infoWindow = new daum.maps.InfoWindow({
				content: sample
				,maxWidth: 300
				});
			
			
				function relayout() {    
				    
				    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
				    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
				    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
				    
				    map.relayout();
				}
			</script>
			<script type="text/javascript">
			$("#rel").click(function(){
				var mapContainer = document.getElementById('mb');
			    // 사이즈를 정해 줘야 지도의 센터를 설정할 수 있습니다.
				 mapContainer.style.width = screen.width + 'px';
				mapContainer.style.height = screen.height + 'px'; 
				/* $("#mb").style.width = screen.width + 'px';
				$("#mb").style.height = screen.height+ 'px'; */
			
				// 이동할 위도 경도 위치를 생성합니다 
				var moveLatLon = new kakao.maps.LatLng(lat, lng );
				// 지도 레벨 설정( 1~14 낮을 수록 확대)
				 // 현재 맵 보다 확대해서 표시	
				map.relayout();  // 지도의 레이 아웃을 재 정렬합니다.
				map.setCenter(moveLatLon); // 지도 중심을 이동 시킵니다
			});
			
			</script>
</body>
</html>
