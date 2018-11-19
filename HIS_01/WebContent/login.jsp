<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>

<script type="text/javascript">
	$(function(){
		
		//为输入框绑定事件
		$("#username").blur(function(){
			//1、失去焦点获得输入框的内容
			var usernameInput = $(this).val();
			
			//2、去服务端校验该用户名是否存在---ajax
			$.post(
				"${pageContext.request.contextPath}/checkUsername",
				{"username":usernameInput},
				function(data){
					var isExist = data.isExist;
					//3、根据返回的isExist动态的显示信息
					var usernameInfo = "";
					if(isExist){
						//该用户存在
						usernameInfo = "该用户名已经存在";
						$("#usernameInfo").css("color","red");
					}else{
						usernameInfo = "该用户可以使用"
						$("#usernameInfo").css("color","green");
					}
					$("#usernameInfo").html(usernameInfo);
					
				},
				"json"
			);
			
			
		});

		
	});
</script>

</head>
<body>	
	<form action="${pageContext.request.contextPath}/login" method="post">
		用户名：<input type="text" id="username" name="username"><br/>
		<div>
			<span id="usernameInfo"></span>
		</div>
		密码：<input type="password" name="userpassword"><br/>
		<div>
			<span style="color: red">${loginInfo }</span>
		</div>
		<input type="submit" value="登录"><br/>
		
	</form>
</body>
</html>