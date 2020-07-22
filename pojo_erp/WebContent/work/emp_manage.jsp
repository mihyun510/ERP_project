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

<script type="text/javascript">
	var emp_no = null;
	function emp_list_on(){
		$.ajax({
			url : "./emp_list_on.jsp",
			success : function(data) {
				//alert("data:" + data);
				$("#emp_list").html(data);
			}
		});
	}
	function emp_list_off(){
		$.ajax({
			url : "./emp_list_off.jsp",
			success : function(data) {
				//alert("data:" + data);
				$("#emp_list").html(data);
			}
		});
	}	
  	function emp_insert_new(){
		//alert("emp_no: "+emp_no);
		location.href="emp_insert_new.jsp"
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
					<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
						<h2>사원 관리</h2>
					</div>
					<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->

						<button type="button" class="btn btn-info float-left" style="border: 3px solid white; border-radius: 10px; margin: 5px;" 
								onclick="emp_list_on()">재직사원 조회</button>
						<button type="button" class="btn btn-info float-left" style="border: 3px solid white; border-radius: 10px; margin: 5px;" 
								onclick="emp_list_off()">퇴직사원 조회</button>
						<button type="button" class="btn btn-info float-left" style="border: 3px solid white; border-radius: 10px; margin: 5px;" 
								onclick="emp_insert_new()">신규사원 등록</button>
						
						<div id="emp_list">
						<table id="table" 
							   data-toggle="table" 
							   class="table table-hover"
							   data-search="true" 
							   data-pagination="true"
							   data-url="./emp_list_on.erp?cud=nowempList">
							<thead class="thead-light">
								<tr style="text-align: center;">
									<th data-field="EMP_NO" style="width:12.5%">사원번호</th>
									<th data-field="username" style="width:12.5%">사원이름</th>
									<th data-field="DEPT_NAME" style="width:12.5%">부서</th>
									<th data-field="EMP_POSITION" style="width:12.5%">직급</th>
									<th data-field="EMP_EMAIL" style="width:12.5%">이메일</th>
									<th data-field="EMP_PHONE" style="width:12.5%">핸드폰</th>
									<th data-field="EMP_STATE" style="width:12.5%">근무상태</th>
									<th data-field="OPERATE" data-formatter="operateFormatter" data-events="operateEvents" style="width:12.5%" data-align="center" >정보수정</th>
								</tr>
							</thead>
						</table>
						
						<!-- 							
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th>사원번호</th>
									<th>사원이름</th>
									<th>부서</th>
									<th>직급</th>
									<th>이메일</th>
									<th>핸드폰</th>
									<th>근무상태</th>
									<th>정보수정</th>
								</tr>
							</thead>
						</table>  
						-->
						</div>
						
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

	<!-- 수정버튼 클릭햇을때 테이블 정보불러오기 -->
<!-- 
	<script>
      var $table = $("#table");

      function operateFormatter(value, row) {
        return [
          '<a class="button" href="javascript:void(0)" title="button">',
          '<button type="button" class="btn btn-info" style="border: 1px solid white; border-radius: 10px; font-size:12px" align="center">수정</button>',
          "</a>  ",
        ].join("");
      }

      window.operateEvents = {
        "click .button": function (e, value, row, index) {
          alert("You click like action, row: " + JSON.stringify(row));
        },
      };
    </script>
 -->

    <script>
      var $table = $("#table");
      function operateFormatter(value, row) {
        return [
          '<a class="button" href="javascript:void(0)" title="button">',
          '<button type="button" class="btn btn-info" style="border: 1px solid white; border-radius: 10px; font-size:12px" align="center">수정</button>',
          "</a>  ",
        ].join("");
      }
      window.operateEvents = {
        "click .button": function (e, value, row, index) {
          window.location.href = "workSelectEmp.erp?emp_no=" + row.EMP_NO;
        },
      };
    </script>


	<!-- 탑메뉴 사용 -->
	<script src="../common/js/topNav.js"></script>
	<!-- 사이드 메뉴 사용 -->
	<script src="../common//js/sideNav.js?ver=2"></script>

	<script src="../common/scripts.js"></script>
	<!-- 버거 메뉴 활성화 -->
	

</body>
</html>