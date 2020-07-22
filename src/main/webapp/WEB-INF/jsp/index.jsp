<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
     <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
  </head>
  
  <body>
  <br/>
  		<div style="margin-left:200px;">
		    	<label for="exampleInputEmail1">员工名称:</label>
			    <input type="text" class="form-control" style="width:300px;display: inline-block;" id="uName" placeholder="${uName==null||uName==''?'Name':uName }">
			    <label for="exampleInputEmail1">部门选择:</label>
			    <select class="form-control" id="dId" style="width:300px;display: inline-block;">
			    	<option value="0">请选择</option>
			    	<c:forEach var="de" items="${requestScope.departmentList }">
			    		<option value="${de.dId }">${de.dName}</option>
			    	</c:forEach>
			    </select>
			    <input type="button" class="btn btn-default" value="查询" id="select"/>
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <input type="button" class="btn btn-primary" value="添加用户信息" id="add"/>
		    </div>
		    <br/>
  		<table class="table table-striped">
  			<tr>
  				<td>员工编号</td>
  				<td>员工姓名</td>
  				<td>员工年龄</td>
  				<td>员工性别</td>
  				<td>员工部门</td>
  				<td>操作</td>
  			</tr>
  			<c:forEach var="user" items="${requestScope.userList }">
  				<tr>
  					<td>${user.uId }</td>
  					<td>${user.uName }</td>
  					<td>${user.uAge }</td>
  					<td>${user.uSex }</td>
  					<td>${user.department.dName}</td>
  					<td>
  						<div class="dropdown">
						  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						    更多操作
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						    <li><a href="<%=path%>/spring/user/toUpdate?uId=${user.uId}">修改</a></li>
						    <li role="separator" class="divider"></li>
						    <li><a href="javascript:void(0)" onclick="isDelete(${user.uId})">删除</a></li>
						  </ul>
						</div>
  					</td>
  				</tr>
  			</c:forEach>
		</table>
  		<script type="text/javascript" src="<%=path%>/static/js/jquery-1.12.4.js"></script>
  		<script type="text/javascript" src="<%=path %>/static/js/bootstrap.js"></script>
  		<script type="text/javascript">
  			//条件查询
  			$("#select").click(function(){
  				//用户输入
  				var uName = $("#uName").val();
  				var dId = $("#dId").val();
  				
  				//查询
  				location.href="<%=path%>/spring/user/list?uName="+uName+"&dId="+dId;
  			});
  			
  			//删除按钮点击事件
  			function isDelete(uId){
  				var flag = window.confirm("是否确认删除该用户?");
  				if(flag){
  					//使用ajax
  					$.ajax({
  						url		:		"<%=path%>/spring/user/del",
  						method	:		"post",
  						data	:		{"uId":uId},
  						success	:		function(data){
  							var json = eval('('+data+')');
  							if(json.status == 1){
  								alert(json.message);
  								location.href="<%=path%>/spring/user/list";
  							}else{
  								alert(json.message);
  							}
  						}
  					});
  				}
  			}
  			
  			//添加员工
  			$("#add").click(function(){
  				location.href="<%=path%>/spring/user/toAdd";
  			});
  		</script>
  </body>
</html>
