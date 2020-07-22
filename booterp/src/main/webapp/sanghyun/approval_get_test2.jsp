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
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
      	  rel="stylesheet" crossorigin="anonymous" />
    <link href="../common/main.css" rel="stylesheet" />
    <link href="../common/css/custom.css" rel="stylesheet" />
   
   <title>2RP PROGRAM</title>

</head>
<body class="sb-nav-fixed">
   <nav id="topNav"></nav>
   <div id="layoutSidenav">
      <div id="layoutSidenav_nav"></div>
      <div id="layoutSidenav_content">
         <main id="input_div">
           
<div id="frame_div" style="border: 1px solid black;">
  <div id="page_title" style="border: 1px solid red; margin: 10px 30px;"><h2>받은 결재</h2></div>
  	 <div id="page_contents" style="max-width: 1730px; border: 1px solid yellow; margin: 50px 50px;">
  	 <div class="row"><!--승인 기각버튼  -->
  	 <div  class="col-1"></div>
	    <div style="margin-top:15px;"class="col-5">
	    	<button   style="margin-right:5px;"class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">승인</button>
	        <button   style="margin-right:5px;"class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1">기각</button>
	 
	       <!-- 드랍다운 -->
			  <button class="btn btn-primary btn-lg dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    	이동
			  </button>
			  <div class="dropdown-menu " aria-labelledby="dropdownMenuButton">
			    <a class="dropdown-item" href="#">Action</a>
			    <a class="dropdown-item" href="#">Another action</a>
			    <a class="dropdown-item" href="#">Something else here</a>
			  </div>
			</div> <!--드랍다운 끝  -->
			</div>
        <hr style="border: solid 1px black;">
  	<div class="row">
  	  <div class="col-1"></div>
  	 	<div class="col-10">
  	 	<br>
			<table class="table">
				 <tr>
				   <td style="padding:5px;text-align:center;">보낸사람</td>
				   <td>이상현</td>
				   <td style="padding-right:5px;text-align:center;">기안부서</td>
				   <td>영업부</td>
				 </tr>
				 <tr>
				   <td style="width:20%;text-align:center;">번호</td>
				   <td>20112344</td>
				   <td style="padding:5px;\text-align:center;"></td>
				   <td></td>
				 </tr>
				 <tr>
				   <td style="text-align:center;">제목</td>
				   <td>퇴사합니다.</td>
				   <td style="padding:5px;\text-align:center;"></td>
				   <td></td>
				 </tr>
				 <tr>
				   <td style="width:20%;text-align:center;">기한</td>
				   <td>2020-06-20 ~ 2020-07-20</td>
				   <td style="padding:5px;width:20%;text-align:center;"></td>
				   <td></td>
				 </tr>
			</table>
  	 	</div>
  	 </div>
	<hr style="border: solid 1px black;">
	<div class="row">
	<div class="col-1"></div>
	<div style=" border:2px solid black;"class="col-10"id="test"></div>
	</div>
	<div class="col-1"></div>
<!-- 	<!-- 이전꺼 보여주는 거 -->\
	<div class="row">
	<div class="col-1"></div>
	<div class="col-10"></div>
	</div>
	<div class="col-1"></div> -->
	</div>
	</div>
  	 <script type="text/javascript">
				$(document).ready(function(){
					$.ajax({
						url:"./pagun.html"
						,success:function(data){
							$("#test").html(data);
						}
					})
				});
		</script> 
		<!--기각모달  -->
		<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header ">
        받은 결재
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <br>
      	승인 하시겠습니까?
        <br>
        <br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-info" data-dismiss="modal">승인</button>
        </div>
      </div>
    </div>
  </div>  
  <!--승인모달  -->
  		<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        받은 결재
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <br>
        기각 하시겠습니까?
        <br>
        <br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-info " data-dismiss="modal">기각</button>
        </div>
      </div>
    </div>
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
<script src="../common//js/sideNav.js"></script>

<script src="../common/scripts.js"></script>
<!-- 버거 메뉴 활성화 -->
</body>
</html>