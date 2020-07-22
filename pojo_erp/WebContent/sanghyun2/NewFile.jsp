<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var to = new Date(); 
alert(to);
to.setDate(to.getDate() +5);
var year = to.getFullYear().toString(); // 년도
var month = (to.getMonth() + 1).toString();  // 월
var date = to.getDate().toString();  // 날짜
if(date.length==1){
	date = "0"+date;
}
alert(year+""+month+""+date);

</script>
</body>
</html>