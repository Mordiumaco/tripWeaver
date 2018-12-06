<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"> 
	$(function(){
		goParent(opener);
	})
	
	function goParent(opener){
		try{
			opener.parent.goMain();
			self.close();
		}catch(e){
			alert('에러');
		}
	}
</script>
<title>callback</title>
</head>
<body>

</body>
</html>