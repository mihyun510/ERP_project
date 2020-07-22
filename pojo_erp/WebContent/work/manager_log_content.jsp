<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table id="table" 
	   data-toggle="table" 
	   class="table table-hover"
	   data-search="true" 
	   data-toggle="table" 
	   data-pagination="true"
	   data-url="../work/gg.erp?cud=log">
	<thead class="thead-light">
		<tr>
			<th data-field="LOG_NO">NO</th>
			<th data-field="EMP_NO">사원번호</th>
			<th data-field="LOG_IP">접속IP</th>
			<th data-field="LOG_TYPE">활동내역</th>
			<th data-field="LOG_TIME">접속시간</th>
		</tr>
	</thead>
</table>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

	<!-- 수정버튼 클릭햇을때 테이블 정보불러오기
	<script>
      var $table = $("#table");

      function operateFormatter(value, row) {
        return [
          '<a class="button" href="javascript:void(0)" title="button">',
          '<button type="button" class="btn btn-info" style="border: 1px solid white; border-radius: 10px; font-size:12px" align="center">수정</button>',
          "</a>  ",
        ].join("");
      }

      window.operateEvents = {
        "click .button": function (e, value, row, index) {
          alert("You click like action, row: " + JSON.stringify(row));
        },
      };
    </script>
     -->

	<!-- 탑메뉴 사용 -->
	<!-- <script src="../common/js/topNav.js"></script> -->
	<!-- 사이드 메뉴 사용 -->
	<!-- <script src="../common/js/sideNav.js?ver=2"></script> -->

	<!-- <script src="../common/scripts.js"></script> -->
	<!-- 버거 메뉴 활성화 -->
