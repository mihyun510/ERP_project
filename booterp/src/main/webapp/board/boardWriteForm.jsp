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
<script type="text/javascript">
	
	function close_btn() {
		location.href="boardList"
	}

	function save_btn(){
		$("#f_send").submit();
		/*
	 	var bm_title = $("#bm_title").val();
		var bm_content = $("#bm_content").val();
		var bs_imsifile = $("#bs_file").val();
		alert("bm_title:"+bm_title+",  bm_content:"+ bm_content+", bs_imsifile:"+bs_imsifile);
		var index = bs_imsifile.lastIndexOf('\\');
		var bs_file = bs_imsifile.substring(index+1);
		alert("bs_file: "+bs_file);
		var bs_size = bbsCheck();
		alert("bs_size: "+bs_size);
		 $.ajax({
			type: "get"
			,url: "boardINS?bm_title="+bm_title+"&bm_content="+bm_content+"&bs_file="+bs_file+"&bs_size="+bs_size
			,success:function(data){
				alert(data);
				location.href='boardList'
			}
		});  */
	}
	
	function bbsCheck(){
		    if(document.getElementById("bs_file").value!=""){
		    var fileSize = document.getElementById("bs_file").files[0].size;
		    var maxSize = 2 * 1024 * 1024;//2MB
		 
		    if(fileSize > maxSize){
		       alert("첨부파일 사이즈는 2MB 이내로 등록 가능합니다. ");
		       return;
		    }
		}
		    return fileSize;
	}
</script>
</head>
<body class="sb-nav-fixed">
	<script type="text/javascript">
/* 		$(document).ready(function(){
			$("#bs_file").on("click", function(e){
				var formData = new FormData();
				var inputFile = $("input[name='bs_file']");
				var files = inputFile[0].files;
				console.log(files);
				for(var i=0;i<files.length;i++){
					formData.append('bs_file',files[i]);
				}
				$.ajax({
					url:'uploadAction'
				   ,processData: false	
				   ,contentType: false
				   ,data: formData
				   ,type: 'post'  
				   ,success:function(result){
						alert('uploaded ok!!!');
					}	   
				});
			});
		}); */
	</script>
   <nav id="topNav"></nav>
   <div id="layoutSidenav">
      <div id="layoutSidenav_nav"></div>
      <div id="layoutSidenav_content">
         <main id="input_div">
            <div id="frame_div" style="border: 1px solid black;">
               <div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
                  <h2>글쓰기</h2>
               </div>
               <div id="page_contents" style="max-width: 1200px; margin: 50px 150px;">
<!--------------------------------------------------- 컨텐츠 들어갈내용 시작---------------------------------------------------->
                <form id="f_send" method="post" action="boardINS" enctype="multipart/form-data">
                  <article>
                     <div class="container" role="main">
                        <h2></h2>        
                           <div class="mb-3">
                              <label for="title">제목</label> <input type="text"
                                 class="form-control" name="bm_title" id="bm_title"
                                 placeholder="제목을 입력해 주세요"/>
                           </div>
                           <div class="mb-3">
                              <label for="content">내용</label>
                              <textarea class="form-control" rows="15" name="bm_content"
                                 id="bm_content" placeholder="내용을 입력해 주세요"></textarea>
                           </div>
                           <div class="mb-3">
                              <label for="tag">첨부파일</label> 
                              <input id="bs_file" type="file" class="form-control" name="bs_file">
                           </div>
                        <div>
                           <button type="button" class="btn btn-sm btn-primary" 
                           id="btnSave" onclick="javascript:save_btn()">저장</button>
                           <button type="button" class="btn btn-sm btn-primary" 
                           id="btnList" onclick="javascript:close_btn()">닫기</button>
                        </div>
                     </div>
                  </article>
                  </form>
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