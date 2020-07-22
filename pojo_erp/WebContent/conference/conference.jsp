<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--     <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>회의실</title>
	<link href="../common/main.css?ver4" rel="stylesheet" />
    <link href="../common/css/custom.css" rel="stylesheet" />
   <%@include file ="../common/fontAwesomeUI.jsp" %>
    <link rel=" shortcut icon" href="../mihyun_cal/image/favicon.ico">

    <link rel="stylesheet" href="../mihyun_cal/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="../mihyun_cal/vendor/css/bootstrap.min.css?aft2">
    <link rel="stylesheet" href='../mihyun_cal/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='../mihyun_cal/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="../mihyun_cal/css/main.css?after233">

</head>
<body>
<!-- <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color:#282828;">
            <a id="back" class="navbar-brand" href="javascript:history.back();" style="width:20%; padding-top:12px;" >
            <i class="fas fa-arrow-left" style="width:50px; height:50px; float:left;"></i></a>
            <a id="textTop" class="navbar-brand" href="./deptSchedule.jsp" style=" width:60%; font-size:25px; padding-top:20px; text-align: center;" >Conference Schedule</a>
		    <a id="home" class="navbar-brand" href="../home/main.jsp" style="width:20%; padding-top:12px;">
		    <i class="fas fa-home" style="width:50px; height:50px; float:right;"></i></a>
      </nav> -->
  <!--   <div class="container"> -->
  <nav id="topNav"></nav>
			<div id="layoutSidenav">
				<div id="layoutSidenav_nav"></div>
				<div id="layoutSidenav_content">
			<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
			<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>회의실 일정</h2></div>
			<div id="page_contents" style="max-width: 1730px; margin: 50px 50px;">
<!-- 일정추가전 생기는 카탈로그 창 -->
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">제1회의실</a></li>
                <li><a tabindex="-1" href="#">제2회의실</a></li>
                <li><a tabindex="-1" href="#">제3회의실</a></li>
                <li><a tabindex="-1" href="#">제4회의실</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>

<!--                         <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-username">등록자</label>
                                <input class="inputModal" type="text" name="edit-username" id="edit-username" required="required" />
                            </div>
                        </div> -->
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">회의실</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type" disabled>
                                    <option value="제1회의실">제1회의실</option>
                                    <option value="제2회의실">제2회의실</option>
                                    <option value="제3회의실">제3회의실</option>
                                    <option value="제4회의실">제4회의실</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="D25565" style="color:#D25565;">빨간색</option>
                                    <option value="ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="74c0fc" style="color:#74c0fc;">파란색</option>
                                </select>
                            </div>
                        </div> 
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50 " class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">회의실별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="제1회의실">제1회의실</option>
                            <option value="제2회의실">제2회의실</option>
                            <option value="제3회의실">제3회의실</option>
                            <option value="제4회의실">제4회의실</option>
                        </select>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
 <!--    </div> -->
    <!-- /.container -->
<!-- 슬라이드바 사용할때 필요 -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>
<script src="../common/js/topNav.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js"></script>

<script src="../common/scripts.js"></script>

    <script src="../mihyun_cal/vendor/js/jquery.min.js"></script>
    <script src="../mihyun_cal/vendor/js/bootstrap.min.js"></script>
    <script src="../mihyun_cal/vendor/js/moment.min.js"></script>
    <script src="../mihyun_cal/vendor/js/fullcalendar.min.js"></script>
    <script src="../mihyun_cal/vendor/js/ko.js"></script>
    <script src="../mihyun_cal/vendor/js/select2.min.js"></script>
    <script src="../mihyun_cal/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="../mihyun_cal/js/main.js"></script>
    <script src="../mihyun_cal/js/addEvent.js"></script>
    <script src="../mihyun_cal/js/editEvent.js"></script>
    <script src="../mihyun_cal/js/etcSetting.js"></script>
</body>
</html>