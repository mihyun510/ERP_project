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
				<div id="page_title" style="border: 1px solid red; margin: 10px 30px;"><h2>관리자</h2></div>
				<div id="page_contents" class="container" style="border: 1px solid yellow; margin: 50px 50px;">
          		<!-- 컨텐츠 들어갈내용 시작-->

				<div align="center">
				<label><h2>저장이 완료 되었습니다.</h2></label>
				</div>
				<br><br>
	<!-- 			<div align="center">
					<tr>
						<button type="button" onclick="location.href='manager_log.jsp'" class="btn btn-info" style="border: 3px solid white; border-radius: 10px;">YES</button>
						<button type="reset" onclick="location.href='main.jsp'" class="btn btn-info" style="border: 3px solid white; border-radius: 10px;">NO</button>
					</tr>
				</div> -->

          	
          		<!-- 컨텐츠 들어갈내용 끝   -->
          		</div>
          	</div>
        </main>
      </div>
    </div>
    <!-- 슬라이드바 사용할때 필요 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
      	    crossorigin="anonymous"></script>
    <!-- 탑메뉴 사용 -->
    <script src="../common/js/topNav.js"></script>
    <!-- 사이드 메뉴 사용 -->
    <script src="../common//js/sideNav.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
    <script src="../common/scripts.js"></script>
    <!-- 버거 메뉴 활성화 -->
  </body>
</html>
