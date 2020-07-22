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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
  	  rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" ></script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
	
	<title>2RP PROGRAM</title>

</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>휴지통</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->

				<div class="toolbar">
					<button id="delete" class="btn btn-danger">삭제</button>
					<button id="restore" class="btn btn-success">복구</button>
				</div>
				<!-- ========================= 휴지통 테이블 ========================== -->
				<table id="table" data-toolbar=".toolbar"
					
					data-advanced-search="true"
					data-select-item-name="selectItemName" data-url="../juno/member2.json">
					<thead>
						<tr>
							<th data-field="state" data-checkbox="true"></th>
							<th data-field="app_no">번호</th>
							<th data-field="app_name">양식</th>
							<th data-field="app_write" >이름</th>
							<th data-field="app_print"> 상태</th>
							<th data-field="operate" data-formatter="operateFormatter"
								data-events="operateEvents" data-width="100" data-align="center">확인</th>
						</tr>
					</thead>
				</table>
				<!-- ======================== 휴지통 테이블 끝 ====================== -->

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

<script>
	$(function() {
		$('#table').bootstrapTable()
	})

	/* 테이블 버튼 구현 부분 */
	function operateFormatter(value, row) {
		return ['<a class="button" href="javascript:void(0)" title="button">',
	          '<button type="button" class="btn btn-info" style="border: 1px solid white; border-radius: 10px; font-size:12px" align="center">작성</button>',
	          "</a>  ", ]
				.join('')
	}
	/* 테이블 버튼 구현 부분  끝*/

	/* 테이블 버튼 이벤트 처리 부분  */
	window.operateEvents = {
		'click .button' : function(e, value, row, index) {
			//alert('You click like action, row: ' + JSON.stringify(row))
			//alert('You click like action, row: ' + JSON.stringify(index))
		}
	}
	/* 테이블 버튼 이벤트  처리 끝 */
</script>

<!-- 탑메뉴 사용 -->
<script src="../common/js/topNav.js?"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js?"></script>
<!-- 버거 메뉴 활성화 -->
<script src="../common/scripts.js"></script>
</body>
</html>
