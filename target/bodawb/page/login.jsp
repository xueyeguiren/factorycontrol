<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>欢迎登陆</title>
    <link rel="stylesheet"
          href="../style/plugins/layui/css/layui.css"
          media="all" />
    <link rel="stylesheet"
          href="../style//css/login.css" />
    <link rel="stylesheet"
          href="../style/css/global.css"
          media="all">
    <style type="text/css">
        body {
            margin: 0
        }

        video {
            position: fixed;
            right: 0;
            bottom: 0;
            min-height: 100%;
            min-width: 100%;
            z-index: -9999;
        }

        #button {
            position: absolute;
            left: 40%;
            top: 35%;
        }
    </style>
</head>
<body class="beg-login-bg" onload="closeLogin()">

<video autoplay muted loop>
    <source src="../video/1.mp4" />
</video>


<div id="button">
    <p style="font-family: 华文行楷; font-size: 40px; color: white;"
       align="center">	No impossible</p><br/>

    <p style="font-family:华文行楷; font-size: 40px; color: white;"
       align="center">改变,从现在开始!</p>
    <br/>
    <br/>
    <button class="layui-btn layui-btn-normal" onclick="openLogin()">&nbsp;
        &nbsp; 立即登陆 &nbsp; &nbsp;</button>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <button class="layui-btn layui-btn-primary" id="wj">&nbsp;
        忘记密码？&nbsp;</button>

</div>



<div id="win" class="beg-login-box">
    <header>
        <h1>页面登陆</h1>
    </header>

    <div class="beg-login-main">

        <form action="/user/login" class="layui-form" method="post">
            <input name="__RequestVerificationToken" type="hidden"
                   value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81" />
            <div class="layui-form-item">
                <label class="beg-login-icon"> <i class="layui-icon">&#xe612;</i>
                </label> <input type="text" name="username" lay-verify="username"
                                autocomplete="off" placeholder="这里输入登录名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon"> <i class="layui-icon">&#xe642;</i>
                </label> <input type="password" name="password" lay-verify="password"
                                autocomplete="off" placeholder="这里输入密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="beg-pull-left">
                    <button class="layui-btn layui-btn-primary" lay-submit
                            lay-filter="login">
                        <i class="layui-icon">&#xe650;</i> 登录
                    </button>
                </div>
                <div class="beg-pull-right">
                    <button class="layui-btn layui-btn-primary" type="button"
                            onclick="closeLogin()">
                        <i class="layui-icon">&#x1006;</i> 取消
                    </button>
                </div>
                <div class="beg-clear"></div>
            </div>
        </form>
    </div>
    <footer>
        <p>＠BodawbAutoTeam</p>
    </footer>
</div>

<script type="text/javascript">
    function openLogin() {
        document.getElementById("win").style.display = "";
        document.getElementById("button").style.display = "none";
    }
    function closeLogin() {
        document.getElementById("win").style.display = "none";
        document.getElementById("button").style.display = "";
    }
</script>

</body>
</html>