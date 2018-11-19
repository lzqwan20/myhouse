 <!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>		 		 
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"   >
		<style>
			input {
				width: 300px;
				height: 40px;
				margin-top: 10px;
			}
			form{
				font-size: larger;
				text-align: center;
			}
			
			body {
				margin: 0;
				padding: 0;
				width: 100%;
				height: 100%;
			}
			/* Make the image fully responsive */
			
			.carousel-inner img {
				width: 100%;
				height: 600px;
			}
			
			#up {
				width: 100%;
				height: 60px;
				background-color: lightsteelblue;
				margin: 0;
				padding: 0;
			}
			
			button {
				float: right;
				margin: 0;
				padding: 0;
				margin-top: 10px;
				margin-right: 20px;
				width: 100px;
			}
		</style>
</head>

<body>
		<script>
			$(document).ready(function() {
				$("#button").button();
				$("#button").bind("click", function() {
					//把表单的数据序列化						 
					console.log($("form").serialize());
					 $.ajax({
					 	type:"post",
					 	url:"${pageContext.request.contextPath}/Test",
					 	async:true,
					 	data:"name="+$("#name").val()+"&password="+$("#password").val(),
					 	success:function(xml){
					 		alert(xml+"登陆成功");
					 	    window.location="http://www.baidu.com";
					 	},
					 	error:function(){
					 		alert("error");
					 	}
					 });
				});
			});
		</script>

		<!--1.上面的导航栏-->
		<div id="up">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">登录 </button>
		</div>
		<!--2.轮播图的容器-->
		<div id="demo" class="carousel slide" data-ride="carousel">
			<!-- 指示符 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<!-- 轮播图片 -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="img/background.png">
				</div>
				<div class="carousel-item">
					<img src="img/u=3619084367,816845467&fm=200&gp=0.jpg">
				</div>
				<div class="carousel-item">
					<img src="img/u=702322186,2853262132&fm=26&gp=0.jpg">
				</div>
			</div>
			<!-- 左右切换按钮 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a>
			<a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
		<!--3.模态框 -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 模态框头部 -->
					<div class="modal-header" >
						<h2>医院信息管理系统</h2>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- 模态框主体 -->
					<div class="modal-body">					
						<form>
							账号:<input type="number" id="name"><br>
							密码:<input type="password" id="password"><br>
						</form>
					</div>
		            <!--模态框尾部-->
					<div class="modal-footer">
						<a id="button">登录</a>
					</div>							
				</div>
			</div>
		</div>
</body>
</html>