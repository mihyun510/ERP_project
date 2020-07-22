<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
   List<Map<String, Object>> bList =(List<Map<String, Object>>) request.getAttribute("boardList");
   if(bList == null){
      bList = new ArrayList<Map<String, Object>>();
   }
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
<script type="text/javascript">
   function boardListDetail(pbm_no, pbm_group){
      //글번호를 넘겨받아서 조회수를 올리고 그 번호의 제목 내용 작성자 날짜 조회수 첨부파일을 가져오자.
      var bm_no = pbm_no;
      var bm_group = pbm_group;
      alert("bm_no"+bm_no);
      alert("bm_group"+pbm_group);
      location.href="./boardDetail.erp?bm_no="+bm_no+"&bm_group="+bm_group
   }
   function page(){ 
	   $('#table').each(function() {
	   var pagesu = 5;  //페이지 번호 갯수
	   var currentPage = 0;
	   var numPerPage = 10;  //목록의 수
	   var $table = $(this);    
	   var pagination = $("#pagination");
	   //length로 원래 리스트의 전체길이구함
	   var numRows = $table.find('tbody tr').length;
	   //Math.ceil를 이용하여 반올림
	   var numPages = Math.ceil(numRows / numPerPage);
	   //리스트가 없으면 종료
	   if (numPages==0) return;
	   //pager라는 클래스의 div엘리먼트 작성
	   var $pager = $('<div class="pager"></div>');
	   var nowp = currentPage;
	   var endp = nowp+10;
	   //페이지를 클릭하면 다시 셋팅
	   $table.bind('repaginate', function() {
			   //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
			   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
			   $("#pagination").html("");
		   if (numPages > 1) {}     // 한페이지 이상이면
		   else{
			   nowp = currentPage -5;  // 6넘어가면 2부터 찍고
			   endp = nowp+pagesu;   // 10까지
			   pi = 1;
		   }
		   if (numPages < endp) {   // 10페이지가 안되면
			   endp = numPages;   // 마지막페이지를 갯수 만큼
			   nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
		   }
		   if (nowp < 1) {     // 시작이 음수 or 0 이면
		   	nowp = 0;     // 1페이지부터 시작
		   }
		   else{       // 한페이지 이하이면
			   nowp = 0;      // 한번만 페이징 생성
			   endp = numPages;
		   }
		   // [이전]
		   $('<button id="pageNum back" class="btn btn-light" style="margin-right:5px;">이전</button>').bind('click', {newPage: page},function(event) {
			   if(currentPage == 0) return; 
			   currentPage = currentPage-1;
			   $table.trigger('repaginate'); 
			   $($("#pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
		   }).appendTo(pagination).addClass('clickable');
		   // [1,2,3,4,5,6,7,8]
		   for (var page = nowp ; page < endp; page++) {
			   $('<button id="pageNum" class="btn btn-light" style="margin-right:5px;"></button>').text(page + 1).bind('click', {newPage: page}, function(event) {
				   currentPage = event.data['newPage'];
				   $table.trigger('repaginate');
				   $($("#pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			   }).appendTo(pagination).addClass('clickable');
		   } 
		   // [다음]
		   $('<button id="pageNum next" class="btn btn-light" style="margin-right:5px;">다음</button>').bind('click', {newPage: page},function(event) {
			   if(currentPage == numPages-1) return;
			   currentPage = currentPage+1;
			   $table.trigger('repaginate'); 
			   $($("#pageNum")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
		   }).appendTo(pagination).addClass('clickable');
	   });
		   $pager.insertAfter($table).find('span.pageNum:first').next().next().addClass('active');   
		   $pager.appendTo(pagination);
		   $table.trigger('repaginate');
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
               <div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
                  <h2>공지 사항</h2>
               </div>
               <div id="page_contents" style="max-width: 1200px; margin: 50px 150px;">
                  <!-- 컨텐츠 들어갈내용 시작-->
            <center><h2>[ 공지 사항 ]</h2></center>
            <div align="right" style="margin-bottom: 10px; margin-right: 20px; ">
                   <button id="btn_write" onclick="location.href='./boardWriteForm.jsp'"style="margin-right: 5px; margin-left: 10px;" class="btn btn-info"data-toggle="modal">
                                글쓰기</button>
        	 </div>
                  <div class="container" style="border: 2px solid red; border-left: 0px; border-right: 0px;">
                     <table class="table table-bordered" style="border-left:0px; border-right:0px;border-top:0px; border-bottom:0px;" id="table">
                          <tr>
                             <th  style="width:13% ; text-align:center;border-bottom: 0.5px solid;vertical-align: middle;border-left:0px;" data-align="center" >글번호</th>
                             <th  style="width:50% ;text-align:center;border-bottom: 0.5px solid #000000;border-left:0px;" data-align="center" >제목</th>
                             <th  style="width:13% ;text-align:center;border-bottom: 0.5px solid #000000;border-left:0px;" data-align="center" >작성자</th>
                             <th  style="width:13% ;text-align:center;border-bottom: 0.5px solid #000000;border-left:0px;" data-align="center" >작성일</th>
                             <th  style="width:13% ;text-align:center;border-bottom: 0.5px solid #000000;border-left:0px; border-right:0px;" data-align="center" >조회수</th>
                          </tr>
                          <%
                                for(int i = 0; i<bList.size(); i++){
                           			Map<String, Object> bMap = bList.get(i);
                          %>
                          <tr>
                             <td  style="text-align:center;border-left:0px;" data-align="center" ><%=bMap.get("BM_GROUP") %></td>
                             <td  style="border-left:0px;" data-align="center" ><a href="javascript:boardListDetail(<%=bMap.get("BM_NO")%>, <%=bMap.get("BM_GROUP") %>)"><%=bMap.get("BM_TITLE") %></a></td>
                             <td  style="border-left:0px;" data-align="center" ><%=bMap.get("EMP_NAME") %></td>
                             <td style="text-align:center;border-left:0px;" data-align="center"  ><%=bMap.get("BM_DATE") %></td>
                             <td style="text-align:center;border-left:0px; border-right:0px;" data-align="center" ><%=bMap.get("BM_HIT") %></td>
                          </tr>
                  		<%
                                }
                 		%>              
                  		</div>         
                     </table>
                            <div class="btnContent" style="text-align: center; margin:0 auto;">
                        <div id="pagination"></div>
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
<!-- 버거 메뉴 활성화 -->
<script src="../common/scripts.js"></script>

<script type="text/javascript">
$(document).ready(function(){ 
   page();
});
</script>

</body>
</html>