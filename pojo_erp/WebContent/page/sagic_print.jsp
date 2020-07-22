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

	<div class="page">
            <div id="content">
<form id="forms_name">
<input type="hidden" name="cud" value="workAddSendDoc">
<table style="margin-left: auto; margin-right: auto;" border="2" width="650" 
		 cellspacing=0>
	<tr id="tableTr">
	<td colspan="6" style="border-right:0;border-left:0;border-top:0;border-bottom:0;">
		<br>
	<br>
	<table style="line-height:1; 
		 margin-left: auto; margin-right: auto;" cellspacing=0>
      <tr>
              <td><h4>사 직 서</h4></td>
        <td id="tms_auto_sign"  ></td>
      </tr>
</table>
<div style= "float: right; padding-bottom:10px;"> 
    <table border="1"; cellpadding='10' ; cellspacing='0'; >
 </table>	
 </div>
	</td>
	</tr>

 
	<tr>
    <th width="123"  class="auto-style3">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명 </th>
    <td width="201">
    <input type="text" name="ap_reporter" id="ap_reporter" class="wrap2"style=" height:50px;line-height: 45px; width:98%; border: 0;"disabled >
    </td>
    <th width="111" class="auto-style3">부 서 명</th>
    <td width="209">
    	<input class="wrap2" type="text" name="ap_dname" id="ap_dname"  style=" height:50px;line-height: 75px; width:98%; border: 0;"disabled >
    </td>
    </tr>
  	<tr>
    <th width="123" class="auto-style3">
   		 퇴 사 일 자 
   	 </th>
    <td colspan="3" height="100px;">
    	<input class="wrap2" type="text" id="ap_retiredate" name="ap_reitredate" style=" height:100%;line-height: 75px; width:99%; border: 0;"disabled >
    </td>
  	</tr>
  	<tr>
    <th width="123" class="auto-style3">사 직  내 용 </th>
    <td colspan="3">
    <textarea class="wrap2"  name="ap_content" id="ap_content" style=" border:0;line-height:2; width:99%;" cols="60" rows="4" disabled ></textarea>
    </td>
    </tr>
    <tr>
    <th width="123" class="auto-style3">연 락 처</th>
    <td colspan="3" height="60"><input name="ap_contact" id="ap_contact"class="wrap2" type="text"   style=" line-height: 75px; width:98%; border: 0;"disabled ></td>
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
<input type="text" id="ap_year" name="year" style="font-size:20px; line-height: 35px; width:48px; border: 0;"align="center"disabled >년
<input type="text" id="ap_month" name="month" style="font-size:20px; line-height: 30px; width:30px; border: 0;"align="center"disabled >월
<input type="text" id="ap_today" name="today" style="font-size:20px; line-height: 30px; width:30px; border: 0;"align="center"disabled >일
<div>
<br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신  청  인:
<input type="text" id="ap_namein" name="namein" style="font-size:20px;  width:80px; border: 0;"align="center"disabled >(인)</p>
<br>
<br>
<br>
<br>
</div>
</div>
</td>
</tr>
</table>
</form>
</div>
</div>
</div>
</html> 