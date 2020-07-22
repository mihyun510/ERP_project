<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
		String title = request.getParameter("bm_title");
		String content = request.getParameter("bm_content");
		//String file = request.getParameter("bs_file");
		/* 	String size = request.getParameter("bs_size"); */
		String bm_no = request.getParameter("bm_no");
		System.out.print(bm_no);
		//String emp_no = (String)session.getAttribute("emp_no");
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
<%-- <script type="text/javascript">
	alert("emp_no: "+<%= emp_no%>);
</script> --%>

<script type="text/javascript">
	function save(){
  		alert("저장 버튼 호출 성공");
 		$("#form").attr("method","get");
		$("#form").attr("action","boardUPD.erp");
		$("#form").submit();
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
                  <h2>글수정</h2>
               </div>
               <div id="page_contents" style="max-width: 1200px; margin: 50px 150px;">
<!--------------------------------------------------- 컨텐츠 들어갈내용 시작---------------------------------------------------->
                  <article>
                     <div class="container" role="main">
                        <h2></h2>
                         <form name="form" id="form">
                           <div class="mb-3">
                              <label for="title">제목</label> 
                              <input type="text" class="form-control" name="bm_title" id="bm_title" value="<%=title %>" placeholder="제목을 입력해 주세요">
                           </div>
                           <div class="mb-3">
                              <label for="content">내용</label>
                              <input type="hidden" value="<%=bm_no %>" id="bm_no"/>
                              <textarea class="form-control" rows="15" name="bm_content" id="bm_content" placeholder="내용을 입력해 주세요"><%=content %></textarea>
                           </div>
                           <div class="mb-3">
                              <label for="BS_FILE">첨부파일</label> 
                              <input type="file" id="BS_FILE"  class="form-control" name="BS_FILE" /> 
                              <%-- <input type="hidden" id="BS_SIZE" name="BS_SIZE" value="<%=size%>"> --%>
                              <input type="hidden" id="bm_no" name="bm_no" value="<%=bm_no%>">
                           </div>
                        <div>
                           <button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="save()">저장</button>
                           <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='javascript:history.back();'">닫기</button>
                        </div>
                         </form>
                     </div>
                  </article>
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