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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
       rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" ></script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<style type="text/css">
</style>
<title>2RP PROGRAM</title>
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
                                             <center>        
                                <h2>[ 공지 사항 ]</h2>
                             </center>
                        <div id="page_contents"style="  margin: 10px 10px;">
                        <!-- ========================= 결재자 테이블 ========================== -->
                        <table id="tb_approval" data-toolbar=".toolbar" data-toggle="table"
                           data-show-columns="true" data-pagination="true"
                           data-search="true" data-advanced-search="true"
                           data-select-item-name="selectItemName"
                           data-url="./member2.json">
                           <thead>
                              <tr>   
                                 <th data-field="state" data-checkbox="true"></th>
                                 <th data-field="app_no" data-sortable="true"
                                    data-align="app_name">사 원 번 호</th>
                                 <th data-field="app_write" data-sortable="true">사 원 이 름</th>
                                 <th data-field="app_print" data-sortable="true">사 원 부 서</th>
                                 <th data-field="app_imsi" data-align="center"
                                    data-sortable="true">직 급</th>
                              </tr>
                           </thead>
                        </table>
                        <!-- ======================== 결재자 테이블 끝 ====================== -->
                  </div>
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