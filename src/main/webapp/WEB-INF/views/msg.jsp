<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>★</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script>
	window.onload  = function() {
			
		swal({text:'${msg}', icon:'${icon}'}).then(function(){
			if(${location eq ""}){
				history.go(-1)
				
			}else{
				
				window.location.href="${location}";
			}
		}); 
	}
</script>
</head>
<body>

</body>
</html>