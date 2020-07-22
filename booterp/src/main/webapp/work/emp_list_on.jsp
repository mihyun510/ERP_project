<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table id="table" 
	   data-toggle="table" 
	   class="table table-hover"
	   data-search="true" 
	   data-pagination="true"
	   data-url="nowempList">
	<thead class="thead-light">
		<tr>
			<th data-field="EMP_NO" style="width:12.5%">사원번호</th>
			<th data-field="username" style="width:12.5%">사원이름</th>
			<th data-field="DEPT_NAME" style="width:12.5%">부서</th>
			<th data-field="EMP_POSITION" style="width:12.5%">직급</th>
			<th data-field="EMP_EMAIL" style="width:12.5%">이메일</th>
			<th data-field="EMP_PHONE" style="width:12.5%">핸드폰</th>
			<th data-field="EMP_STATE" style="width:12.5%">근무상태</th>
			<th data-field="OPERATE" data-formatter="operateFormatter" data-events="operateEvents" style="width:12.5%" data-align="center" >정보수정</th>
		</tr>
	</thead>
</table>
<!-- <script type="text/javascript">
	$(document).ready(function(){
	    $('#table').bootstrapTable({
	         onClickRow: function(row,element,field){
	            emp_no = row.EMP_NO;
	            alert("사원번호 : "+emp_no);
	         }
	    });
    });
</script>  -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>







	<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script> -->

	<!-- 수정버튼 클릭햇을때 테이블 정보불러오기 -->
 	<!-- 
 	<script>
 	var $table = $("#table");

		function operateFormatter(value, row) {
			return [
			  '<a class="button" href="javascript:void(0)" title="button">',
			  '<button type="button" class="btn btn-info" style="border: 1px solid white; border-radius: 10px; font-size:12px" align="center" onclick="workSelectEmp()" >수정</button>',
			  "</a>  ",
			].join("");
		}
	window.operateEvents = {
		"click .button": function (e, value, row, index) {
			//alert("You click like action, row: " + JSON.stringify(row));
			location.href = "./emp_edit_all.jsp?id=" + row.emp_no;  //파라미터로 user id 넘겨주는것
		}, 
	};
    </script>
	 -->

	<!-- 탑메뉴 사용 -->
	<!-- <script src="../common/js/topNav.js"></script> -->
	<!-- 사이드 메뉴 사용 -->
	<!-- <script src="../common//js/sideNav.js"></script> -->

	<script src="../common/scripts.js"></script>
	<!-- 버거 메뉴 활성화 -->

	