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
<!-- 파라미터 받기  -->
 <%
	request.setCharacterEncoding("UTF-8");
 	String ap_reporter = request.getParameter("ap_reporter"); //이름 채번
 	String no  = request.getParameter("no"); //번호  채번
 	String fr_no  = request.getParameter("fr_no"); //양식 채번
 	String ap_title  = request.getParameter("ap_title"); //제목 채번
 	String ap_prosessingdate  = request.getParameter("ap_prosessingdate"); //기한 채번
 	String ap_dname  = request.getParameter("ap_dname"); //부서 채번
 	String ap_content  = request.getParameter("ap_content"); //문서 내용 채번
 	String ap_contact = request.getParameter("ap_contact"); //사원 번호 채번
 	String ap_bego = request.getParameter("ap_bego"); //비고 
 	String ap_instructions = request.getParameter("ap_instructions"); //특이사항
 	String ap_appdate = request.getParameter("ap_appdate"); //작성일자
 	String ap_appdate_1 = request.getParameter("ap_appdate_1"); //년
 	String ap_appdate_2 = request.getParameter("ap_appdate_2"); //월
 	String ap_appdate_3 = request.getParameter("ap_appdate_3"); //일
 	String ap_no = request.getParameter("ap_no"); //문서 고유번호
	String ap_sign = request.getParameter("ap_sign");
 	String ap_retiredate = request.getParameter("ap_retiredate");
 	String null_check = "undefined"; //null체크
 	
%>
<!-- 파라미터 받기 끝 -->

</head>
<body class="sb-nav-fixed">
   <nav id="topNav"></nav>
   <div id="layoutSidenav">
      <div id="layoutSidenav_nav"></div>
      <div id="layoutSidenav_content">
           

  	 
		<hr style="border: solid 1px black;">
	<div class="row">
		<div class="col-1"></div>
			<div style=" border:1px solid black;"class="col-10"id="page_print"></div>
	</div>		

<!-- 	<!-- 이전꺼 보여주는 거 -->
	  <div class="row">
		<div class="col-1"></div>
		<div class="col-10"></div>
	  </div>
	<div class="col-1"></div>

	  	<!--	페이지 나누기	  -->
	  	 <script type="text/javascript">
	  		//파라미터 값 추가 	
	  		var page = <%=fr_no%> ;
	  		var ap_reporter = "<%=ap_reporter%>";
	  		var no = <%=no%>;
	  		var fr_no= <%=fr_no%>;
	  		var ap_title= "<%=ap_title%>";
	  		var ap_prosessingdate = "<%=ap_prosessingdate%>";
	  		var ap_dname = "<%=ap_dname%>";
	  		var ap_content = "<%=ap_content%>";
	  		var ap_contact = "<%=ap_contact%>";
	  		var ap_bego = "<%=ap_bego%>";
	  		var ap_instructions = "<%=ap_instructions%>";
	  		var ap_appdate = "<%=ap_appdate%>" ;
	  		var ap_appdate_1 = "<%=ap_appdate_1%>" ;
	  		var ap_appdate_2 = "<%=ap_appdate_2%>" ;
	  		var ap_appdate_3 = "<%=ap_appdate_3%>" ;
	  		var ap_no = <%=ap_no%>
	  		var ap_sign = "<%=ap_sign%>";
	  		var ap_retiredate = "<%=ap_retiredate%>" ;
	  	 	 
	  	 $(document).ready(function(){
	  	 			if(page===1){	//휴가 페이지
						$.ajax({
							url:"./huga_print.jsp?ap_reporter='+ap_reporter"
								+'&no='+no+'&fr_no='+fr_no+'&ap_title='+ap_title
								+'&ap_prosessingdate='+ap_prosessingdate+'&ap_dname='
									+ap_dname+'&ap_content='+ap_content+'&ap_contact='+ap_contact
									+'&ap_appdate='+ap_appdate+'&ap_appdate_1='+ap_appdate_1+'&ap_appdate_2='+ap_appdate_2+'&ap_appdate_3='+ap_appdate_3
									+'&ap_bego='+ap_bego+'&ap_instructions='+ap_instructions+'&ap_sign='+ap_sign+"&ap_retiredate="+ap_retiredate 
									
							,success:function(data){
								$("#page_print").html(data);
								$("#ap_reporter").val("<%=ap_reporter%>");
								$("#ap_prosessingdate").val("<%=ap_prosessingdate%>");
								$("#ap_dname").val("<%=ap_dname%>");
								$("#ap_content").val("<%=ap_content%>");
								$("#ap_contact").val("<%=ap_contact%>");
								$("#ap_year").val("<%=ap_appdate_1%>");
								$("#ap_month").val("<%=ap_appdate_2%>");
								$("#ap_today").val("<%=ap_appdate_3%>");
								$("#ap_namein").val("<%=ap_reporter%>"); 
								$("#ap_sign").attr("src","http://localhost:5000/work/<%=ap_sign %>");
							} //성공 했을 때 
						}) //아작스 종료 
					} //휴가 끝 
	  	 			else if(page===2){	//파견 페이지 
						$.ajax({
							url:"./paguns_print.jsp?ap_reporter='+ap_reporter"
								+'&no='+no+'&fr_no='+fr_no+'&ap_title='+ap_title
								+'&ap_prosessingdate='+ap_prosessingdate+'&ap_dname='
									+ap_dname+'&ap_content='+ap_content+'&ap_contact='+ap_contact
									+'&ap_appdate='+ap_appdate+'&ap_appdate_1='+ap_appdate_1+'&ap_appdate_2='+ap_appdate_2+'&ap_appdate_3='+ap_appdate_3
									+'&ap_bego='+ap_bego+'&ap_instructions='+ap_instructions+'&ap_sign='+ap_sign
							,success:function(data){
								$("#page_print").html(data);
								$("#ap_reporter").val("<%=ap_reporter%>");
								$("#ap_dname").val("<%=ap_dname%>");
								$("#ap_prosessingdate").val("<%=ap_prosessingdate%>");
								$("#ap_content").val("<%=ap_content%>");
								$("#ap_contact").val("<%=ap_contact%>");
								$("#ap_year").val("<%=ap_appdate_1%>");
								$("#ap_month").val("<%=ap_appdate_2%>");
								$("#ap_today").val("<%=ap_appdate_3%>");
								$("#ap_namein").val("<%=ap_reporter%>"); 
								$("#ap_sign").attr("src","http://localhost:5000/work/<%=ap_sign %>");
								}
						})
					
				}
	  	 			
	  	 		else if(page===3){	//업무보고서 
						$.ajax({
							url:"./upmo_print.jsp?ap_reporter='+ap_reporter"
								+'&no='+no+'&fr_no='+fr_no+'&ap_title='+ap_title
								+'&ap_prosessingdate='+ap_prosessingdate+'&ap_dname='
									+ap_dname+'&ap_content='+ap_content+'&ap_contact='+ap_contact
									+'&ap_appdate='+ap_appdate+'&ap_appdate_1='+ap_appdate_1+'&ap_appdate_2='+ap_appdate_2+'&ap_appdate_3='+ap_appdate_3
									+'&ap_bego='+ap_bego+'&ap_instructions='+ap_instructions+'&ap_sign='+ap_sign
							,success:function(data){
								$("#page_print").html(data);
								$("#ap_reporter").val("<%=ap_reporter%>");
								$("#ap_appdate").val("<%=ap_appdate%>");
								$("#ap_content").val("<%=ap_content%>");
								$("#ap_bego").val("<%=ap_bego%>");
								$("#ap_instructions").val("<%=ap_instructions%>");
								$("#ap_sign").attr("src","http://localhost:5000/work/<%=ap_sign %>");
							}
						})	
				}
	  	 		else if(page===4){	//업무지시서 
						$.ajax({
							url:"./upmog_print.jsp?ap_reporter='+ap_reporter"
								+'&no='+no+'&fr_no='+fr_no+'&ap_title='+ap_title
								+'&ap_prosessingdate='+ap_prosessingdate+'&ap_dname='
									+ap_dname+'&ap_content='+ap_content+'&ap_contact='+ap_contact
									+'&ap_appdate='+ap_appdate+'&ap_appdate_1='+ap_appdate_1+'&ap_appdate_2='+ap_appdate_2+'&ap_appdate_3='+ap_appdate_3
									+'&ap_bego='+ap_bego+'&ap_instructions='+ap_instructions+'&ap_sign='+ap_sign
							,success:function(data){
								$("#page_print").html(data);
								$("#ap_reporter").val("<%=ap_reporter%>");
								$("#ap_appdate").val("<%=ap_appdate%>");
								$("#ap_content").val("<%=ap_content%>");
								$("#ap_bego").val("<%=ap_bego%>");
								$("#ap_instructions").val("<%=ap_instructions%>");
								$("#ap_sign").attr("src","http://localhost:5000/work/<%=ap_sign %>");
							}
						})	
				}
				
				else if(page===5){	//사직서 
						$.ajax({
							url:"./sagic_print.jsp?ap_reporter='+ap_reporter"
								+'&no='+no+'&fr_no='+fr_no+'&ap_title='+ap_title
								+'&ap_prosessingdate='+ap_prosessingdate+'&ap_dname='
									+ap_dname+'&ap_content='+ap_content+'&ap_contact='+ap_contact
									+'&ap_appdate='+ap_appdate+'&ap_appdate_1='+ap_appdate_1+'&ap_appdate_2='+ap_appdate_2+'&ap_appdate_3='+ap_appdate_3
									+'&ap_bego='+ap_bego+'&ap_instructions='+ap_instructions+'&ap_sign='+ap_sign+"&ap_retiredate="+ap_retiredate
							,success:function(data){
								$("#page_print").html(data);
								$("#ap_reporter").val("<%=ap_reporter%>");
								$("#ap_dname").val("<%=ap_dname%>");
								$("#ap_retiredate").val("<%=ap_retiredate%>");
								$("#ap_content").val("<%=ap_content%>");
								$("#ap_contact").val("<%=ap_contact%>");
								$("#ap_year").val("<%=ap_appdate_1%>");
								$("#ap_month").val("<%=ap_appdate_2%>");
								$("#ap_today").val("<%=ap_appdate_3%>");
								$("#ap_namein").val("<%=ap_reporter%>"); 
								$("#ap_sign").attr("src","http://localhost:5000/work/<%=ap_sign %>");
							}
						})
					}
	  	 			
				else if(page===6){	//회의 보고서
						$.ajax({
							url:"./conference_print.jsp?ap_reporter='+ap_reporter"
								+'&no='+no+'&fr_no='+fr_no+'&ap_title='+ap_title
								+'&ap_prosessingdate='+ap_prosessingdate+'&ap_dname='
									+ap_dname+'&ap_content='+ap_content+'&ap_contact='+ap_contact
									+'&ap_appdate='+ap_appdate+'&ap_appdate_1='+ap_appdate_1+'&ap_appdate_2='+ap_appdate_2+'&ap_appdate_3='+ap_appdate_3
									+'&ap_bego='+ap_bego+'&ap_instructions='+ap_instructions+'&ap_sign='+ap_sign
							,success:function(data){
								$("#page_print").html(data);
								$("#ap_reporter").val("<%=ap_reporter%>");
								$("#ap_dname").val("<%=ap_dname%>");
								$("#ap_prosessingdate").val("<%=ap_prosessingdate%>");
								$("#ap_content").val("<%=ap_content%>");
								$("#ap_contact").val("<%=ap_contact%>");
								$("#ap_appdate").val("<%=ap_appdate%>");
								$("#ap_year").val("<%=ap_appdate_1%>");
								$("#ap_month").val("<%=ap_appdate_2%>");
								$("#ap_today").val("<%=ap_appdate_3%>");
								$("#ap_namein").val("<%=ap_reporter%>"); 
								$("#ap_bego").val("<%=ap_bego%>");
								$("#ap_instructions").val("<%=ap_instructions%>");
								$("#ap_sign").attr("src","http://localhost:5000/work/<%=ap_sign %>");
							}
						})
					}
	  	 			
	  	 			
	  	 			
	  			 }) // $(document).ready처리 끝
			</script> 
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