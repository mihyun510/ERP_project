<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<head> 
<link rel="stylesheet"  type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet"  type="text/css" href="../css/bootstrap-grid.css">
<link rel="stylesheet"  type="text/css" href="../css/bootstrap-reboot.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/dist/bootstrap-table.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/jquery.treeview.css" />
<link rel="stylesheet" href="../css/screen.css" />
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../js/jquery.treeview.js" type="text/javascript"></script>
<style type="text/css">
        fieldset {         
                width: 300px   
        }
       
    </style>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <script type="text/javascript">
        $(document).ready(function () {
            //[1] 리스트의 기본 모양 지정 : <ul>를 자식으로 가지지 않는 li의 블릿기호는 기본 모양
            $('li:not(:has(ul))').css({ cursor: 'default', 'list-style-image':'none'});
           
            //[2] 자식 요소를 갖는 li에 대해서는 블릿이미지를 plus.gif를 지정
            $('li:has(ul)') //자식 요소(ul)를 갖는 요소(li)에 대해서
                .css({cursor: 'pointer', 'list-style-image':'url(plus.gif)'})//+기호로 설정
                .children().hide(); //자식요소 숨기기
               
            //[3] +로 설정된 항목에 대해서 click이벤트 적용
            $('li:has(ul)').click(function(event){
                           
                //this == event.target으로 현재 선택된 개체에 대해서 처리
                if(this == event.target){
                    //숨겨진 상태면 보이고 -기호로 설정 그렇지 않으면 숨기고 + 기호로 설정
                      if ($(this).children().is(':hidden')) {
                        // 보이기
                        $(this).css('list-style-image', 'url(minus.gif)').children().slideDown();
                    }
                    else {
                        // 숨기기
                        $(this).css('list-style-image', 'url(plus.gif)').children().slideUp();
                    }
 
                }
                return false;          
            });
        });
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
  </head>
<body>  
<!--*****************  -->
<div id="frame_div" style="border: 1px solid black;">
  <div id="page_title" style="border: 1px solid red; margin: 10px 30px;"><h2>결재 신청</h2></div>
  	 <div id="page_contents" style="border: 1px solid yellow; margin: 10px 50px;">
  	   <div style="margin-top:15px;"class="col-5">
  	   </div>
  	   <hr style="border: solid 1px black;">
  	   <!-- 이쪽 부분은 저절로 나오게하는부분 -->
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
		      <button style="margin-left:70px;"type="button" class="btn btn-info "
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
		      <select>
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
	<div style=" border:2px solid black;"class="col-10"id="test"></div>
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
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        받은 결재
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <!-- *****************트리구조 ***************-->
			   
        <ul>
            <li>게시판</li>
            <li>자바과정-기초
                <ul>
                    <li>기본문법</li>
                    <li>AWT/SWING</li>
                    <li>JDBC</li>
                    <li>자바예제</li>
                    <li>자바복습</li>
                </ul>
           </li>
           <li>웹프로그래밍
                <ul>
                    <li>JSP&amp;Servlet</li>
                    <li>프레임워크
                        <ul>
                            <li>struts2(스트럿츠2)</li>
                            <li>Spring(스프링)</li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
   
        <!--*****************트리구조끝*****************  -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-info " data-dismiss="modal">기각</button>
        </div>
      </div>
    </div>
  </div>
  </body>
</html>  