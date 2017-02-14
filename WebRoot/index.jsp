<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.wy.domain.GoodsForm" %>
<jsp:useBean id="newGood" scope="page" class="com.wy.dao.GoodsDao"/>
<%List nowList =newGood.selectMark(Integer.valueOf("0"));%>
<%List freeList =newGood.selectMark(Integer.valueOf("1"));%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>网上唱片商城</title>
<link href="css/css.css" rel="stylesheet" type="text/css"> 
</head>

<body>
<SCRIPT language=JavaScript1.2>
<!--
var no = 12;
var speed = 10;
var heart = "image/floatsnow.GIF";
var flag;
var ns4up = (document.layers) ? 1 : 0;
var ie4up = (document.all) ? 1 : 0;

var dx, xp, yp;
var am, stx, sty;
var i, doc_width = 800, doc_height = 600;
if (ns4up) {
doc_width = self.innerWidth;
doc_height = self.innerHeight;
} else if (ie4up) {
doc_width = document.body.clientWidth;
doc_height = document.body.clientHeight;
}
dx = new Array();
xp = new Array();
yp = new Array();
amx = new Array();
amy = new Array();
stx = new Array();
sty = new Array();
flag = new Array();
for (i = 0; i < no; ++ i) {
dx[i] = 0; // set coordinate variables
xp[i] = Math.random()*(doc_width-30)+10;
yp[i] = Math.random()*doc_height;
amy[i] = 12+ Math.random()*20;
amx[i] = 10+ Math.random()*40;
stx[i] = 0.02 + Math.random()/10;
sty[i] = 0.7 + Math.random();
flag[i] = (Math.random()>0.5)?1:0;
if (ns4up) { // set layers
if (i == 0) {
document.write("<layer name=\"dot"+ i +"\" left=\"15\" ");
document.write("top=\"15\" visibility=\"show\"><img src=\"");
document.write(heart+ "\" border=\"0\"></layer>");
} else {
document.write("<layer name=\"dot"+ i +"\" left=\"15\" ");
document.write("top=\"15\" visibility=\"show\"><img src=\"");
document.write(heart+ "\" border=\"0\"></layer>");
}
} else
if (ie4up) {
if (i == 0) {
document.write("<div id=\"dot"+ i +"\" style=\"POSITION: ");
document.write("absolute; Z-INDEX: "+ i +"; VISIBILITY: ");
document.write("visible; TOP: 15px; LEFT: 15px;\"><img src=\"");
document.write(heart+ "\" border=\"0\"></div>");
} else {
document.write("<div id=\"dot"+ i +"\" style=\"POSITION: ");
document.write("absolute; Z-INDEX: "+ i +"; VISIBILITY: ");
document.write("visible; TOP: 15px; LEFT: 15px;\"><img src=\"");
document.write(heart+ "\" border=\"0\"></div>");
}
}
}

function helpor_net() {
for (i = 0; i < no; ++ i) {
if (yp[i] > doc_height-50) {
xp[i] = 10+ Math.random()*(doc_width-amx[i]-30);
yp[i] = 0;
flag[i]=(Math.random()<0.5)?1:0;
stx[i] = 0.02 + Math.random()/10;
sty[i] = 0.7 + Math.random();
doc_width = self.innerWidth;
doc_height = self.innerHeight;
}
if (flag[i])
dx[i] += stx[i];
else
dx[i] -= stx[i];
if (Math.abs(dx[i]) > Math.PI) {
yp[i]+=Math.abs(amy[i]*dx[i]);
xp[i]+=amx[i]*dx[i];
dx[i]=0;
flag[i]=!flag[i];
}
document.layers["dot"+i].top = yp[i] + amy[i]*(Math.abs(Math.sin(dx[i])+dx[i]));
document.layers["dot"+i].left = xp[i] + amx[i]*dx[i];

}
setTimeout("helpor_net()", speed);
}

function www_helpor_net() {
for (i = 0; i < no; ++ i) {
if (yp[i] > doc_height-50) {
xp[i] = 10+ Math.random()*(doc_width-amx[i]-30);
yp[i] = 0;
stx[i] = 0.02 + Math.random()/10;
sty[i] = 0.7 + Math.random();
flag[i]=(Math.random()<0.5)?1:0;
doc_width = document.body.clientWidth;
doc_height = document.body.clientHeight;
}
if (flag[i])
dx[i] += stx[i];
else
dx[i] -= stx[i];
if (Math.abs(dx[i]) > Math.PI) {
yp[i]+=Math.abs(amy[i]*dx[i]);
xp[i]+=amx[i]*dx[i];
dx[i]=0;
flag[i]=!flag[i];
}

document.all["dot"+i].style.pixelTop = yp[i] + amy[i]*(Math.abs(Math.sin(dx[i])+dx[i]));
document.all["dot"+i].style.pixelLeft = xp[i] + amx[i]*dx[i];
}
setTimeout("www_helpor_net()", speed);
}

if (ns4up) {
helpor_net();
} else if (ie4up) {
www_helpor_net();
}
//-->
</SCRIPT>
<jsp:include page="fg-top.jsp" flush="true"/>
<table width="766" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="207" valign="top" bgcolor="#F5F5F5">
    <!--左侧01-->
    <jsp:include page="fg-left.jsp" flush="true"/></td>
    <td width="559" valign="top" bgcolor="#FFFFFF">
    <!--右侧01-->	
	<jsp:include page="fg-goodSorts.jsp" flush="true"/>	


    <div align="center">
        <%if(session.getAttribute("form")!=null){%>
        <br>
        <img src="image/fg_right02.jpg">
    </div>
    <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#819BBC">
        <tr> 
		  <%
              int free=2;
              if(freeList.size()<2){
              free=freeList.size();
              }

              for(int i=0;i<free;i++)
              {
                GoodsForm freeGoods=(GoodsForm)freeList.get(i);
                %>
            <td valign="top">			<table width="257" height="136" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#999999">
              <tr>
                <td width="33%" height="80" rowspan="5" bgcolor="#FFFFFF">
                <a href="#" onClick="window.open('goodsAction.do?action=16&id=<%=freeGoods.getId()%>','','width=500,height=200');">
                <input name="pricture<%=i%>" type="image" src="<%=freeGoods.getPriture()%>" width="140" height="126"></a></td>
                
                <td width="67%" height="20" bgcolor="#FFFFFF"><div align="center"><%=freeGoods.getName()%></div></td>
              </tr>
              <tr>
                <td height="20" bgcolor="#FFFFFF"><div align="center" style="text-decoration:line-through;color:#910402">原价：<%=freeGoods.getNowPrice()%>元</div></td>
              </tr>
              <tr>
                <td height="20" bgcolor="#FFFFFF"><div align="center"><font color="#F14D83">现价：<%=freeGoods.getFreePrice()%>元</font></div></td>
              </tr>
              <tr>
                <td height="20" bgcolor="#FFFFFF"><div align="center"><%=freeGoods.getIntroduce()%></div></td>
              </tr>
              <tr>
                <td height="13" bgcolor="#FFFFFF"><div align="center" class="linkBlack"><a href="#" onClick="window.open('goodsAction.do?action=16&id=<%=freeGoods.getId()%>','','width=500,height=200');">查看</a></div></td>
              </tr>
            </table></td>
            <%}%>
        </tr>
</table>


<div align="center">
    <%}%>
    <img src="image/fg_right07.jpg">
</div>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    
          <tr>
            <td height="215" valign="top">
			<%
              int now=5;
              if(nowList.size()<5){
              now=nowList.size();
              }
             if(session.getAttribute("form")!=null){
			 now=3;
             }
              for(int i=0;i<now;i++)
              {
                GoodsForm newGoods=(GoodsForm)nowList.get(i);
                %><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>				<table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC"   >
                  <tr>
                    <td height="150" bordercolor="#666666" >
                      <table width="96%"  border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#CCCCCC" >
                        <tr>
                          <td width="36%" rowspan="4" bgcolor="#FFFFFF"><div align="center">
                              <a href="#" onClick="window.open('goodsAction.do?action=16&id=<%=newGoods.getId()%>','','width=500,height=200');">
                              <input name="pricture<%=i%>" type="image" src="<%=newGoods.getPriture()%>" width="110" height="100">
                              </a>
                          </div></td>
                          <td width="64%" bgcolor="#FFFFFF"><div align="center"><%=newGoods.getName()%></div></td>
                        </tr>
                        <tr>
                          <td bgcolor="#FFFFFF"><div align="center"><font color="#F14D83">单价：<%=newGoods.getNowPrice()%>元</font></div></td>
                        </tr>
                        <tr>
                          <td bgcolor="#FFFFFF"><div align="center"><%=newGoods.getIntroduce()%></div></td>
                        </tr>
                        <tr>
                          <td  bgcolor="#FFFFFF" class="linkBlack"  align="center">
                              
                              <a href="#" onClick="window.open('goodsAction.do?action=16&id=<%=newGoods.getId()%>','','width=500,height=200');">查看</a>

                        </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
            </table>
			<%}%>
			
			
			
			</td>
			 
		       
          </tr>
</table>











</td>
  </tr>
</table>

	<jsp:include page="fg-down.jsp" flush="true"/>

</body>
</html>
