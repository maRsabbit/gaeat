<%@ page language="java" contentType="text/html;  charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Mysite</title>
</head>
<body>
	<div id="container">
		
		<c:import url="/WEB-INF/views/includes/headNav.jsp"></c:import>	
		
		<div id="wrapper">
			<div id="content">
				<div id="user">
	
				<form id="join-form" name="joinForm" method="post" action="${pageContext.request.contextPath}/user/modify">
				<input type="text" value="" >
				<div><input type="button" value="서브밋" onclick="document.getElementById('join-form').submit();">
			<!-- 	<a href="#" onclick="document.getElimentById('join-form').submit();"> -->
				</a>
				</div>
				</form>
				</div><!-- /user -->
			</div><!-- /content -->
		</div><!-- /wrapper -->
		
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		
	</div><!-- /container -->
</body>
</html>		
		
