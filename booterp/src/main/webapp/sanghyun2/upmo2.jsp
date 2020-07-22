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
	  
	   <br>
	   <br>
	   <h3 style="margin-left:255px;">교육 보고서</h3>
	   <br>
	 	
		</td>
	  </tr>
	</table>
<br>
</td>
</tr>
<br>
<br>
<tr>
<td style="text-align:center;">성 &nbsp; 명</td>
<td><input class="wrap3" id="ap_reporter"name="ap_reporter"style="width:99%;border:0px;height:30px;"type="text"></td>
<td style="text-align:center;">직 &nbsp; 급</td>
<td><input class="wrap3" id="ap_reporter"name="ap_reporter"style="width:99%;border:0px;height:30px;"type="text"></td>
</tr>
<tr>
<td style="text-align:center;">교육명</td>
<td><input class="wrap3" id="ap_reporter"name="ap_reporter"style="width:99%;border:0px;height:30px;"type="text"></td>
<td style="text-align:center;">교육기간</td>
<td><input class="wrap3" id="ap_reporter"name="ap_reporter"style="width:99%;border:0px;height:30px;"type="text"></td>
</tr>
<tr>
<td style="text-align:center;">교육기관</td>
<td><input class="wrap3" id="ap_reporter"name="ap_reporter"style="width:99%;border:0px;height:30px;"type="text"></td>
<td style="text-align:center;">교육시간</td>
<td><input class="wrap3" id="ap_reporter"name="ap_reporter"style="width:99%;border:0px;height:30px;"type="text"></td>
</tr>
<tr>
<td colspan="4" style="padding-top:15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교육 소감요약(상세내용 첨부)</td>
</tr>
<tr>
<td colspan="4">
<textarea class="wrap2" id="ap_content" name="ap_content" style="resize:none;border:0;width:99%;height:100%;" cols="30" rows="15" ></textarea>
</td>
</tr>
<tr>
<td colspan="4" style="padding-top:15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교육내용요약(교육내용,감상 등 상세내용 첨부)</td>
</tr>
<tr>
<td colspan="4">
<textarea class="wrap2" id="ap_content" name="ap_content" style="resize:none;border:0;width:99%;height:100%;" cols="30" rows="15" ></textarea>
</td>
</tr>
</table>
</div>
</div>
</div>
</body>
</html>