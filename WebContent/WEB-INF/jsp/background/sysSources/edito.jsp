<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<%@include file="../../common/taglib.jsp" %>
    <%@include file="../../common/common-css.jsp" %>
    <style type="text/css">
      input{font-size: 12px}
    </style>
  </head>
   <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.min.js"></script>
    <script type="text/javascript">
	  function saveData(){
		 var name = $("#name").val();
    	 var resKey = $("#resKey").val();		  
    	 var resUrl = $("#resUrl").val();	
    	 if(name=="" || name==null){
    	 	alert("请填入资源名称!");
    	 	return false;
    	 }
    	 if( resKey=="" || resKey==null ){
    	 	alert("请填入资源KEY!");
    	 	return false;
    	 }
    	 if(resUrl=="" || resUrl==null){
    	 	alert("请填入资源URL!");
    	 	return false;
    	 }
    	 
    	 //提交.
    	  document.sourceForm.submit();
   	  	  return true;
	  }
	  
	  //查找是否已经存在.
	  $(function (){
  		$("#name").change(function(){
			var name = $("#name").val();
			if(name != null && name != ''){
				$.ajax({
					url:'<%=request.getContextPath()%>/background/resources/findByName.html',
					data:{"name":name},
					type : "POST",
					success:function(msg){
						var obj = eval(msg);
						if (obj.msg == "Y"){
							alert(obj.content);
							$("#name").val("");
							return ;
						}
					}
				});
			}
  		});
  		
  		$("#resKey").change(function(){
			var resKey = $("#resKey").val();
			if(resKey != null && resKey != ''){
				$.ajax({
					url:'<%=request.getContextPath()%>/background/resources/findByKey.html',
					data:{"resKey":resKey},
					type : "POST",
					success:function(msg){
						var obj = eval(msg);
						if (obj.msg == "Y"){
							alert(obj.content);
							$("#resKey").val("");
							return ;
						}
					}
				});
			}
  		});
  		
  		$("#resUrl").change(function(){
			var resUrl = $("#resUrl").val();
			if(resUrl != null && resUrl != ''){
				$.ajax({
					url:'<%=request.getContextPath()%>/background/resources/findByUrl.html',
					data:{"resUrl":resUrl},
					type : "POST",
					success:function(msg){
						var obj = eval(msg);
						if (obj.msg == "Y"){
							alert(obj.content);
							$("#resUrl").val("");
							return ;
						}
					}
				});
			}
  		});
  		
	  });
	  
  </script>
  
  <body>
<br/>
<br/>  
<form action="<%=request.getContextPath()%>/background/sysSources/updateById.html" method="post"  name="sourceForm" id="sourceForm" >
	    <input type="hidden" name="sourceId" value="${resources.sourceId}">
	    <input type="hidden" name="sourceStatus" value="${resources.sourceStatus}">
		<table class="ttab" height="100" width="70%" border="0" cellpadding="0" cellspacing="1"
			align="center">
			<tr>
				<td height="30"
					 colspan="2">
					<div align="center">
					<font color="blue" size="4" ><b>修改资源</b></font>
					</div>
				</td>
			</tr>
			<tr>	
					<td height="30" width="40%" >
						<div align="right" class="STYLE1" >
								上级资源：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<select name="parentId">
                            <option value="1010">顶级菜单</option>
                            <c:forEach var="key" items="${resLists}">
                                <option value="${key.sourceId}" <c:if test="${key.sourceId eq resources.parentId}">selected="selected"</c:if>>${key.sourceName}</option>
                            </c:forEach>
                        </select>
						</div>
					</td>
				</tr>
			<tr>	
					<td height="30" width="40%" >
						<div align="right" class="STYLE1" >
								资源名称：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="sourceName" id="name" value="${resources.sourceName}"/>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30" width="40%" >
						<div align="right" class="STYLE1" >
								资源KEY：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="sourceKey" id="resKey" value="${resources.sourceKey}"/>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30" width="40%" >
						<div align="right" class="STYLE1">
								资源URL：
						</div>
					</td>
					<td>
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="sourceUrl" id="resUrl"  value="${resources.sourceUrl}"/>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30" width="40%" >
						<div align="right" class="STYLE1" >
								资源类型：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input name="sourceType" type="radio" value="0" <c:if test="${resources.sourceType eq '0'}">checked="checked"</c:if>/>目录　　
						<input name="sourceType" type="radio" value="1" <c:if test="${resources.sourceType eq '1'}">checked="checked"</c:if>/>菜单　　
						<input name="sourceType" type="radio" value="2" <c:if test="${resources.sourceType eq '2'}">checked="checked"</c:if>/>按扭
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30" width="40%" >
						<div align="right" class="STYLE1" >
								优先级：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="sourceLevel" value="${resources.sourceLevel}"/>
						</div>
					</td>
				</tr>
				<tr>	
					<td height="30" width="40%" >
						<div align="right" class="STYLE1" >
								资源描述：
						</div>
					</td>
					<td >
						<div align="left" class="STYLE1"  style="padding-left:10px;">
						<input style="height: 20px;width: 200px" name="description" value="${resources.description}"/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 10px">
						<div align="center">
							<sec:authorize ifAnyGranted="ROLE_sys_sources_edit">
			 					<input type="button" value="　保　存　" class="input_btn_style1" onclick="return saveData()"/>
			 				</sec:authorize>　　　　
			 				<input id="backBt" type="button" value="　返　回　" class="input_btn_style1" onclick="javascript:window.location.href='javascript:history.back()'"/>
		 				</div>
					</td>
				</tr>
		</table>
    </form>
  </body>
</html>