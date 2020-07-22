<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String fr_no  = request.getParameter("fr_no"); //양식 채번
		String s_empno = "";
		String s_ename = "";
		String dept_name = "";
		if(session.getAttribute("emp_no")!=null){
			s_ename = session.getAttribute("emp_name").toString();
			s_empno = session.getAttribute("emp_no").toString();
			dept_name= session.getAttribute("dept_name").toString();
			
		}
		//out.print(s_empno);
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!--관리자 로그에 필요한 코드 시작=================================================================================-->
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css" />
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<title>2RP PROGRAM</title>
<script type="text/javascript">
		var to = new Date(); 
		var year = to.getFullYear().toString(); // 년도
		var month = (to.getMonth() + 1).toString();  // 월
		var date = to.getDate().toString();  // 날짜
		if(month.length==1){//길이 11이면 2개  
			month = "0"+month;
		}
		if(date.length==1){
			date = "0"+date;
		}///
		var dates3 = year+'-'+month+'-'+date;
		var imsi;
		var g_names=[];//배열 변수
		var g_position =[];//배열 변수
		var g_no = [];
		function appov(){ //모달에 있는 확인 버튼을 눌렀을대 onclick이벤트
		var num = $('input:checkbox[name="selectItemName"]:checked').length;//체크된 아이들 갯수 ex)2개 선택했으면 2가뜸
		//alert("num:" +num);
		$("#approvalName").html("");//span 태그에 있는 값 지우기 //하는이유 다시 결재창 버튼을 눌렀을때 span태그에있는 값을 초기화
		if(num>0){//span 태그에 선택한 값 넣어주기 num- 2개 선택하면 0보다 2가 더크면 for문을돌려라  i가 0부터시작인까 0,1로올라간다.
			for(var i=0;i<g_names.length;i++) {//for문을 돌리면 var 0,1 g_names길이는 3이뜰꺼임 
				if(i==(g_names.length-1)){//i가 2니까 g_names가 3이면 -1을해주면 2==2가 된다 , 를 없애주기 위해서 쓴다.(길이)중요 
					$("#approvalName").append("<a href='#' onClick='del(this)'>"+g_position[i]+"</a>");
				//$("#approvalName").append("<a href='#' onClick='del(this)'>"+g_names[i]+"("+g_position[i]+")"+"<input type='text'>"+g_no[i]+"</input>"+"</a>");
				//append()먼저 a href='#'-는 아무것도 안주기위해서 #해주고 클릭버튼을눌렀을때 del(this)파라미터를 넘겨준다 넘겨주면 this는 이름이랑 직급이뜬다.
				//g_names[i]는 이름이 뜨고 +(직급)이뜨고 +</a>감싸줘야지 한사람당씩 누를수있게 보여진다. 
				//만약 3-1이면 approval
				/* <input type='hidden' value='1'></input>
					"<input type='hidden' value="+"'"+g_no[i]+"'"+"></input>" */
				}else{
					$("#approvalName").append("<a href='#' onClick='del(this)'>"+g_position[i]+"</a>"+",");
				//$("#approvalName").append("<a href='#' onClick='del(this)'>"+g_names[i]+"("+g_position[i]+")"+"<input type='text'>"+g_no[i]+"</input>"+"</a>"+",");
				}
			}
		}
	}
		//del(el)파라미터 써주고 
	 function del(el){
		alert("클릭");//
		var imsi = $(el).text();//var imsi로 만들어줘서 $(el).text파라미터값만 받아올때 쓰는건가봄
		alert(imsi+"삭제");
		$("#approvalName").html("");//클릭을하면 초기화
		for(var i=0;i<g_position.length;i++) {
			var val = g_position[i];
			//alert("val"+val);
			if(imsi!=val){
				if(i==(g_names.length-1)){
					$("#approvalName").append("<a href='#' onClick='del(this)'>"+g_position[i]+"</a>");
				}else{
					$("#approvalName").append("<a href='#' onClick='del(this)'>"+g_position[i]+"</a>"+",");
				}
			}else{
				g_position.splice(i, 1)
				//alert(i+"삭제");
				i--;//배열에서 하나 요소를 삭제 했으므로 인덱스 값이 하나씩 줄어든다! 따라서 i를 하나 빼준다!
			}
		}
	}
	function test_modal(){
		g_names=[];//배열에 저장된 값들 초기화하기
		g_position =[];
		$("input[type=checkbox]").prop("checked", false);
	}
	function test(res) {
		var url;
		
		 imsi = res;
		if (res == "휴가양식") {
			url = "../sanghyun2/huga.jsp"
		} else if (res == "업무보고서") {
			url = "../sanghyun2/upmo.jsp"
		} else if (res == "파견양식") {
			url = "../sanghyun2/paguns.jsp"
		} else if (res == "사직양식") {
			url = "../sanghyun2/sagi.jsp"
		}else if (res == "업무지시서"){
			url = "../sanghyun2/upmog.jsp"
		} else if (res == "회의보고서"){
			url = "../sanghyun2/conference.jsp"
		}
		$.ajax({
			url : url,
			success : function(data) {
				$("#test").html(data);
				$("#ap_reporter").val("<%=s_ename%>");
                $("#ap_dname").val("<%=dept_name%>");
                $('#ap_reporter').attr('disabled', 'disabled');
                $('#ap_dname').attr('disabled', 'disabled');
                $('#ap_year').val(year1);
                $('#ap_month').val(month1);
                $('#ap_today').val(date1);
                $('#ap_namein').val("<%=s_ename%>");
                ////////////////////////////////////////////
                
                $('#ap_year').attr('disabled', 'disabled');
                $('#ap_month').attr('disabled', 'disabled');
                $('#ap_today').attr('disabled', 'disabled');
                $('#ap_namein').attr('disabled', 'disabled');
                $('#ap_appdate').val(dates3);
			}
		});
	}
 	function send() {
		$("#approveModal").modal({
			show:false
		}); 
		//부서이름
			var ap_dname= $("#ap_dname").val();
		if(ap_dname == null)ap_dname = '';
		//연락처
 		var ap_contact = $("#ap_contact").val();
		if(ap_contact ==null)ap_contact='';
		var ap_sign = "imaged.png";
		var fr_no = $("#i_ap_instructions").val();
 		var ap_reporter = $("#ap_reporter").val();
 		//파견일자,휴가일자,
		var ap_prosessingdate =$("#ap_prosessingdate").val();
		if(ap_prosessingdate == null) ap_prosessingdate ='2018-05-03';
		var ap_eprosessingdate =$("#ap_eprosessingdate").val();
		if(ap_eprosessingdate == null) ap_eprosessingdate ='2018-05-04';
		var ap_content =$("#ap_content").val();
 		var ap_appdate =$("#sdate").text();
 		//비고
		var ap_bego = $("#ap_bego").val();
		if(ap_bego ==null) ap_bego='';
		var ap_instructions = $("#ap_instructions").val();
		if(ap_instructions==null) ap_instructions = '';
		var closedate = $("#ap_closedate").val();
		var ap_retiredate = $("#ap_retiredate").val();
		if(ap_retiredate == null) ap_retiredate = '';
		//일짜른거 
	      var jbSplit =  closedate.split('일');
		var num = Number(jbSplit[0]);//0배열을 Number타입으로 바꿈
		//오늘날짜 @@@@@@@@@@@@@@@@@@@@@
		var dates1 = year+'-'+month+'-'+date;
		//오늘날짜 끝@@@@@@@@@@@@@@@@@@@@@
		//기한날짜@@@@@@@@@@@@@@@@@@
		to.setDate(to.getDate() +num);
		year = to.getFullYear().toString(); // 년도
		month = (to.getMonth() + 1).toString();  // 월
		date = to.getDate().toString();  // 날짜
		if(month.length==1){
			month = "0"+month;
		}
		if(date.length==1){
			date = "0"+date;
		}
//alert("222");
		var ap_closedate = year+'-'+month+'-'+date;
		var rev_empNo = $("#approvalName").text();//결재자이름
		//alert("rev_empNo:"+rev_empNo);
		var arrs = rev_empNo.split(',');
		//alert("arrs:"+arrs);
		var app_num = arrs.length;
		//alert("app_num:"+app_num);
		var ap_count = 1
		var ap_title = $("#ap_titles").val();//제목 
		var ap_empno = $("#emp_no").val();
		
	location.href="./workAddSendDoc?ap_instructions="+ap_instructions
										+"&fr_no=" + fr_no
										+"&ap_title="+ap_title
										+"&ap_reporter="+ap_reporter
								  		+"&ap_appdate="+ap_appdate
										+"&ap_closedate="+ap_closedate
								  		+"&ap_content="+ap_content
										+"&ap_dname="+"<%=dept_name%>"
								  		+"&ap_retiredate="+ap_retiredate
										+"&ap_contact="+ap_contact
										+"&ap_prosessingdate="+ap_prosessingdate+" ~ "+ap_eprosessingdate
								  		+"&ap_bego="+ap_bego
										+"&ap_sign="+ap_sign
										+"&ap_receiver="+rev_empNo
										+"&emp_no=<%= s_empno%>"
										+"&ap_count="+app_num;
 	}
 	
	function approval(){
		$("#approveModal").modal({
			show:true
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
					<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>결재 신청</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->
						<div class="row">
							<div class="col-12">
						
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th scope="row" 
												style="background: #EAEAEA; width:17%; text-align: center;">문서번호</th>
											<td style="width:17%;"><span>20112344</span></td>
											<th style="background: #EAEAEA; text-align: center;">직위
											</th>


											
											<td><span>사원</span></td>
											<th style="background:  #EAEAEA; width:17%; text-align: center;">보안</th>
											<td style="width:17%;">일반</td>
										</tr>
										<tr>
											<th scope="row"
												style="background: #EAEAEA; width:17%; text-align: center;">작성자</th>
											<td style="width:17%;"><span id="emp_name" name="emp_name"><%= s_ename %></span></td>
											<th style="background: #EAEAEA; text-align: center;">작성일자</th>
											<td>
											<span id="sdate" name="sdate"></span>
											</td>
											<th style="background: #EAEAEA; text-align: center;">보존기간</th>
											<td>1년</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<table class="table table-bordered">
									<tbody>
									<tr>
										<th scope="row"
											style=" width:17%; padding: 1px; padding-top: 14px; background: #EAEAEA; text-align: center;">제목</th>
										<td colspan="6">
										
										<input 
											style="width: 100%;  height: 100%; border: 0px;" type="text"
											class="ap_instructions-control" name="ap_titles" id="ap_titles"
											placeholder="제목을 입력하세요."></td>
										</tr>
										<!-- 결재자 -->
										<tr>
											<th scope="row"
												style="padding-right: 10px; padding-top: 14px; background: #EAEAEA; text-align: center;">
												결재자</th>
											<th style="width: 17%;">
												 <button style="margin-left: 40px;" class="btn btn-info "
													data-toggle="modal" data-target="#apporve" onClick="test_modal()">결재자</button>
											</th>
											<td colspan="4"style="width:;" id="rank1">
											<span name="approvalName" id="approvalName"></span>
											</td>
										</tr>
										<tr>
											<th scope="row"
												style="background: #EAEAEA; text-align: center;">결재양식</th>
											<td><select id="i_ap_instructions" name="ap_no" style="margin-left: 25px;">
													<option value="3">업무보고서</option>
													<option value="1">휴가양식</option>
													<option value="2">파견양식</option>
													<option value="5">사직양식</option>
													<option value="4">업무지시서</option>
													<option value="6">회의보고서</option>
											</select>
											</td>
											<th style="background: #EAEAEA; width: 17%;text-align: center;">기한</th>
											<td colspan="3 ">
											<select id="ap_closedate" name="ap_closedate">
													<option selected>1일</option>
													<option>3일</option>
													<option>5일</option>
													<option>7일</option>
													<option>15일</option>
													<option>30일</option>
											</select></td>

										</tr>
									</tbody>
								</table>
										
							</div>
						</div>
						<hr style="border: solid 1px black;">
						<!--***************************양식 뿌려주기  ******************************-->
						<div class="row">
							<div style="padding-top: 10px;" class="col-12">
							 <div  style=" border: 2px solid #d2d2d2; overflow:scroll;">
								<!-- <button style="float: right;"
									type="button" class="btn btn-info" onclick="window.print();">인쇄</button> -->
								<!-- *****밑에 승인취소버튼 -->
								<div id="test">
								</div>
								<div class="row" style="text-align: center;">
									
									<div class="col" style="text-align: center;">
										<button
											type="button" class="btn btn-info btn-lg"
											data-toggle="modal" data-target="#approveModal">신청</button>
										<button type="button" class="btn btn-info btn-lg"
											data-toggle="modal"  data-target="#cancle">취소</button>
										<br> <br>
									</div>
								</div>
							 </div>
							</div>
						</div>
					</div>
					<!--****************************신청 취소**************************************  -->
					<div class="col-1"></div>
				</div>
		</main>
		</div>
		
	
<!--*****************************************모달  ****************************************************-->
<!-- ***************************결재자 모달********************************* -->
		<div class="modal fade" id="approveModal" role="dialog">
			<div class="modal-dialog">
				Modal content
				<div class="modal-content">
					<div class="modal-header">
						결재 신청 
						<button type="button"data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<br> 결재신청 하시겠습니까? <br> <br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info"
							onClick="send()" >확인</button>
						<button type="button" class="btn btn-secondary " data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div> 
		<!-- ***************************승인 모달 끝********************************* -->
		<!-- ***********************************취소모달***************** ******************-->
		<div class="modal fade" id="cancle" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						결재 신청
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<br> 취소 하시겠습니까? <br> <br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info"
							data-dismiss="modal">확인</button>
						<button type="button" class="btn btn-secondary " data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- ***********************************취소모달 끝***************** ******************-->
		<!-- **********************승인 취소 모달 끝 ********************************** -->
			<!--결재자모달  -->
		<div class="modal fade" id="apporve" role="dialog">
			<div class="modal-dialog modal-lg" style="height: 400px;">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						받은 결재
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div id="frame_div" style="border: 1px solid black;">
							<div id="page_title"
								style=" margin: 20px 10px;">
								<h2>결재자</h2>
							</div>
							<div id="page_contents"
								style="  margin: 10px 10px;">
								<div class="toolbar">
									<button id="addrev" class="btn btn-success"
										data-dismiss="modal" onclick="appov()">확인</button>
									<button id="canclerev" class="btn btn-danger" data-dismiss="modal">취소</button>
								</div>
								<!-- ========================= 결재자 테이블 ========================== -->
								<table id="tb_approval" data-toolbar=".toolbar" data-toggle="table"
									data-show-columns="true" data-pagination="true"
									data-search="true" data-advanced-search="true"
									data-select-item-name="selectItemName"
									data-url="approval_send">
									<thead>
										<tr>	
											<th data-field="state" data-checkbox="true"></th>
											<th data-field="EMP_NO" data-sortable="true"
												data-align="center" data-width="10">사 원 번 호</th>
											<th data-field="username" data-sortable="true">사 원 이 름</th>
											<th data-field="DEPT_NAME" data-sortable="true">사 원 부 서</th>
											<th data-field="EMP_POSITION" data-align="center"
												data-sortable="true">직 급</th>
										</tr>
									</thead>
								</table>
								<!-- ======================== 결재자 테이블 끝 ====================== -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 컨텐츠 들어갈내용 끝   -->
	</div>
	<!--********************************************  양식****************************************ajax-->
	 <script type="text/javascript">
												//카테고리가 변할때마다 선택된 값을 test함수에 파라미터로 넘긴다.
			$("#i_ap_instructions").change(function() {
				//each문은 for문과 비슷하게 생각하면 된다.
				//선택된 텍스트 값을 p_zdo에 저장해 보자.
				 $("#i_ap_instructions option:selected").each(function() {
					var res = $(this).text();//var값을 집어넣으려면 val에다가 넣어야한다. 
					test(res);// ajax
				});
			});
		</script>
	<script type="text/javascript">
	var year1 = to.getFullYear().toString(); // 년도
	var month1 = (to.getMonth() + 1).toString();  // 월
	var date1 = to.getDate().toString();  // 날짜
	if(month1.length==1){//길이 11이면 2개  
		month1 = "0"+month1;
	}
	if(date1.length==1){
		date1 = "0"+date1;
	}///
		var temp='';
		var fr_no = <%= fr_no %>
			$(document).ready(function() {
			if(fr_no=="1"){
				
				$.ajax({
					url : "../sanghyun2/huga.jsp",
					success : function(data) {
						$("#test").html(data);
						$('#sdate').append(dates3);
						
						$("#ap_reporter").val("<%=s_ename%>");
                        $("#ap_dname").val("<%=dept_name%>");
                        $('#ap_reporter').attr('disabled', 'disabled');
                        $('#ap_dname').attr('disabled', 'disabled');
                        $('#ap_year').val(year1);
                        $('#ap_month').val(month1);
                        $('#ap_today').val(date1);
                        $('#ap_namein').val("<%=s_ename%>");
                        ////////////////////////////////////////////
                        
                        $('#ap_year').attr('disabled', 'disabled');
                        $('#ap_month').attr('disabled', 'disabled');
                        $('#ap_today').attr('disabled', 'disabled');
                        $('#ap_namein').attr('disabled', 'disabled');
                        $('#i_ap_instructions option:eq(1)').prop('selected', true); // option 3번째 선택
					}
				});
				
			}	
			if(fr_no=="2"){
				
				$.ajax({
					url : "../sanghyun2/paguns.jsp",
					success : function(data) {
						$("#test").html(data);
						$('#sdate').append(dates3);
						
						$("#ap_reporter").val("<%=s_ename%>");
                        $("#ap_dname").val("<%=dept_name%>");
                        $('#ap_reporter').attr('disabled', 'disabled');
                        $('#ap_dname').attr('disabled', 'disabled');
                        $('#ap_year').val(year1);
                        $('#ap_month').val(month1);
                        $('#ap_today').val(date1);
                        $('#ap_namein').val("<%=s_ename%>");
                        ////////////////////////////////////////////
                        
                        $('#ap_year').attr('disabled', 'disabled');
                        $('#ap_month').attr('disabled', 'disabled');
                        $('#ap_today').attr('disabled', 'disabled');
                        $('#ap_namein').attr('disabled', 'disabled');
                        $('#i_ap_instructions option:eq(2)').prop('selected', true); // option 3번째 선택
					}
				});
				
			}	
			if(fr_no=="3"){
				
				$.ajax({
					url : "../sanghyun2/upmo.jsp",
					success : function(data) {
						$("#test").html(data);
						$('#sdate').append(dates3);
						
						$("#ap_reporter").val("<%=s_ename%>");
                        $("#ap_dname").val("<%=dept_name%>");
                        $('#ap_appdate').val(dates3);
                        $('#ap_reporter').attr('disabled', 'disabled');
                        $('#ap_dname').attr('disabled', 'disabled');
                        $('#ap_appdate').attr('disabled', 'disabled');
                        $('#i_ap_instructions option:eq(0)').prop('selected', true); // option 3번째 선택
                        //options에서 보여지게 
					}
				});
				
			}	if(fr_no=="4"){
				
				$.ajax({
					url : "../sanghyun2/upmog.jsp",
					success : function(data) {
						$("#test").html(data);
						$('#sdate').append(dates3);
						
						$("#ap_reporter").val("<%=s_ename%>");
                        $("#ap_dname").val("<%=dept_name%>");
                        $('#ap_appdate').val(dates3);
                        $('#ap_reporter').attr('disabled', 'disabled');
                        $('#ap_dname').attr('disabled', 'disabled');
                        $('#ap_appdate').attr('disabled', 'disabled');
                        $('#i_ap_instructions option:eq(4)').prop('selected', true); // option 4번째 선택
                        //options에서 보여지게 
					}
				});
				
			}	
			if(fr_no=="5"){
				
				$.ajax({
					url : "../sanghyun2/sagi.jsp",
					success : function(data) {
						$("#test").html(data);
						$('#sdate').append(dates3);
						
						$("#ap_reporter").val("<%=s_ename%>");
                        $("#ap_dname").val("<%=dept_name%>");
                        $('#ap_reporter').attr('disabled', 'disabled');
                        $('#ap_dname').attr('disabled', 'disabled');
                        $('#ap_year').val(year1);
                        $('#ap_month').val(month1);
                        $('#ap_today').val(date1);
                        $('#ap_namein').val("<%=s_ename%>");
                        ////////////////////////////////////////////
                        
                        $('#ap_year').attr('disabled', 'disabled');
                        $('#ap_month').attr('disabled', 'disabled');
                        $('#ap_today').attr('disabled', 'disabled');
                        $('#ap_namein').attr('disabled', 'disabled');
                        $('#i_ap_instructions option:eq(3)').prop('selected', true); // option 3번째 선택
					}
				});
				
			}	
			if(fr_no=="6"){
					
					$.ajax({
						url : "../sanghyun2/conference.jsp",
						success : function(data) {
							$("#test").html(data);
							$('#sdate').append(dates3);
							
							$("#ap_reporter").val("<%=s_ename%>");
	                        $("#ap_dname").val("<%=dept_name%>");
	                        $('#ap_appdate').val(dates3);
	                        $('#ap_reporter').attr('disabled', 'disabled');
	                        $('#ap_dname').attr('disabled', 'disabled');
	                        $('#ap_appdate').attr('disabled', 'disabled');
	                        $('#i_ap_instructions option:eq(5)').prop('selected', true); // option 3번째 선택
	                        //options에서 보여지게 
						}
					});
					}
			
				
			    $('#tb_approval').on('check.bs.table', function (row, element) {
			    	g_names.push(element.EMP_NAME);
			    	g_position.push(element.EMP_POSITION);
			    	g_no.push(element.EMP_NO);
			        });
			      
			      $('#tb_approval').on('uncheck.bs.table', function (row, element) {
			    	  $("#state").val("");
			        });				
			});
		</script>
		
	<!-- 슬라이드바 사용할때 필요 -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script
		src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>
<!-- 탑메뉴 사용 -->
<script src="../common/js/topNav.js?"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js?"></script>

	<script src="../common/scripts.js"></script>
	<!-- 버거 메뉴 활성화 -->
</body>
</html>