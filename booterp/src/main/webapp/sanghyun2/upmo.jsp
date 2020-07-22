<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	    .auto-style2 {
	border-style: solid;
	border-width: 1px;
	font-size: 12px;
	background:#C0C0C0;
	font-weight:bold
	}
	.auto-style3 {
	border-style: solid;
	border-width: 1px;
	height: 29px; 
	font-size: 12px;
	text-align:center;
	vertical-align:middle;
	background:#C0C0C0;
	font-weight:bold}
        .wrap3{
    	text-align:center;
    	font-size:13px; 
    }
    .wrap2{
    	font-size:20px; 
    }
    .wrap3{
    	font-size:17px;
    	text-align:center; 
    }
      .wrap1{
    	text-align:right;
    	font-size:20px; 
    }
        .page {
    width: 200mm;
    min-height: 100mm;
    padding: 10mm;
    margin: 10mm auto;
    border: 1px #D3D3D3 solid;
    border-radius: 5px;
    background: white;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}


@page {
    size: A4;
    margin: 0;
}

@media print {
    html, body {
        margin:0 !important;
        padding:0 !important;
        height:100% !important;
        visibility: hidden;
    }

    .page .subpage .col-md-12,.col-lg-12{
        float:left;
        width:100%;
    }
    .page .subpage {
        padding: 1cm;
        height: 207mm;
        outline: 2cm #FFEAEA solid;
        position:absolute;
    }
    .page {
        visibility: visible;
    }
}
   </style> 
</head>
<body>
<div class="book">
        <div class="page">
            <div class="subpage" id="content">
          

<table style="margin-left: auto; margin-right: auto;" border="1" width="650px;"cellspacing=0>
<tr>
<td colspan="6">
	<table>
	 <tr>
	  <td style=" font-size: 135%; margin-left: auto; margin-right: auto;" cellspacing=0>
	  <div style= "float: right; padding-bottom:10px;"> 
    <table border="1"; cellpadding='10' ; cellspacing='0'; >
 	<tr>
 	<th class="auto-style2"  style="font-size: 70%;" width="60px" colspan="2" >
 	기안
 	</th> 
 	</tr>
 	<tr>
	<th style="font-size: 89%;" width="30px" height="50px"  colspan="2">
	<img src="imaged.png" width="110%" height="110%">
	</th>
	</tr>
 </table>	
 </div>
	   <br>
	   <br>
	   <h3 style="margin-left:255px;">업무 보고서</h3>
	   <br>
	 	
		<table border="1" cellspacing=0>
		 <tr>
		  <th style="width:200px; hieght:110px;">
			작성자
		  </th>
		  <td style="width:110px;">
			<input class="wrap3" id="ap_reporter"name="ap_reporter"style="border:0px;height:30px;"type="text">
		  </td>
		  <th style="width:200px; hieght:110px;">
		        작성일자
		  </th>
		  <td style="width:120px;">
			<input id="ap_appdate" name="ap_appdate" class="wrap3"style="border:0px;background-color:white;height:30px;" type="date">
		  </td>
		 </tr>
		</table>
		</td>
	  </tr>
	</table>
<br>
<div style="margin-top:40px;">
◆&nbsp;&nbsp;금일 업무 내용
</div>
	   <!--작성자,작성일자  -->
</td>
</tr>
<tr>
<th class="auto-style3" colspan="3">내용</th>
<th class="auto-style3" colspan="1">비고</th>
</tr>
<tr>
<th colspan="3" style="height:420px;"> 
<textarea class="wrap2" id="ap_content" name="ap_content" style="resize:none;border:0;width:99%;height:100%;" cols="30" rows="5" ></textarea>

</th>
<td colspan="1" style="height:350px;">
<textarea class="wrap2" name="ap_bego" id="ap_bego"style="resize:none;border:0;width:99%;height:100%;"cols="10"  ></textarea>

</td>
</tr>
<tr>
<th class="auto-style3" colspan="6">
특이사항/ 건의 사항
</th>
</tr>
<tr>
<th colspan="6" "class="auto-style3" > 
<textarea class="wrap2"  id="ap_instructions" name="ap_instructions" style="height:300px;resize:none;border:0;width:98%;"></textarea>
</th>
</tr>
</table>
</div>
</div>
</div>
</body>
</html>