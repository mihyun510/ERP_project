<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c4b678674e7c8512ebf2cadc156977&libraries=services"></script>
<script type="text/javascript">
	function save(){
		var DL_NAME = $("#DL_NAME").val();
		var DL_TEL = $("#DL_TEL").val();
		var DL_LATITUDE = $("#DL_LATITUDE").val();
		var DL_LONGITUDE = $("#DL_LONGITUDE").val();
		var DL_ADDRESS = $("#DL_ADDRESS").val();
		var DL_DETAILADDRESS = $("#DL_DETAILADDRESS").val();
		var DL_NOTE = $("#DL_NOTE").val();
		
		$.ajax({
			 url : "workAddBranch?DL_NAME="+DL_NAME+"&DL_TEL="+DL_TEL+"&DL_LATITUDE="+DL_LATITUDE+"&DL_LONGITUDE="+DL_LONGITUDE+"&DL_ADDRESS="+DL_ADDRESS+"&DL_DETAILADDRESS="+DL_DETAILADDRESS+"&DL_NOTE="+DL_NOTE
			,method : "GET"
			,success : function(data){
				if(data == "1"){
					//alert("입력이 완료 되었습니다.");
					location.href = "./outsideWorker"
				}
			}
		});
	}
//

</script>

</head>
<body class="sb-nav-fixed">
	<nav id="topNav"></nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav"></div>
		<div id="layoutSidenav_content">
			<main id="input_div">
				<div id="frame_div" style="border: 1px solid black;">
					<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
						<h2>지사등록</h2>
					</div>
					<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->

	 <div class="row">
   		
		   <div class="col-6">
		   
		   	<!-- 회사명 -->	
		   	<div class="row " style="padding:5px;">
		      <div class="col-2">
		      	<label>회사명 :</label>
		      </div>                 
		 	  <div class="col-8">
		    	  <input class="form-control mr-2" name="DL_NAME"  value="우리를자바(주)" placeholder="회사명을 입력해주세요." id="DL_NAME">
		      </div>
		   	</div>
		      
		   	<!-- 전화번호 -->	
		   	<div class="row" style="padding:5px">
		      <div class="col-2">
		      	<label>전화번호 :</label>
		      </div>                 
		 	  <div class="col-8">
		    	  <input class="form-control mr-2" name="DL_TEL" value="02-1125-2251"  placeholder="전화번호를 입력해주세요." id="DL_TEL">
		      </div>
		   	</div>
		   	<!-- 위도|경도 -->	
		   	<div class="row" style="padding:5px">
		      <div class="col-2">
		      	<label>위도 :</label>
		      </div>                 
		 	  <div class="col-2">
		    	  <input readonly class="form-control mr-2" id="DL_LATITUDE" type="search" placeholder="위도" aria-label="Search" name="DL_LATITUDE">
		      </div>
		      
		      <div class="col-2">
		      	<label></label>
		      </div>                 
		      <div class="col-2">
		      	<label>경도 :</label>
		      </div>                 
		 	  <div class="col-2">
		    	  <input readonly class="form-control mr-2" id="DL_LONGITUDE" type="search" placeholder="경도" aria-label="Search" name="DL_LONGITUDE">
		      </div>
		    </div>  
		    <!-- 주소 -->
		    <div class="row" style="padding:5px">
		      <div class="col-2">
		      	<label>위치검색 :</label>
		      </div>                 
		 	  <div class="col-6">
		    	  <input readonly class="form-control mr-2" id="DL_ADDRESS" type="search" placeholder="주소찾기 버튼을 눌러주세요." aria-label="Search" name="DL_ADDRESS">
		      </div>
		      <div class="col-2"> 
		      		<button class="btn btn-dark btn-block" type="submit" style="width:100px" onClick="addrSearch()">주소검색</button>
		      </div>
		    </div>
		    <!-- 지사 -->	
		    <div class="row" style="padding:5px">
		     <div class="col-2">
		     	<label>상세주소 :</label>
		     </div>                 
		 	 <div class="col-8">
		    	<input class="form-control mr-2" id="DL_DETAILADDRESS" type="" placeholder="상세주소를 입력해주세요." name="DL_DETAILADDRESS" >
		     </div>
		    </div>
		    <!-- 지사 -->	
		    
		    <!-- 비고 -->	
		    <div class="row" style="padding:5px">
		     <div class="col-2">
		     	<label>비고 :</label>
		     </div>                 
		 	 <div class="col-8">
		    	<textarea class="form-control" rows="6" id="DL_NOTE" name="DL_NOTE">서울지사</textarea>
		     </div>
		    </div>
		  
		    <!-- 비고 -->	
		    <div class="row" style="padding:5px; align-items: center;">
		     <div class="col-6  text-right">
		     	<button class="btn btn-primary" style="width:120px;" onclick="save()">저장</button>
		     </div>                 
		 	 <div class="col-6 text-left">
		     	<button class="btn btn-danger" style="width:120px;" onclick="location.href='http://localhost:5000/work/outsideWorker.erp'">취소</button>
		     </div>
		    </div>
		    <!-- 입력창 end -->	
		   </div>
	 
	   <!-- 지도 -->
	   <div class="col-6">
	  	 <div class="col-md">
	  		 <div id="map" style="width:100%;height:500px;"></div>
	   	</div>
	   </div>
		<!-- 지도 end -->	
		<script>
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
	        position: new daum.maps.LatLng(50.537187, 127.005476),
	        map: map
	    	});
	    var infoWindow;
	    var sample =  "<div><h2>교육센터위치</h2><p>내용처리</p>";
	    sample+="<a href='http://www.naver.com'>링크</a></div>";
	   	infoWindow = new daum.maps.InfoWindow({
	   	content: sample
	   	,maxWidth: 300
		});
	    function addrSearch() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.sido; // 최종 주소 변수
	                var addr1 = data.sigungu; // 최종 주소 변수
	                var addr2 = data.bname; // 최종 주소 변수
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("DL_ADDRESS").value = addr+" "+addr1+" "+addr2;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	                        var result = results[0]; //첫번째 결과의 값을 활용
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                        daum.maps.event.addListener(marker,'click',function(){
	                           infoWindow.open(map,marker);
	                        
	                        });
	                        
	
	                    }
	                // 위도경도 정보를 해당 필드에 넣는다.
	                document.getElementById("DL_LATITUDE").value = result.y;
	                document.getElementById("DL_LONGITUDE").value = result.x;
	                });
	            }
	        }).open();
	    }
	    mapContainer.style.display = "block";
	    map.relayout();
	   </script>
   
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
<script src="../common/js/topNav.js?"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js?"></script>
<script src="../common/scripts.js"></script>
<!-- 버거 메뉴 활성화 -->
</body>
</html>