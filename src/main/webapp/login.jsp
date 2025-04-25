<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <style>
        body {
            background: url(images/background.jpg) no-repeat;
        }

        #login-box {
            padding: 35px;
            border-radius: 15px;
            background: #1c2224;
            color: #f7f7f7;
        }

    </style>
</head>
<body>
<%--================================================================--%>
	<div class="container" id="top">
		<div class="row" style="margin-top: 280px; ">
			<div class="col-md-3"></div>
			<div class="col-md-6" id="login-box">
				<form class="form-horizontal" role="form" action="/login" id="from1" method="post">
				  <div class="form-group">
				    <label for="userID" class="col-sm-2 control-label">学号/工号</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="userID" placeholder="请输入学号/工号" name="username">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password" class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="text-center">
				      <div class="label" style="font-size: 14px;color: red">
						  ${message}
				      </div>
				    </div>
				  </div>
				  <div class="form-group" style="margin-right: 15px;">
				    <div class="text-center">
<%--						<button class="btn btn-primary col-md-3 btn-danger" onclick="location.href='/forgetPassword'">找回密码</button>--%>
						<div class="col-md-4"></div>
				      <button type="submit" class="btn btn-primary col-md-4 btn-info">登录</button>
						<div class="col-md-4"></div>
				    </div>
				  </div>
				</form>
				<a href="/forgetPassword">忘记密码</a>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
<%--================================================================--%>




</body>

<script>
    // 给文本框获取焦点
    $("#userID").focus();

</script>

</html>
