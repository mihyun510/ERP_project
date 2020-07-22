<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css" rel="stylesheet">
<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>

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
         

	  

