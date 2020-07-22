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
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	
	<title>2RP PROGRAM</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39e05403ed4b21e961251256b8fff8ed&libraries=services"></script>

</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>파견지 조회</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->


						<div class="row">
							<div class="col-6">
								<div class="text-center" style="float: left; padding: 5px">
									<button class="btn btn-secondary" style="width: 150px"
										onClick="location.href='outsideWorker'">파견사원관리</button>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-hover" 
		                       id="table" 
								data-toggle="table"
								data-pagination="true"
				                data-url="branchList">
							<thead>
								<tr>
									<th style="width: 5%" data-field="DL_NO">No.</th>
									<th style="width: 10%" data-field="DL_NAME">회사명</th>
									<th style="width: 10%" data-field="DL_TEL">전화번호</th>
									<th style="width: 15%" data-field="DL_ADDRESS">주소</th>
									<th style="width: 20%" data-field="DL_DETAILADDRESS">상세주소</th>
									<th style="width: 10%" data-field="DL_LATITUDE">위도</th>
									<th style="width: 10%" data-field="DL_LONGITUDE">경도</th>
									<th style="width: 20%" data-field="DL_NOTE">비고</th>
								</tr>
							</thead>
							<tbody>
				
							</tbody>
						</table>
						


						<!-- 컨텐츠 들어갈내용 끝   -->
     			</div>
			</div>
		</main>
	</div>
</div>
	<!-- 슬라이드바 사용할때 필요 -->
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
