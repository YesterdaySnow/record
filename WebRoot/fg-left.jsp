<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript" src="js/jQuery1.9.1.js"></script>
<%
String checkValue = (String)session.getAttribute("check");
%>
<script language="javascript">
window.onload = function() {
	var value =<%=checkValue%>;
	if(value==null)
	{
		divTag = document.getElementById("div");
		divTag.innerHTML="";
	}
	if(value =="0")
	{
		divTag = document.getElementById("div");
		divTag.innerHTML="��֤�����";
	}
}
/*
function checkEmpty(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert("����Ϣ����Ϊ��");
return false;
}
}
}
*/
function quit() {
  if(confirm("û��Ҫ��Ķ�������")){
    window.location.href="loginOut.jsp";
	}
  }

function reload(){
  document.getElementById("image").src="<%=request.getContextPath() %>/imageServlet?date="+new Date().getTime();
  $("#checkcode").val("");  
} 
$.extend($.fn.validatebox.defaults.rules, {
	checkName:{
		validator:function(value)
		{
			var reg = /^[a-zA-Z]\w{4,15}$/;
			return reg.test(value);
		},
		message:'��Ӣ����ĸ��������ɣ���ͷ����Ϊ����,��5-16λ'
	}
}
)
</script>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.wy.domain.AfficheForm"%>
<%@page import="com.wy.domain.GoodsForm"%>
<%@page import="com.wy.domain.MemberForm"%>
<%@page import="com.wy.domain.LinkForm"%>
<%@ page import="java.util.Date"  %>
<jsp:useBean id="affiche" scope="page" class="com.wy.dao.AfficheDao"/>
<jsp:useBean id="goods" scope="page" class="com.wy.dao.GoodsDao"/>
<jsp:useBean id="linkdao" scope="page" class="com.wy.dao.LinkDao"/>
<jsp:useBean id="countTime" scope="page" class="com.wy.tool.CountTime"/>
<%List afficheList=(List)affiche.selectAffiche();%>
<body>
<!--���01-->
	<%if(session.getAttribute("form")==null){%>		
	<table width="100%" height="138"  border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
		 <tr>
            <td height="16">&nbsp;</td>
          </tr>
        </table>
        <form name="form" method="post" action="memberAction.do?action=1">
          <table width="=185" border="0" align="center">
            <tr>
              <td width="100" height="25">&nbsp;�û���:</td>
              <td width="155"> <input name="name" type="text" size="15" required="true" validtype="checkName" class="easyui-validatebox"></td>
            </tr>
            <tr>
             <td height="25"> &nbsp;��&nbsp;&nbsp;��:</td>
              <td><input name="password" type="password" size="15"></td>
            </tr>
            <tr>
            	<td>&nbsp;��֤�룺</td>
            	<td><input type="text" name="checkcode"  id="checkcode" size="8"/></td>
            </td>
            <tr>
            <td>&nbsp;<img  src="<%=request.getContextPath() %>/imageServlet?date=<%=new Date() %>" alt="��֤��" id="image" onclick="reload()"/></td><td><div id="div"></div></td>
            </tr>
			 
			 <tr>
              <td height="26"><input type="image" class="input1"  src="image/fg-land.gif" width="51" height="20"></td>
              <td height="26"><a href="fg-memberRegister.jsp">ע��</a>&nbsp;&nbsp;<a href="fg-One.jsp">�һ����룿</a></td>
			 </tr>	  
          </table>
		  </form>
		  </td>
      </tr>
    </table>
	<%}else{
	   MemberForm form=(MemberForm)session.getAttribute("form");
	%>

	<table width="100%" height="138"  border="0" cellpadding="0" cellspacing="0" background="image/fg_left01.jpg">
      <tr>
        <td valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
		 <tr>
            <td height="30">&nbsp;</td>
          </tr>
        </table>
       
          <table width="167" border="0" align="center">
            <tr>
              <td width="161" height="25"><font color="#FB6801"><%=form.getName()%>,</font>��ӭ����</td>
              </tr>
            <tr>
              <td height="25"><%=countTime.currentlyTime()%></td>
              </tr>
			 <tr>
              <td height="25" >��Ա������<%=form.getReallyName()%></td>
              </tr>	 
			  <tr>
              <td height="20" align="right" valign="middle"><a href="javascript:quit()">��ȫ�˳�</a></td>
              </tr>	
          </table>
	  </td>
     </tr>
    </table>
		<%}%>
	<!--���02-->		
        <table width="100%" height="194" border="0" background="image/fg_left02.jpg">
          <tr>
            <td valign="top"><table width="150" border="0">
              <tr>
                <td height="32">&nbsp;</td>
              </tr>
            </table>
              <table width="179" border="0" align="center">
                <tr>
                  <td width="171" height="143">
				  <marquee direction="up" height="114" onmouseout="this.start()" 
             onmouseover="this.stop()" scrollAmount="1" scrollDelay="1">	  
		            <%
                      for(int i=0;i<afficheList.size();i++){
                        AfficheForm afficheForm=(AfficheForm)afficheList.get(i);
                        %>
						<img src="image/sign.gif">&nbsp;<a href="#" onClick="window.open('fg-afficheSelect.jsp?id=<%=afficheForm.getId()%>','','width=500,height=400');"><%=afficheForm.getName()%></a><br><br>
						<%}%>
            </marquee>			      </td>
                </tr>
              </table></td>
          </tr>
        </table>	
	    <table width="100%" height="193" border="0" cellpadding="0" cellspacing="0" background="image/fg_left03.jpg">
          <tr>
            <td valign="top"><table width="194" border="0">
              <tr>
                <td height="40">&nbsp;</td>
              </tr>
            </table>          
			
			            <%
             List goodsList =goods.selectGoodsNumber();
             int number=goodsList.size();
           if(number>7){
             number=7;
           }
             for(int account=0;account<number;account++){
             GoodsForm form=(GoodsForm)goodsList.get(account);
             %>			
			  <table width="178" height="19" border="0" align="center" cellpadding="0" cellspacing="0" background="image/fg_left04.jpg">
			    <tr>
			    <td width="14"></td>
                <td width="164"><a href="bg-sellResult.jsp?id=<%=form.getId()%>&account=<%=account+1%>"><%=account+1%>&nbsp;&nbsp;<%=form.getName()%></a></td>
				</tr>   
            </table>				
			<%}%>	</td>
          </tr>
        </table>
	    <table width="207" height="181" border="0" cellpadding="0" cellspacing="0" background="image/fg_left05.jpg">
          <tr>
            <td valign="top"><table width="173">
              <tr>
                <td height="35">&nbsp;</td>
              </tr>
            </table>
              <table width="186" align="center">
                <tr>
                  <td height="38">
				  <MARQUEE direction="up" height="114" onmouseout="this.start()" 
             onmouseover="this.stop()" scrollAmount="1" scrollDelay="1">	  
		            <%
		              List linkList=(List)linkdao.selectLink();
                      for(int i=0;i<linkList.size();i++){
                      LinkForm linkForm=(LinkForm)linkList.get(i);
                      %>
					<img src="image/sign1.gif">&nbsp; <a href="<%=linkForm.getLinkAddress()%>" target="_blank"><%=linkForm.getLinkName()%></a><br><br>
					<%}%>
            </marquee>				 </td>
                </tr>
              </table></td>
          </tr>
      </table>

</body>
</html>
