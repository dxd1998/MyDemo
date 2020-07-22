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
    <title>用户操作</title>
     <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
  </head>
  <body>
  		<div>
			<c:choose>
				<c:when test="${not empty requestScope.user }">
					<h1>修改用户信息</h1>
				</c:when>
				<c:otherwise>
					<h1>添加用户信息</h1>
				</c:otherwise>
			</c:choose>  			
  		</div>
  		<form>
		  <div class="form-group">
		    <label for="exampleInputEmail1">用户姓名:</label>
		    <input type="text" class="form-control" style="width:300px;" value="${requestScope.user.uName }" id="uName" placeholder="Name">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">用户年龄:</label>
		    <input type="text" class="form-control" style="width:300px;" value="${requestScope.user.uAge }" id="uAge" placeholder="Age">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">用户性别:</label>
		    <select id="sex" class="form-control" style="width:300px;">
		    	<option value="0">请选择</option>
		    	<option value="男">男</option>
		    	<option value="女">女</option>
		    </select>
		  </div>
		  <div class="form-group">
		   <label for="exampleInputPassword1">所属部门:</label>
		  <select class="form-control" id="dId" style="width:300px;">
	    	<option value="0">请选择</option>
	    	<c:forEach var="de" items="${requestScope.departmentList }">
	    		<option value="${de.dId }">${de.dName}</option>
	    	</c:forEach>
		  </select>
		  </div>
		  <c:choose>
		  		<c:when test="${not empty requestScope.user }">
		  			<button type="button" class="btn btn-default" id="update">修改</button>
		  		</c:when>
		  		<c:otherwise>
		  			<button type="button" class="btn btn-default" id="add">添加</button>
		  		</c:otherwise>
		  </c:choose>
		</form>
  		<script type="text/javascript" src="<%=path%>/static/js/jquery-1.12.4.js"></script>
  		<script type="text/javascript" src="<%=path %>/static/js/bootstrap.js"></script>
  		<script type="text/javascript">
  			//回显数据
  			var sex = '${requestScope.user.uSex}';
  			var dId = '${requestScope.user.department.dId}';
  			if(sex != ""){
  				$("#sex").val(sex);
  			}else{
  				$("#sex").val("0");
  			}
  			if(dId != ""){
  				$("#dId").val(dId);
  			}else{
  				$("#dId").val("0");
  			}
  			//修改按钮
  			$("#update").click(function(){
  				//用户输入
  				var uId = '${requestScope.user.uId}';
  				var uName = $("#uName").val();
  				var uAge = $("#uAge").val();
  				var uSex = $("#sex").val();
  				var dId = $("#dId").val();
  				//非空
  				if(uName == ""){
  					alert("用户名不能为空!");
  					return;
  				}
  				if(uAge == ""){
  					alert("年龄不能为空!");
  					return;
  				}
  				if(isNaN(uAge) == true){
  					alert("年龄必须为数字!");
  					return;
  				}
  				if(uSex == "0"){
  					alert("性别不能为空!");
  					return;
  				}
  				if(dId == "0"){
  					alert("部门不能为空!");
  					return;
  				}
  				var ise = {
  					uId:uId,
  					uName:uName,
  					uAge:uAge,
  					uSex:uSex,
  					dId:dId
  				}
  				//使用ajax
  				$.ajax({
  					url		:		"<%=path%>/spring/user/save",
  					method	:		"post",
  					data	:		ise,
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
  			});
  			
  			//添加按钮
  			$("#add").click(function(){
  				var uName = $("#uName").val();
  				var uAge = $("#uAge").val();
  				var uSex = $("#sex").val();
  				var dId = $("#dId").val();
  				//非空
  				if(uName == ""){
  					alert("用户名不能为空!");
  					return;
  				}
  				if(uAge == ""){
  					alert("年龄不能为空!");
  					return;
  				}
  				if(isNaN(uAge) == true){
  					alert("年龄必须为数字!");
  					return;
  				}
  				if(uSex == "0"){
  					alert("性别不能为空!");
  					return;
  				}
  				if(dId == "0"){
  					alert("部门不能为空!");
  					return;
  				}
  				var ise = {
  					uName:uName,
  					uAge:uAge,
  					uSex:uSex,
  					dId:dId
  				};
  				//使用ajax
  				$.ajax({
  					url		:		"<%=path%>/spring/user/saveAdd",
  					method	:		"post",
  					data	:		ise,
  					success	:		function(data){
  						var json =eval('('+data+')');
  						if(json.status == 1){
  							alert(json.message);
  							location.href="<%=path%>/spring/user/list";
  						}else{
  							alert(json.message);
  						}
  					}
  				});
  			});
  		</script>
  </body>
</html>
