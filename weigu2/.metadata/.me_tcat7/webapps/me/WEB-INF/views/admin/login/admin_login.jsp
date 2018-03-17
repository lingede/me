<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>后台管理系统 | 电子科技大学</title>
	<meta name="author" content="电子科技大学" />  
	<meta name="keywords" content="电子科技大学">
	<meta name="description" content="电子科技大学。">
	<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${ctxsta}/admin/login/css/style.css" />
	<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body>
    <dl class="admin_login">
        <dt>
            <strong>电子科技大学后台管理系统</strong>
            <em>Management System</em>
    	</dt>
        <dd class="user_icon">
        	<input type="text" name="systemUser.loginName" placeholder="账号" class="login_txtbx"/>
        </dd>
        <dd class="pwd_icon">
        	<input type="password" name="systemUser.loginPassword" placeholder="密码" class="login_txtbx" data-exponent="${publicKeyMap.exponent}" data-modulus="${publicKeyMap.modulus}" />
        </dd>
        <dd style="height: 30px">
        	<div style="margin-top: 6px">
        	<label><input name="systemUser.type" type="radio" value="1" checked="checked"/>管理员登录 </label>
        	<label><input name="systemUser.type" type="radio" value="2" />团队用户登录 </label>
        	<label><a style="margin-left: 8px;color:red;" href="${ctx}/teacher/main">教师用户点此</a></label>
        	</div>  
        </dd>
        <dd class="val_icon">
            <div class="checkcode">
                <input type="text" id="J_codetext" name="registerCode" placeholder="验证码" maxlength="4" class="login_txtbx">
                <img class="J_codeimg" src="${ctx}/captchaMain-image.jpg" id="kaptchaImage" />
            </div>
        	<input type="button" value="点击,换一张" class="ver_btn" onclick="$(this).prev().find('img').click()">
        </dd>
        <dd>
        	<input type="button" value="立即登陆" class="submit_btn"/>
        </dd>
        <dd>
            <p>© 2016 电子科技大学 版权所有</p>
            <p><span id="showsectime"></span></p>
        </dd>
    </dl>

    <script src="${ctxsta}/common/jquery/jquery-3.1.1.min.js"></script>
    <script src="${ctxsta}/common/layer/layer.js"></script>
	<script src="${ctxsta}/common/security/security.js"></script>
	<script src="${ctxsta}/admin/login/js/Particleground.js"></script>
	<script src="${ctxsta}/admin/login/js/login.js"></script>
</body>
</html>