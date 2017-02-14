<%@ page contentType="text/html; charset=gb2312" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>电子商城</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script language="javascript">
$.extend($.fn.validatebox.defaults.rules, {
	checkName:{
		validator:function(value)
		{
			var reg = /^[a-zA-Z]\w{4,15}$/;
			return reg.test(value);
		},
		message:'由英文字母、数字组成，开头不能为数字,共5-16位'
	},
	checkPassword:{
		validator:function(value)
		{
			var reg = /^[a-zA-Z]\w{4,15}$/;
			return reg.test(value);
		},
		message:'由英文字母、数字组成，开头不能为数字,共5-16位'
	},
	checkEmail:{
		validator:function(value)
		{
			var reg = /^((\w)|[-]|[.])+@(((\w)|[-])+[.])+[a-z]{2,4}$/;
			return reg.test(value);
		},
		message:'请填写正确邮箱地址'
	}
}
)
</script>
</head>

<html:html>
<link href="css/css.css" rel="stylesheet" type="text/css"> 
<script language="javascript">

function checkEmpty(memberForm){
for(i=0;i<memberForm.length;i++){
if(memberForm.elements[i].value==""){
alert("表单信息不能为空");
return false;
}
}
if(document.memberForm.password.value!=document.memberForm.passwordOne.value){
window.alert("您两次输入的密码不一致，请重新输入");
return false;
}
if(isNaN(document.memberForm.age.value)){
window.alert("年龄只能为数字");
return false;
}
}


/*
//检查用户名是否合法,只能由英文字母、数字和下划线组成，且开头不能为数字
	function checkName(){
		var name = document.getElementById("name");
		var checkName = document.getElementById("checkName");
		var patrn=/^[a-zA-Z_]{1}\w{5,16}$/; 
		if (!patrn.exec(name.value)){
			 checkName.style.color="red";
			 checkName.innerHTML="用户名输入有误!";
			 return false;
		}else{	
			 checkName.style.color="green";
			 checkName.innerHTML="√ 输入正确";
			 return true;
		}
	}
	
	function checkPassword(){
		var password = document.getElementById("password");
		var checkPassword = document.getElementById("checkPassword");
		var patrn=/^[a-zA-Z_]{1}\w{5,16}$/; 
		if (!patrn.exec(password.value)){
			 checkPassword.style.color="red";
			 checkPassword.innerHTML="密码输入有误!";
			 return false;
		}else{	
			 checkPassword.style.color="green";
			 checkPassword.innerHTML="√ 输入正确";
			 return true;
		}
	}
	
		function checkemail(){
		var email = document.getElementById("email");
		var checkemail = document.getElementById("checkemail");
		var patrn=/((\w)|[-]|[.])+@(((\w)|[-])+[.])+[a-z]{2,4}$/;
		if (!patrn.exec(email.value)){
			checkemail.style.color="red";
			checkemail.innerHTML="邮箱格式有误!";
			 return false;
		}else{	
			 checkemail.style.color="green";
			 checkemail.innerHTML="√ 输入正确";
			 return true;
		}
	}
*/
</script>
<body>
<jsp:include page="fg-top.jsp" flush="true"/>
<table width="766" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <tr>
    <td bgcolor="#F5F5F5" align="center">
<img src="image/fg1.jpg" width="752" height="39">


<html:form action="memberAction.do?action=0"  onsubmit="return checkEmpty(memberForm)">

<table width="270"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="107" height="35">
          <div align="right">会员名称：</div></td>
        <td width="163">
            <div align="left">
            <input name="name" required="true" validtype="checkName" class="easyui-validatebox">
             </div></td>
     </tr> 
      <tr>
        <td height="35">          
          <div align="right">会员密码：</div></td>
        <td>
            <div align="left">
              <input name="password" required="true" validtype="checkPassword" class="easyui-validatebox">
          </div></td></tr>
          
        
          
      <tr>
        <td height="35">
          <div align="right">密码确认：</div></td>
        <td>
            <div align="left">
              <input type="password" name="passwordOne">
          </div></td></tr>
      <tr>
        <td height="35">
          <div align="right">真实姓名：</div></td>
        <td>
            <div align="left">
              <html:text property="reallyName"></html:text>
          </div></td></tr>
      <tr>
        <td height="35">
          <div align="right">年龄：</div></td>
        <td>
            <div align="left">
              <html:text property="age"></html:text>             
          </div></td></tr>
      <tr>
        <td height="35">
          <div align="right">职业：</div></td>
        <td>
            <div align="left">
              <html:text property="profession"></html:text>
          </div></td></tr>
      <tr>
        <td height="35">
          <div align="right">Email地址：</div></td>
        <td>
            <div align="left">     
              <input name="email" required="true" validtype="checkEmail" class="easyui-validatebox"/>
          </div></td></tr>
      <tr>
        <td height="35">
          <div align="right">找回密码问题：</div></td>
        <td>
            <div align="left">
              <html:text property="question"></html:text>
          </div></td></tr>
      <tr>
        <td height="35">
          <div align="right">答案：</div></td>
        <td>
            <div align="left">
              <html:text property="result"></html:text>
          </div></td></tr>
    </table>
    <br>
<input type="image" class="input1"  src="image/save.jpg" width="51" height="20">
&nbsp;&nbsp;
<a href="#" onClick="javascript:memberForm.reset()"><img src="image/clear.gif"></a>
&nbsp;&nbsp;
<a href="#" onClick="javasrcipt:history.go(-1)"><img src="image/back.gif"></a>
</html:form>



 
  <p>&nbsp;  </p>    </td>
  </tr>
</table>
<jsp:include page="fg-down.jsp" flush="true"/>
</body>
</html:html>
