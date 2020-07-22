<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%

		String emp_no = (String)session.getAttribute("emp_no"); //접속한 사원 사원번호
		//String writer_pk = request.getParameter("emp_no"); //글 작성자 사원 사원번호

		List<Map<String, Object>> bList =(List<Map<String, Object>>) request.getAttribute("boardDetail");
		List<Map<String, Object>> rList =(List<Map<String, Object>>) request.getAttribute("boardListReply");
		if(bList == null || bList.size() == 0 ){
			bList = new ArrayList<Map<String, Object>>();
		}
		Map<String, Object> bMap = bList.get(0);
		if(rList == null || rList.size() == 0 ){
			rList = new ArrayList<Map<String, Object>>();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->  
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!--관리자 로그에 필요한 코드 시작=================================================================================-->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
       rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" ></script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<title>2RP PROGRAM</title>

<style>
.table {
     border: 0.5px solid #000000; border-top:0px;
}
.table-bordered > thead > tr > th,
.table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > th,
.table-bordered > thead > tr > td,
.table-bordered > tbody > tr > td,
.table-bordered > tfoot > tr > td {
      border: 0.5px solid #000000;
}
.txt_bar{
   text-color:#dee2e6
}
</style>
<script type="text/javascript">

	 function enter(){
		  alert("댓글입력버튼선택");
		  var bm_no = $("#bm_no").val();
		  var bm_title = $("#reply").val();
		  var bm_pos = $("#bm_pos").val();
		  var bm_group = $("#bm_group").val();
		  alert("bm_title:"+bm_title+", bm_pos:"+bm_pos+", bm_group:"+bm_group+", bm_no:"+bm_no);
		  $.ajax({
			  type:"get"
			  ,url:"./boardINSReply.erp?bm_no="+bm_no+"&bm_title="+bm_title+"&bm_pos="+bm_pos+"&bm_group="+bm_group
		  	  ,success:function(data){
		  		  alert("data: "+data);
		  		var reply = data.trim();
				var resDoc = JSON.parse(reply);
				var resList = '<table class="table table-bordered" style="border-left:0px;border-right:0px; ">';
				for(var i =0 ; i<resDoc.length; i++){
					resList += '<tr style="border-left:0px; border-right:0px;">'
					resList += '<td id="bm_pos" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px;border-top:0px; width: 5%">';
					resList += resDoc[i].BM_POS+'</td>';
					resList += '<td id="emp_name" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px;border-top:0px; width: 10%">'+resDoc[i].EMP_NAME+'</td>';
					resList += '<td id="cntents" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px;border-top:0px; width: 70%">'+resDoc[i].BM_TITLE+'</td>';
					resList += '<td id="date_in" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px;border-top:0px; width:15%">'+resDoc[i].BM_DATE+'</td>';
					resList += '</tr>';
				}
				resList += '</table>';
				$("#ReplyTable").html(resList);
				$("#reply").val("");
		  	  }
		  });
	  }
	
	function upd_btn(){
		var bm_no = <%=bMap.get("BM_NO")%>; // bm_no 글 번호
		   alert("글번호 테스트 bm_no : "+bm_no);
		   
		   var writer_emp_no = <%=bMap.get("EMP_NO")%>;//작성한 사원 사원번호
		   alert("작성자 사원번호 writer_emp_no : "+writer_emp_no);
		   alert("접속한 사원번호 emp_no : "+<%=emp_no %>);
	       
	     
		   var content = $("#bm_content").text();
	       var title_span = $("#bm_title").text();
	       //var click_file = $("#click_file").text();
	       if(<%=emp_no %>==writer_emp_no){ //로그인한 사람 사원번호  ==  글 작성자 사원번호
	          location.href="./boardUpdForm.jsp?bm_content="+content+"&bm_title="+title_span+"&bm_no="+bm_no;
	       } else {
	          alert("수정 권한이 없습니다.");
	       }
	 }
	
	function del_btn(){
		alert("삭제버튼 클릭완료");
	     
	      var bm_no = <%=bMap.get("BM_NO")%>; // bm_no 글 번호
	      alert("글번호 테스트 bm_no : "+bm_no);
	      var writer_emp_no = <%=bMap.get("EMP_NO")%>;//작성한 사원 사원번호
	      alert("작성자 사원번호 writer_emp_no : "+writer_emp_no);
	      alert("접속한 사원번호 emp_no : "+<%=emp_no %>);
	       
	      var bm_group = $("#bm_group").val();
	      var bs_file = $("#bs_file").text();
	       alert("bs_file: "+bs_file);
	      if(<%=emp_no %>==writer_emp_no){ //로그인한 사람 사원번호  ==  글 작성자 사원번호
	          location.href="./boardDEL.erp?bm_no="+bm_no+"&bs_file="+bs_file+"&bm_group="+bm_group
	       } else {
	          alert("삭제 권한이 없습니다.");
	       }
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
               <div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>공지 사항</h2></div>
               <div id="page_contents" style="max-width: 1200px; margin: 50px 150px;">
<!--------------------------------------------------- 컨텐츠 들어갈내용 시작---------------------------------------------------->
            <div class="container" style="border: 2px solid red; border-left:0px; border-right:0px;">
            <div style="float:right; margin: 10px;">
 				<button id= "btn_upd" onclick="javascript:upd_btn()"  style="margin-right:5px;"class="btn btn-info" >수정</button>
      			<button id= "btn_del"  onclick="javascript:del_btn()"style="margin-right:5px;"class="btn btn-info" >삭제</button>
       			<button id= "btn_list" onclick="location.href='boardList.erp'" style="margin-right:5px;"class="btn btn-info">목록</button>
		   </div>
            <table class="table table-bordered" style="border-left:0px;border-right:0px; ">
			    <tr style="border-left:0px; border-right:0px;">
			      <th style=" border: 0.5px solid #dee2e6;border-left:0px; border-top:0px;width: 55%;"><span style="margin-left:20px;" id="bm_title"><%=bMap.get("BM_TITLE")%></span></th>
			      <th style="border: 0.5px solid #dee2e6;border-left:0px;border-top:0px; width: 15%;"  >작성자:<span style="margin-left:20px;" id="emp_name"><%=bMap.get("EMP_NAME")%></span></th>
			      <th style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px; border-top:0px; width: 18%;">날짜:<span style="margin-left:20px;" id="bm_date"><%=bMap.get("BM_DATE")%></span></th>
			      <th style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px; border-top:0px; width: 23%;">| 조회수<span class="text-secondary" id="bm_hit"><%=bMap.get("BM_HIT")%></span></th>
			   </tr>
			    <tr style="border-left:0px; border-right:0px;">
			    <%
			    	if(bMap.get("BS_FILE") == null){
			    %>
			      <th style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px; border-top:0px; width: 18%;">첨부파일: <span class="text-secondary" id="bs_file">첨부된 파일이 없습니다.</span></th>
			    <%
			    	}else{
			    %>  
			     <th style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px; border-top:0px; width: 18%;">첨부파일: <span class="text-secondary" id="bs_file"><a href="downLoad.jsp?bs_file=<%=bMap.get("BS_FILE")%>"><%=bMap.get("BS_FILE")%></a></span></th>
			    <%
			    	}
			    %>
			   </tr>
  				<tr style="border-left:0px; border-right:0px;">
  					<td colspan="4" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px; border-bottom:0px;">
  					<input type="hidden" value="<%=bMap.get("EMP_NO") %>" id="emp_no" name="emp_no"/><!-- 사원번호 -->
  					<input type="hidden" value="<%=bMap.get("BM_NO") %>" id="bm_no" name="bm_no"/><!-- 글번호 -->
  					<input type="hidden" value="<%=bMap.get("BM_GROUP") %>" id="bm_group" name="bm_group"/><!-- 댓글번호 -->
  					<input type="hidden" value="<%=bMap.get("BM_POS") %>" id="bm_pos" name="bm_pos"/><!-- 댓글번호 -->
      					<textarea id="bm_content" style="border:0px;"class="form-control" rows="20"placeholder="내용을 입력해 주세요" disabled="disabled"><%=bMap.get("BM_CONTENT")%></textarea>
   					</td>
   				</tr>
   				<tr>
   					<td colspan="3" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px;border-top:0px;">
      					<textarea id="reply" style="border:0px;"class="form-control" rows="3"placeholder="댓글을 입력해 주세요"></textarea>
   					</td>
   					<td colspan="1" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px;border-top:0px;">
      					<button id="btn_enter" onclick="enter()"  style="margin-right:3px;"class="btn btn-info" >입력</button>
   					</td>
   				</tr>
            </table>
            <div>댓글</div>
            <div id="ReplyTable">
           <table id="table" style="border-left:0px;border-right:0px;" class="table table-bordered">
           <%
           	for(int i = 1 ; i<rList.size(); i++){
					Map<String, Object> rmap = rList.get(i);
			%>
           		<tr style="border-left:0px; border-right:0px;">
	             	<td id="bm_pos" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px;border-top:0px; width: 5%"><%=rmap.get("BM_POS") %></td>
	             	<td id="emp_name" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px;border-top:0px; width: 10%"><%=rmap.get("EMP_NAME") %></td>
	             	<td id="bm_title" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px;border-top:0px; width: 70%"><%=rmap.get("BM_TITLE") %></td>
	             	<td id="bm_tdate" style="border: 0.5px solid #dee2e6;border-left:0px; border-right:0px;border-top:0px; width: 70%"><%=rmap.get("BM_DATE") %></td>
	             </tr>
	     <%
           	}
	    %>
	             </table>
             </div>
          </div>                  
<!----------------------------------------------------- 컨텐츠 들어갈내용 끝   ------------------------------------------------------------------->
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

</body>
</html>