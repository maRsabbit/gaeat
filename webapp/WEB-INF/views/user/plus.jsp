<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/assets/css/plus.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>


<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<br>
		<button id="add">재료 추가 하기</button>
		<button id="remove">재료 빼기</button>
		<br>
		<br>
		<div id="div1">
			<table id="table">
				<tr>
					<td>재료명</td>
					<td><input class="form-control" type="text" id="ingredient"
						placeholder="ingredient"></td>
					<td>양</td>
					<td><input class="form-control" type="text" id=""
						placeholder="amount"></td>
					</tr>
				
			</table>

		</div>
	</div>

</body>
<script>

$(function(){
    $("#remove").click(function(){
        $("#table").remove();
    });
});


$(function(){
    $("#add").click(function(){
        $("#table").clone().appendTo("#div1");
    });
});
</script>


</html>

