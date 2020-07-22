<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	$("#apply")
	function send(){
		$("#loginForm").attr('method','post');
		$("#loginForm").attr('action','main/login.erp');
		$("#loginForm").submit();
	}
</script> -->

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
    	text-align:center;
    	font-size:20px; 
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
<script>
	window.onload = function (){
		window.print();
	}
</script>  
        <div class="page"  >
            <div id="content">
<table style="margin-left: auto; margin-right: auto;" border="2" width="650" 
		 cellspacing=0>
	<tr id="tableTr">
	<td colspan="6" style="border-right:0;border-left:0;border-top:0;border-bottom:0;">
	<div style= "float: right; padding-bottom:10px;"> 
    <table border="1"; cellpadding='10' ; cellspacing='0'; >
 	<tr>
 	<th class="auto-style2"  style="font-size: 70%;" width="60px" colspan="2" >
 	기안
 	</th> 
 	</tr>
 	<tr>
	<th style="font-size: 89%;" width="30px" height="50px"  colspan="2">
	<img id = "ap_sign" src="imaged.png" width="110%" height="110%">
	</th>
	</tr>
 </table>	
 </div>
	<table style="line-height:1; 
		 margin-left: auto; margin-right: auto;" cellspacing=0>
      <tr>
              	<td><div style="padding-top:50px; padding-left:80px;"><h3>휴 가 신 청 서</h3></div></td>
      </tr>
</table>
</td>
</tr>
	<tr>
    <th width="123"  class="auto-style3">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명 </th>
    <td width="201">
  <!--   <span id="ap_reporter"></span> -->
     <input type="text"  id="ap_reporter"name="ap_reporter"class="wrap2"style=" height:50px;line-height: 45px; width:98%; border: 0;">
    </td>
    <th width="111" class="auto-style3">부 서 명</th>
    <td width="209">
    	<input class="wrap2" id="ap_dname" type="text" style=" height:50px; line-height: 75px; width:98%; border: 0;">
    </td>
    </tr>
  	<tr>
    <th width="123" class="auto-style3">
   		 휴 가  기 간
   	 </th>
    <td colspan="3" height="100px;">
    	<input class="wrap2" id="ap_prosessingdate" type="text" style=" height:50px;line-height: 75px; width:98%; border: 0;">
    </td>
  	</tr>
  	<tr>
    <th width="123" class="auto-style3">휴 가 사 유 </th>
    <td colspan="3">
    <textarea  class="wrap2" name="ap_content" id="ap_content" style="border:0;  line-height:2; width:99%;" cols="60" rows="4" ></textarea>
    </td>
    </tr>
    <tr>
    <th width="123" class="auto-style3">연 락 처</th>
    <td colspan="3" height="60"><input id="ap_contact" name="ap_contact" class="wrap2" type="text"   style=" line-height: 75px; width:98%; border: 0;"></td>
  </tr>
<tr>
<td style="border-right:0;border-left:0;border-top:0;border-bottom:0;"  colspan="6">
<br>
<br>
*입중서류(해당하는 경우만)
<br>
<br>
<br>
</td>
</tr>
<tr>
<td style="border-right:0;border-left:0;border-top:0;border-bottom:0;"colspan="6">
<table   style=" font-size: 135%; margin-left: auto; margin-right: auto;" cellspacing=0>
      <tr>
        <td colspan="6" height="40" class="form16b1">위와 같이 허락해주시기 바랍니다.</td>
      </tr>
      <tr>
      
</table>
<br>
<br>
<br>
<div class="wrap2" style="text-align:center;">
<input type="text" id="ap_year" name="year" style="font-size:20px; line-height: 35px; width:48px; border: 0;"align="center">년
<input type="text" id="ap_month" name="month" style="font-size:20px; line-height: 30px; width:30px; border: 0;"align="center">월
<input type="text" id="ap_today" name="today" style="font-size:20px; line-height: 30px; width:30px; border: 0;"align="center">일
<div>
<br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신  청  인:
<input type="text" id="ap_namein" name="namein" style="font-size:20px;  width:80px; border: 0;"align="center">(인)</p>
<br>
<br>
<br>
<br>
</div>
</div>
</td>
</tr>
</table>
</div>
</div>
</div>
</html> 