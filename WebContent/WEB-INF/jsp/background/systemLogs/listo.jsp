<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >

<%@include file="../../common/taglib.jsp" %>
<%@include file="../../common/common-css.jsp" %>
<%@include file="../../common/common-js.jsp" %>

<head>

<link rel="stylesheet" type="text/css" 	href="<%=request.getContextPath()%>/css/fenyecss.css" />
<style type="text/css">
  input{font-size: 12px}
</style>

</head>

<body>
<form id="fenye" name="fenye" action="<%=request.getContextPath()%>/background/systemLogs/find.html" method="post">
<table width="100%">
  <tr>
    <td height="30" background="<%=request.getContextPath()%>/images/tab_05.gif">
    <table width="100%">
      <tr>
        <td width="12" height="30"><img src="<%=request.getContextPath()%>/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%">
          <tr>
            <td width="46%" valign="middle"><table width="100%">
              <tr>
                <td width="5%"><div align="center"><img src="<%=request.getContextPath()%>/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：操作日志管理-日志列表</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="16">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <td align="center">
  <!-- 这里的表单 name 必须是fenye -->
  	<div class="search_k" align="left">
		<fieldset class="search">
			<legend><img src="<%=request.getContextPath()%>/images/search_btn.gif" align="middle"/>&nbsp;<span class="STYLE1" style="color: blue;">高级查找</span></legend>
			<div class="search_content">
				用户名：<input type="text" name="sysUserName" value="${param.sysUserName}" style="height: 20px"/>　　
				模块：<input type="text" name="module" value="${param.module}" style="height: 20px"/>　
				<input type="submit" value="开始查询" class="input_btn_style1"/>&nbsp;&nbsp;
				<input type="reset" value="重置" class="input_btn_style1" onclick="clearText()"/>
			</div>
		</fieldset>
	</div>
  </td>
  </tr>
  <tr>
    <td><table class="listtable" width="100%">
      <tr>
        <td width="8" background="<%=request.getContextPath()%>/images/tab_12.gif">&nbsp;</td>
        <td><table class="ttab" width="100%" cellspacing="1" onMouseOver="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="5%" height="22" background="<%=request.getContextPath()%>/images/bg.gif" ><span class="STYLE1">用户ID</span></td>
 			<td width="5%" height="22" background="<%=request.getContextPath()%>/images/bg.gif" ><span class="STYLE1">用户名</span></td>
            <td width="12%" height="22" background="<%=request.getContextPath()%>/images/bg.gif" ><span class="STYLE1">模块</span></td>
            <td width="12%" height="22" background="<%=request.getContextPath()%>/images/bg.gif" ><span class="STYLE1">执行操作</span></td>
            <td width="15%" height="22" background="<%=request.getContextPath()%>/images/bg.gif"  class="STYLE1">操作时间</td>
            <td width="15%" height="22" background="<%=request.getContextPath()%>/images/bg.gif"  class="STYLE1">用户ＩＰ</td>
            </tr>
          
          <c:forEach var="log" items="${pageView.records}">
          <tr>
            <td height="20" ><span class="STYLE1">${log.sysUserId}</span></td>
            <td height="20" ><span class="STYLE1">${log.sysUserName}</span></td>
            <td height="20" ><span class="STYLE1">${log.module}</span></td>
            <td height="20" ><span class="STYLE1">${log.action}</span></td>
            <td height="20" ><span class="STYLE1">
            <fmt:formatDate value="${log.operatorTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </span></td>
			<td height="20" ><span class="STYLE1">${log.userIp}</span></td>
			</tr>
          </c:forEach>
        </table>
        </td>
        <td width="8" background="<%=request.getContextPath()%>/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="<%=request.getContextPath()%>/images/tab_19.gif">
    <%@include file="../../common/webfenye.jsp" %>    </td>
  </tr>
</table>
</form>
</body>
</html>