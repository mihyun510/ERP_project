<%@page import="com.util.DBConnectionMgr"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
 Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String imsi[] = null;
 	String pos[] =new String[5];
 	pos[0] = "인사과장 ";
 	pos[1] = "인사차장 ";
 	pos[2] = "인사부장 ";
 	pos[3] = "사장";
 	pos[4] = "";
 	
 	String state[] = new String[5];
 	state[0] = "승인";
 	state[1] = "결재중";
 	state[2] = "";
 	state[3] = "";
 	state[4] = "";
/* 	 List<Map<String,Object>> receiver =
		(List<Map<String,Object>>)request.getAttribute("sel_recestates");//결재자사람
	List<Map<String,Object>> recestate=
	(List<Map<String,Object>>) request.getAttribute("sel_recestate");//결재자 진행중 */
	request.setCharacterEncoding("UTF-8");
 	String ap_reporter = request.getParameter("ap_reporter"); //이름 채번
 	String no  = request.getParameter("no"); //번호  채번
 	String fr_no  = request.getParameter("fr_no"); //양식 채번
 	String ap_title  = request.getParameter("ap_title"); //제목 채번
 	String ap_prosessingdate  = request.getParameter("ap_prosessingdate"); 
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
 	String page_no = request.getParameter("key"); //페이지 번호
 	String ap_state = request.getParameter("ap_state"); //결재 상태
	String ap_sign = request.getParameter("ap_sign");
 	String ap_retiredate = request.getParameter("ap_retiredate");
 	
 	String null_check = "undefined"; //null체크
 	
 	if(ap_reporter.equals(null_check)){
 		ap_reporter = "";
 	}
 	if(no.equals(null_check)){
 		no = "";
 	}
 	if(fr_no.equals(null_check)){
 		fr_no = "";
 	}
 	if(ap_title.equals(null_check)){
 		ap_title = "";
 	}
 	if(ap_prosessingdate.equals(null_check)){
 		ap_prosessingdate = "";
 	}
 	if(ap_dname.equals(null_check)){
 		ap_dname = "";
 	}
 	if(ap_content.equals(null_check)){
 		ap_content = "";
 	}
 	if(ap_contact.equals(null_check)){
 		ap_contact = "";
 	}
 	if(ap_bego.equals(null_check)){
 		ap_bego = "";
 	}
 	if(ap_instructions.equals(null_check)){
 		ap_instructions = "";
 	}
 	if(ap_appdate.equals(null_check)){
 		ap_appdate = "";
 	}
 	if(ap_appdate_1.equals(null_check)){
 		ap_appdate_1 = "";
 	}
 	if(ap_appdate_2.equals(null_check)){
 		ap_appdate_2 = "";
 	}
 	if(ap_appdate_3.equals(null_check)){
 		ap_appdate_3 = "";
 	}
 	if(ap_no.equals(null_check)){
 		ap_no = "";
 	}
 	if(ap_sign.equals(null_check)){
 		ap_sign = "";
 	}
%>
<!-- 파라미터 받기 끝 -->

<script type="text/javascript">
	

	function approval(){//승인 모달에 승인 페이지 
		ap_no = <%=ap_no%>
		location.href="./workAgree.erp?ap_no="+ ap_no
	}

	function dismissal(){ //기각 모달에 기각 페이지 
		//alert("기각 버튼 호출 성공");
		$("#f_gigag").attr("method","get");
		$("#f_gigag").attr("action","workDeny.erp");
		$("#f_gigag").submit();
	}
	
	function page_print(){ //인쇄버튼 반응
	//파라미터 값 추가 
		ap_reporter = "<%=ap_reporter%>"
		no = <%=no%>
		fr_no= <%=fr_no%>
		ap_title= "<%=ap_title%>"
		ap_prosessingdate = "<%=ap_prosessingdate%>"
		ap_dname = "<%=ap_dname%>"
		ap_content = "<%=ap_content%>"
		ap_contact = "<%=ap_contact%>"
		ap_bego = "<%=ap_bego%>"
		ap_instructions = "<%=ap_instructions%>"
		ap_appdate = "<%=ap_appdate%>"
		ap_appdate_1 = "<%=ap_appdate_1%>"
		ap_appdate_2 = "<%=ap_appdate_2%>"
		ap_appdate_3 = "<%=ap_appdate_3%>"
		ap_no = <%=ap_no%>
		ap_sign= "<%=ap_sign%>"
		ap_retiredate = "<%=ap_retiredate%>"

	 		location.href = '../page/approval_print.jsp?ap_reporter='+ap_reporter
				+'&no='+no+'&fr_no='+fr_no+'&ap_title='+ap_title
				+'&ap_prosessingdate='+ap_prosessingdate+'&ap_dname='
				+ap_dname+'&ap_content='+ap_content+'&ap_contact='+ap_contact
				+'&ap_appdate='+ap_appdate+'&ap_appdate_1='+ap_appdate_1
				+'&ap_appdate_2='+ap_appdate_2+'&ap_appdate_3='+ap_appdate_3+'&ap_bego='+ap_bego
				+'&ap_instructions='+ap_instructions+'&ap_no='+ap_no+'&ap_sign='+ap_sign +"&ap_retiredate="+ ap_retiredate
	}

</script>
</head>
<body class="sb-nav-fixed">
   <nav id="topNav"></nav>
   <div id="layoutSidenav">
      <div id="layoutSidenav_nav"></div>
      <div id="layoutSidenav_content">
           

	 <h2><div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"/></h2>
  	 <div id="page_contents" style="border: 1px solid black; max-width: 1530px; margin: 0px 50px;">
  	 
  	 
  	 <div class="row"><!--승인 기각버튼  -->
  	 <div  class="col-1"></div>
	    <div style="margin-top:15px;" id= "btns" class="col-5">
	        <button id= "btn_print" onclick="page_print()"  style="margin-right:5px;"class="btn btn-info" data-toggle="modal" >인쇄</button>
	    	<button id= "btn_approval"  style="margin-right:5px;"class="btn btn-info" data-toggle="modal" data-target="#myModal">승인</button>
	        <button id= "btn_dismissal"  style="margin-right:5px;"class="btn btn-info" data-toggle="modal" data-target="#myModal1">기각</button>
	        </div> <!--드랍다운 끝  -->
	      <div class="col-2"></div>
			</div>
        <hr style="border: solid 1px black;">
  	<div class="row">
  	  <div class="col-1"></div>
  	 	<div class="col-10">
  	 	<br>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th scope="row" style="background: #EAEAEA; width:17%; text-align: center;">문서 번호</th>
						<td style="width:17%;"><span><%= no  %></span></td>
						<th style="background: #EAEAEA; text-align: center;">제목</th> <td><span><%= ap_title %></span></td>
							<th style="background:  #EAEAEA; width:17%; text-align: center;">부서</th>
							<td style="width:17%;"><span><%=ap_dname%></span></td>
					</tr>
					<tr>
						<th scope="row" style="background: #EAEAEA; width:17%; text-align: center;">작성자</th>
						<td style="width:17%;"><span><%=ap_reporter%></span></td>
						<th style="background: #EAEAEA; text-align: center;">작성 일자</th>
						<td><span><%= ap_appdate%></span></td>
						<th style="background: #EAEAEA; text-align: center;">결재 상태</th><td><span><%=ap_state %></span></td>
						</tr>
							<%
						
						String position[] = null;
						Vector<String> v = new Vector<>();
						DBConnectionMgr dbmgr =DBConnectionMgr.getInstance(); 
						PreparedStatement pstmt = null;
						StringBuilder sb = new StringBuilder();
						sb.append(" SELECT E.EMP_POSITION as"); 
						sb.append(" EMP_POSITION,R.REV_LEVEL as REV_LEVEL FROM APPROVE");
						sb.append(" A,RECEIVER R,EMP E WHERE A.AP_NO = R.AP_NO");
						sb.append(" AND A.AP_NO = ? AND R.EMP_NO = E.EMP_NO ORDER BY R.REV_LEVEL ASC");
						try {
							con = dbmgr.getConnection();
							pstmt = con.prepareStatement(sb.toString());
							pstmt.setInt(1, Integer.parseInt(ap_no));
							rs= pstmt.executeQuery();
							while(rs.next()) {
								String EMP_POSITION = rs.getString("EMP_POSITION");
								System.out.println( rs.getString("EMP_POSITION"));
								v.add(EMP_POSITION);
							}
							System.out.println("vv" + v.size());
							//v.copyInto(position);
						}catch(SQLException se) {
							System.out.println(se.toString());
						}catch(Exception e){
							e.printStackTrace();
						}
						
						%>
								<tr>
							<th rowspan="2"scope="row" style=" vertical-align: middle;background: #EAEAEA; width:17%; text-align: center;">
						결재 진행
								</th>
						<%
						if(v.size() > 8){
							for (int i = 0; i < v.size(); i++) {
						%>
						<td style="text-align:center;vertical-align: middle;width:17%;border-left:0px; border-right:0px;border-bottom:0px; ">
							<%=v.get(i) %>
						</td>
						<%
							}
						}else{
								int size = v.size();
								for(int y = 0; y < 8 - v.size(); y++){
									v.add(size, "");
									size++;
								}
								for (int i = 0;i< v.size(); i++) {
									
									%>
									<td style="text-align:center;vertical-align: middle;width:17%;border-left:0px; border-right:0px; border-top:0px;">
											<%=v.get(i)%>
									</td>
									<%
								}
							}
						%>
						</tr>
						<%
						  Vector<String> v1 = new Vector<>();
						 dbmgr =DBConnectionMgr.getInstance(); 
						 String imsi11="";
						StringBuilder sb1 = new StringBuilder();
						sb1.append("SELECT REV_APPROVAL,REV_LEVEL FROM APPROVE A,RECEIVER R,EMP E");
						sb1.append(" WHERE A.AP_NO = R.AP_NO");
						sb1.append(" AND A.AP_NO =?");
						sb1.append(" AND R.EMP_NO = E.EMP_NO");
						sb1.append(" AND REV_PROCESSING = 'true'");
						sb1.append(" ORDER BY R.REV_LEVEL ASC");
						try {
							con = dbmgr.getConnection();
							pstmt = con.prepareStatement(sb1.toString());
							pstmt.setInt(1, Integer.parseInt(ap_no));
							rs= pstmt.executeQuery();
							while(rs.next()) {
								String REV_APPROVAL = rs.getString("REV_APPROVAL");
								System.out.println(rs.getString("REV_APPROVAL"));
								v1.add(REV_APPROVAL);
							}
							System.out.println("REV_APPROVAL" + v1.size());
							//v.copyInto(position);
						}catch(SQLException se) {
							System.out.println(se.toString());
						}catch(Exception e){
							e.printStackTrace();
						}
						%>
						<tr>
							<%
							if(v1.size() > 8){
								for (int i = 0;i< v1.size(); i++) {
										
							%>
							<td style="text-align:center;vertical-align: middle;width:17%;border-left:0px; border-right:0px; border-top:0px;">
									<%=v1.get(i)%>
							</td>
							<%
								}
							}else{
								int size = v1.size();
								for(int y = 0; y < 8 - v1.size(); y++){
									v1.add(size, "");
									size++;
								}
								for (int i = 0;i< v1.size(); i++) {
									
									%>
									<td style="text-align:center;vertical-align: middle;width:17%;border-left:0px; border-right:0px; border-top:0px;">
											<%=v1.get(i)%>
									</td>
									<%
								}
							}
						%>
						</tr>
				</tbody>
			</table>
  	 	</div>
  	 </div>
		<hr style="border: solid 1px black;">
	<div class="row">
		<div class="col-1"></div>
			<div style=" border:2px solid black;"class="col-10"id="page"></div>
	</div>		<div class="col-1"></div>

<!-- 	<!-- 이전꺼 보여주는 거 -->
	  <div class="row">
		<div class="col-1"></div>
		<div class="col-10"></div>
	  </div>
	<div class="col-1"></div>
	</div>
	</div>
	  	<!--	페이지 나누기	  -->
	  	 <script type="text/javascript">
				page = <%=fr_no%>
				
				$(document).ready(function(){
		  	 			if(page===1){	//휴가 페이지
		  	 			$.ajax({
		  	 				url:"../page/huga.jsp"
								,success:function(data){
									$("#page").html(data);
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
								} //성공 했을 때
		  	 			
							}) //아작스 종료 
						} //휴가 끝 
		  	 			else if(page===2){	//파견 페이지 
							$.ajax({
									url:"../page/paguns.jsp"
									,success:function(data){
										$("#page").html(data);
										$("#ap_reporter").val("<%=ap_reporter%>");
										$("#ap_dname").val("<%=ap_dname%>");
										$("#ap_prosessingdate").val("<%=ap_prosessingdate%>");
										$("#ap_content").val("<%=ap_content%>");
										$("#ap_contact").val("<%=ap_contact%>");
										$("#ap_year").val("<%=ap_appdate_1%>");
										$("#ap_month").val("<%=ap_appdate_2%>");
										$("#ap_today").val("<%=ap_appdate_3%>");
										$("#ap_namein").val("<%=ap_reporter%>"); 
										$("#ap_sign").attr("src",'http://localhost:5000/work/<%=ap_sign %>');
								}
							})
						
					}
		  	 			else if(page===3){	//업무보고서 
							$.ajax({
									url:"../page/upmo.jsp"
									,success:function(data){
										$("#page").html(data);
										$("#ap_reporter").val("<%=ap_reporter%>");
										$("#ap_appdate").val("<%=ap_appdate%>");
										$("#ap_content").val("<%=ap_content%>");
										$("#ap_bego").val("<%=ap_bego%>");
										$("#ap_instructions").val("<%=ap_instructions%>");
										$("#ap_sign").attr("src","http://localhost:5000/work/<%=ap_sign %>");
									}
							})	
					}
		  	 			else if(page===4){	//업무 지시서
							$.ajax({
									url:"../page/upmog.jsp"
									,success:function(data){
										$("#page").html(data);
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
								url:"../page/sagic.jsp"
								,success:function(data){
									$("#page").html(data);
									$("#ap_reporter").val("<%=ap_reporter%>");
									$("#ap_dname").val("<%=ap_dname%>");
									$("#ap_retiredate").val("<%=ap_retiredate%>");
									$("#ap_content").val("<%=ap_content%>");
									$("#ap_contact").val("<%=ap_contact%>");
									$("#ap_year").val("<%=ap_appdate_1%>");
									$("#ap_month").val("<%=ap_appdate_2%>");
									$("#ap_today").val("<%=ap_appdate_3%>");
									$("#ap_namein").val("<%=ap_reporter%>"); 
									$("#ap_sign").attr("src",'http://localhost:5000/work/<%=ap_sign %>');
								}
							})
					} 	
		  	 			
		  	 		else if(page===6){	//회의 보고서
							$.ajax({
								url:"../page/conference.jsp"
								,success:function(data){
									$("#page").html(data);
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
									$("#ap_sign").attr("src",'http://localhost:5000/work/<%=ap_sign %>');
								}
							})
					} 	
		  	 			
		  	}) // $(document).ready처리 끝

				
			</script> 
			<!--	페이지 나누기 끝	  -->
		<script>
		$(document).ready(function(){
			page_no = <%=page_no%>
		if(page_no == "0"){
			$('#btn_print').show();
			$('#btn_approval').show();
			$('#btn_dismissal').show();
			$("#page_title").text("받은 결재함");
		}else if(page_no == "1"){
			$('#btn_print').show();
			$('#btn_approval').hide();
			$('#btn_dismissal').hide();
			$("#page_title").text("보낸 결재함");
		}
		});
		</script>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header ">
     		 받은 결재
          <button type="button"  class="close" data-dismiss="modal">&times;</button>	
        </div>
        <div class="modal-body">
	        <br>
	      	승인 하시겠습니까?
	        <br>
	        <br>
        </div>
        <div class="modal-footer">
          <button type="button" name = "workAgree" onclick="approval()" class="btn btn-info" data-dismiss="modal">승인</button> <!--  승인 버튼  -->
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
</div>  
  <!-- 기각 모달 -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
     		  <h5>기각 하시겠습니까?</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
		<h6>기각사유</h6>
		<form id="f_gigag">
		<div class="row">
		<div class="col-12" style="margin-top:12px;">
		 <textarea id="text_gigag" name="ap_reason" class="form-control" style="width:100%;"id="exampleFormControlTextarea1" rows="10"></textarea>
		 <br>
		 <br>
		</div>
        </div>
        <input name="ap_no" type="hidden" value=<%=ap_no%> />
        </form>
        <div class="modal-footer">
          <!--  기각 버튼  -->
          <button type="button" onclick="dismissal()" class="btn btn-info " data-dismiss="modal">기각</button>	 
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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