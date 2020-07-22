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
<!--  -ddddddddddddddddddddddddddd->

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->  
    <!--관리자 로그에 필요한 코드 시작=================================================================================-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
      	  rel="stylesheet" crossorigin="anonymous" />
    <link href="../common/main.css" rel="stylesheet" />
    <link href="../common/css/custom.css" rel="stylesheet" />
    <!--관리자 로그에 필요한 코드 끝   =================================================================================-->
	
    <title>2RP PROGRAM</title>

  <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <script type="text/javascript">
        $(document).ready(function () {
            //[1] 리스트의 기본 모양 지정 : <ul>를 자식으로 가지지 않는 li의 블릿기호는 기본 모양
            $('li:not(:has(ul))').css({ cursor: 'default', 'list-style-image':'none'});
           
            //[2] 자식 요소를 갖는 li에 대해서는 블릿이미지를 plus.gif를 지정
            $('li:has(ul)') //자식 요소(ul)를 갖는 요소(li)에 대해서
                .css({cursor: 'pointer', 'list-style-image':'url(folder-closed.gif)'})//+기호로 설정
                .children().hide(); //자식요소 숨기기
               
            //[3] +로 설정된 항목에 대해서 click이벤트 적용
            $('li:has(ul)').click(function(event){
                           
                //this == event.target으로 현재 선택된 개체에 대해서 처리
                if(this == event.target){
                    //숨겨진 상태면 보이고 -기호로 설정 그렇지 않으면 숨기고 + 기호로 설정
                      if ($(this).children().is(':hidden')) {
                        // 보이기
                        $(this).css('list-style-image', 'url(folder.gif)').children().slideDown();
                    }
                    else {
                        // 숨기기
                        $(this).css('list-style-image', 'url(folder-closed.gif)').children().slideUp();
                    }
 
                }
                return false;          
            });
        });
    </script>
  </head>
  <body class="sb-nav-fixed">
    <nav id="topNav"></nav>
    <div id="layoutSidenav">
      <div id="layoutSidenav_nav"></div>
      <div id="layoutSidenav_content">
        <main id="input_div">
        	<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border: 1px solid red; margin: 10px 30px;"><h2>main page</h2></div>
				<div id="page_contents" class="container-fluid" style="border: 1px solid yellow; margin: 50px 50px;">
          		<!-- 컨텐츠 들어갈내용 시작-->

 <div class="row">
  <div class="col-1"></div>
   	   <div class="col-10">
		 <table class="table table-bordered">
		  <tbody>
		    <tr>
		      <th scope="row" style="background:#EAEAEA;text-align:center;">문서번호</th>
		      <td>20112344</td>
		      <th style="background:#EAEAEA;text-align:center;">직위</td>
		      <td>사원</td>
		      <th style="background:#EAEAEA;text-align:center;">보안</td>
		      <td>일반</td>
		    </tr>
		    <tr>
		      <th scope="row" style="background:#EAEAEA;text-align:center;">작성자</th>
		      <td>이상현</td>
		      <th style="background:#EAEAEA;text-align:center;">작성일자</td>
		      <td>2020-06-21</td>
		      <th style="background:#EAEAEA;text-align:center;">보존기간</td>
		      <td>1년</td>
		    </tr>
		    <!-- <tr>
		      <th scope="row">3</th>
		      <td >Larry the Bird</td>
		      <td>@twitter</td>
		    </tr> -->
		  </tbody>
		</table>
	 	</div>
 	</div>
 	<div class="row">
  <div class="col-1"></div>
   	   <div class="col-10">
		 <table class="table table-bordered">
		  <tbody>
		    <tr>
		      <th scope="row" style="width:200px;padding:1px;padding-top:14px;background:#EAEAEA;text-align:center;">제목</th>
		      <td colspan="6">
				    <input style="width:100%;height:100%;border:0px;"type="text" class="form-control" id="exampleInputEmail1" placeholder="제목을 입력하세요.">
		      </td>
		    </tr>
		    <!-- 결재자 -->
		    <tr>
		      <th scope="row" style="padding-right:10px;padding-top:14px;background:#EAEAEA;text-align:center;">
		          	결재자
		      </th>
		      <th style="width:100px;">	
		      <button style="margin-left:40px;" class="btn btn-info "
		       			data-toggle="modal" data-target="#apporve">
		      		결재자
		      </button>
		      </th>
		      <td style="width:250px;" id="rank1">[회사]이길동 사장</td>
		      <td style="width:250px;"id="rank2">[인사부]홍길동 팀장</td>
		      <td style="width:250px;"id="rank3">[영업부]올챙이 부장</td>
		      <td style="width:250px;"id="rank4">[인사부]두꺼비 부장</td>
		    </tr>
		    <tr>
		      <th scope="row" style="background:#EAEAEA;text-align:center;">결재양식</th>
		      <td>
		      <select style="margin-left:25px;">
				  <option selected>업무보고서</option>
				  <option>휴가양식</option>
				  <option>사직양식</option>
				  <option>파견양식</option>
			  </select>
		      </td>
		      <th style="background:#EAEAEA;text-align:center;">기한</th>
		      <td colspan="3">
		      	  <select>
				  <option selected>1일</option>
				  <option>3일</option>
				  <option>5일</option>
				  <option>7일</option>
				  <option>15일</option>
				  <option>30일</option>
			  </select>
		      </td>

		    </tr>
		  </tbody>
		</table>
	 	</div>
 	</div>
 		<hr style="border: solid 1px black;">
 		<!--양식 뿌려주기  -->
	<div class="row">
	<div class="col-1"></div>
	 <div style=" border:2px solid black;"class="col-8"id="test"></div>
   </div>

	</div>
	
	<div class="col-1"></div>
<!-- 	<!-- 이전꺼 보여주는 거 
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
	 <!--결재자모달  -->
  		<div class="modal fade" id="apporve" role="dialog">
    <div class="modal-dialog modal-lg" style="height:400px;">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        받은 결재
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <div id="frame_div" style="border: 1px solid black;">
   <div id="page_title" style="border: 1px solid red; margin: 20px 10px;"><h2>휴지통</h2></div>
   <div id="page_contents" style="border: 1px solid yellow; margin: 10px 10px;">
	<div class="toolbar">
  		<button id="delete" class="btn btn-danger">삭제</button>
  		<button id="restore" class="btn btn-success">복구</button>
	</div>
  		 <!-- ========================= 휴지통 테이블 ========================== -->
		<table id="table" 
			data-toolbar=".toolbar"
			data-show-columns="true" 
			data-pagination="true"
			data-search="true" 
			data-advanced-search="true"
			data-select-item-name="selectItemName"
			data-url="./member2.json">
			<thead>
				<tr>
					<th data-field="state" data-checkbox="true"></th>
					<th data-field="app_no" data-sortable="true" data-align="center" data-width="10">휴재통 보관함</th>
					<th data-field="app_name" data-sortable="true">양식</th>
					<th data-field="app_write" data-sortable="true">이름</th>
					<th data-field="app_print" data-sortable="true">상태</th>
					<th data-field="operate" data-formatter="operateFormatter" data-events="operateEvents" width="100"	data-align="center">확인</th>
				</tr>
			</thead>
		</table><!-- ======================== 휴지통 테이블 끝 ====================== -->
	</div>
</div>
         </div>
  		</div>
        
        	</div>
        <div>
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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
    <script src="../common/scripts.js"></script>
    <!-- 버거 메뉴 활성화 -->
    <script>
			$(function() {
				$('#table').bootstrapTable()
			})
			
		/* ========================= 테이블 버튼 영역 =========================== */
		/* 테이블 버튼 생성  */
		function operateFormatter(value, row) {
	    return [
	      '<a class="button" href="javascript:void(0)" title="button">',
	      '<button style="font-size:15px">확인</button>',
	      '</a>  ',
	    ].join('')
	  }
		/* 테이블버튼 생성  끝*/
		
		/* 테이블버튼 이벤트 생성 */
	  window.operateEvents = {
	    'click .button': function (e, value, row, index) {
	      alert('You click like action, row: ' + JSON.stringify(row))
	      alert('You click like action, row: ' + JSON.stringify(index))
	    }
	  }
	  /* 테이블버튼 이벤트 끝 */
	  /* ======================= 테이블 버튼 영역 끝 ===================== */
	  
	  /* ======================== 삭제 버튼 영역 ============================ */
		$(function() {
			    $('#delete').click(function () {
			      var index = []
			      $('input[name="selectItemName"]:checked').each(function () {
			        index.push($(this).data('index'))
			      })
			      alert('삭제버튼 row index: ' + index.join(', '))
			    })
			  })
	    /* ====================== 삭제 버튼 영역 끝 ============================ */
	    
	  /* ======================== 복구버튼 영역 =============================== */
		$(function() {
			    $('#restore').click(function () {
			      var index = []
			      $('input[name="selectItemName"]:checked').each(function () {
			        index.push($(this).data('index'))
			      })
			      alert('복구버튼  row index: ' + index.join(', '))
			    })
			  })
	    /* ======================= 복구 영역 =================================== */
	</script> 
  </body>
</html>
