<%@ page contentType="text/html; charset=gb2312" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.wy.domain.GoodsForm" %>
<%GoodsForm form=(GoodsForm)request.getAttribute("goodPicture");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>电子商城</title>
</head>
 <link href="css/css.css" rel="stylesheet" type="text/css"> 
<body>
<jsp:include page="fg-top.jsp" flush="true"/>
<table width="766" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="207" bgcolor="#F5F5F5">
    <!--左侧01-->
    <jsp:include page="fg-left.jsp" flush="true"/></td>
    <td width="559" valign="top" bgcolor="#FFFFFF">
    <!--右侧01-->	
	<jsp:include page="fg-goodSorts.jsp" flush="true"/>	
	
<br>
		<table width="67%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#819BBC">
          <tr>
            <td width="36%" rowspan="4" height="120">
            <a href="#" onClick="window.open('goodsAction.do?action=16&id=<%=form.getId()%>','','width=500,height=200');">
            <input type="image" src="<%=form.getPriture()%>" width="140" height="126"></a></td>
            
            <td width="64%" height="30"><div align="center"><%=form.getName()%></div></td>
          </tr>
          <tr>
            <td height="30"><div align="center">
            <%if(form.getMark().toString().equals("0")){%>
              单价：<%=form.getNowPrice()%>元
            <%}else{%>
             <font color="#FF0000"> 特价：<%=form.getFreePrice()%>元</font>
            <%}%>
            </div></td>
          </tr>
          <tr>
            <td height="30"><div align="center"><%=form.getIntroduce()%></div></td>
          </tr>
          <tr>
            <td height="30"> <div align="center"> 
              <a href="#" onClick="window.open('goodsAction.do?action=16&id=<%=form.getId()%>','','width=500,height=200');">查看</a>
				

			    </div></td>
          </tr>
        </table>
	</td>
  </tr>
</table>
<jsp:include page="fg-down.jsp" flush="true"/>
</body>
</html>
