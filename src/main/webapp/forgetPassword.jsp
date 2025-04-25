<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <style type="text/css">
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
    <div class="row" style="margin-top: 150px; ">
        <div class="col-md-3"></div>
        <div class="col-md-6" id="login-box">
            <form class="form-horizontal" role="form" id="from1" method="post">
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">绑定邮箱</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="email" placeholder="请输入绑定邮箱" name="email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="code" class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="code" placeholder="请输验证码" name="code">
                    </div>
                    <div class="">
                        <button class="btn btn-primary col-md-3 btn-danger" id="sendCode">发送邮件</button>
                    </div>
                </div>
                <div class="form-group">
                    <div class="text-center">
                        <div class="label" style="font-size: 14px">
                            <p id="result"></p>
                        </div>
                    </div>
                </div>
                <%--                <div class="form-group" style="margin-right: 15px;">--%>
                <%--                    <div class="text-center">--%>
                <%--                        <div class="col-md-4"></div>--%>
                <%--                        <button class="btn btn-primary col-md-4 btn-info" id="verify">提交</button>--%>
                <%--                        <div class="col-md-4"></div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </form>
            <div class="text-center">
                <div class="col-md-4"></div>
                <button class="btn btn-primary col-md-4 btn-info" id="verify">提交</button>
                <div class="col-md-4"></div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
<%--================================================================--%>


</body>

<script>

    $("#userID").focus();

    window.onload = () => {
        var sendCodeBtn = document.getElementById("sendCode"); //获取验证码按钮
        var verifyBtn = document.getElementById("verify"); //获取验证码按钮
        // 注册单击事件
        sendCodeBtn.addEventListener('click', function () {
            let email = document.getElementById("email").value
            $.ajax({
                url: "/forgetPassword/sendCode",//键  值异步请求的URL路径
                type: "GET",			//请求的方式 默认：get
                data: "email=" + email,//要发送的数据
                dataType: "json",		//指定 返回的数据类型 text xml/json
                success: function (data) {
                    console.log(data);
                    if (data.code === 200) {
                        document.getElementById("result").style = "font-size: 14px;color: green";
                        document.getElementById("result").innerText = data.data;
                    } else {
                        document.getElementById("result").style = "font-size: 14px;color: red";
                        document.getElementById("result").innerText = data.data;
                    }
                }
            });
            var time = 59;
            sendCodeBtn.disabled = true;
            var timer = setInterval(function () {
                if (time === 0) {
                    clearInterval(timer);
                    sendCodeBtn.disabled = false;
                    sendCodeBtn.innerHTML = '发送验证码';
                } else {
                    sendCodeBtn.innerHTML = time + `秒后重新获取`;
                    time--;
                }
            }, 1000);
        });

        verifyBtn.addEventListener('click', function () {
            let email = document.getElementById("email").value
            let code = document.getElementById("code").value

            $.ajax({
                url: "/forgetPassword/emailReset",
                data: 'email='+email+'&code='+code,
                dataType: "json",
                type: "post",
                success: function (data) {
                    console.log(data);
                    if (data.code === 200) {
                        document.getElementById("result").style = "font-size: 14px;color: green";
                        document.getElementById("result").innerText = data.data;
                        var time = 5;
                        verifyBtn.disabled = true;
                        var timer = setInterval(function () {
                            if (time === 0) {
                                clearInterval(timer);
                                location.href = "/login";
                            } else {
                                verifyBtn.innerHTML = `跳转至登录(`+time+')';
                                time--;
                            }
                        }, 1000);
                    } else {
                        document.getElementById("result").style = "font-size: 14px;color: red";
                        document.getElementById("result").innerText = data.data;
                        var time = 5;
                        verifyBtn.disabled = true;
                        var timer = setInterval(function () {
                            if (time === 0) {
                                clearInterval(timer);
                                verifyBtn.disabled = false;
                                verifyBtn.innerHTML = '提交';
                            } else {
                                verifyBtn.innerHTML = time + `秒后重试`;
                                time--;
                            }
                        }, 1000);
                    }
                }
            });
        });
    }

</script>

</html>
