<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<script>
	window.onload  = function() {
		swal({text:"인증번호가 일치하지않습니다.", icon:"error"}).then(function(){
			window.location.href="/forgetPasswordTry";
		}); 
	}
</script>
</head>
<body>

</body>
</html>