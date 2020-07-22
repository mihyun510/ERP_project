<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>2RP PROGRAM</title>
    <link href="../mihyun_main/main.css" rel="stylesheet" />
    <link
      href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
      rel="stylesheet"
      crossorigin="anonymous"
    />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
      crossorigin="anonymous"
    ></script>
    
    <link href="../common/css/custom.css" rel="stylesheet" />
		<script type="text/javascript">
		function manager_log_content(){
			$.ajax({
				url : "manager_log_content.jsp",
				success : function(data) {
					//alert("data:" + data);
					$("#log_content").html(data);
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
        	<div id="frame_div" >
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>관리자 로그</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
          		<!-- 컨텐츠 들어갈내용 시작-->
		           <!--  
		           <ol class="breadcrumb mb-4">
		              <li class="breadcrumb-item">
		                <a href="main.jsp">main</a>
		              </li>
		              <li class="breadcrumb-item active">관리자 로그</li>
		           </ol> 
		           -->
		             <div class="card-header">
		                <i class="fas fa-table mr-1"></i>
		                <button type="button" class="btn btn-info float-" id="b" value="로그 조회" onClick="window.location.reload()" style="border: 3px solid white; border-radius: 10px;">로그갱신</button>
		                <button type="button" class="btn btn-info float-right" style="border: 3px solid white; border-radius: 10px; padding-bottom: 5px; margin-bottom: 15px;" onClick="window.print()">출력</button>
		              </div>
		              
					<!-- <div id="log_content">
					</div>
					-->
					
					<table id="table" 
						   data-toggle="table" 
						   class="table table-hover"
						   data-search="true" 
						   data-toggle="table" 
						   data-pagination="true"
						   data-url="../work/gg.erp?cud=log">
						<thead class="thead-light">
							<tr>
								<th data-field="LOG_NO">NO</th>
								<th data-field="EMP_NO">사원번호</th>
								<th data-field="LOG_IP">접속IP</th>
								<th data-field="LOG_TYPE">활동내역</th>
								<th data-field="LOG_TIME">접속시간</th>
							</tr>
						</thead>
					</table>
					

          		<!-- 컨텐츠 들어갈내용 끝   -->
          		</div>
          	</div>
        </main>
      </div>
    </div>
    
        <script
      src="https://code.jquery.com/jquery-3.4.1.min.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
      crossorigin="anonymous"
    ></script>
    

    <!-- 탑메뉴 사용 -->
    <script src="../common/js/topNav.js"></script>
    <!-- 사이드 메뉴 사용 -->
    <script src="../common/js/sideNav.js?ver=2"></script>
    
    <script src="../common/scripts.js"></script>
    
<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  </body>
</html>
