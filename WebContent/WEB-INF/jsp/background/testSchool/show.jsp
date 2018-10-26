<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@include file="../../common/taglib.jsp"%>
<%@include file="../../common/common-css.jsp"%>
<%@include file="../../common/common-js.jsp"%>
</head>

<body>

<div style="height: 100%;overflow-y: auto;">
<div id="forms" class="mt10">
   <div class="box">
     <div class="box_border">
       <div class="box_top" ><b class="pl15" >系统管理——>信息展示</b></div>
       <div class="box_center" style="overflow-y:scroll;align:center; height:75%;">
		<form action="" method="post" name="userForm" id="userForm">
			<input type="hidden" name="school_id" value=""><!-- 修改时候自动添加 -->
			<table class="form_table pt15 pb15 list_table" width="100%" border="1" cellpadding="0" cellspacing="0">
			
                <!-- 展示信息 -->
                			<tr>
					<td class="td_right">
						学校对应的ID:
					</td>
					<td class="td_left" >
					${object.schoolId}
					</td>
				</tr>
				<tr>
					<td class="td_right">
						学校名字:
					</td>
					<td class="td_left" >
					${object.name}
					</td>
				</tr>
				<tr>
					<td class="td_right">
						学校地址:
					</td>
					<td class="td_left" >
					${object.address}
					</td>
				</tr>
				<tr>
					<td class="td_right">
						联系方式:
					</td>
					<td class="td_left" >
					${object.phone}
					</td>
				</tr>
				<tr>
					<td class="td_right">
						地区:
					</td>
					<td class="td_left" >
					${object.area}
					</td>
				</tr>
	     
                                   
				<tr>
					<td class="td_right">
                    </td>
                    <td class="td_left">
                      <input type="button"  class="btn btn82 btn_nochecked" value="返回" onclick="location.href='javascript:history.go(-1)'">
                    </td>
				</tr>
			</table>
		  </form>
		  </div>
          </div>
        </div>
     </div>
	</div>
</body>
</html>
