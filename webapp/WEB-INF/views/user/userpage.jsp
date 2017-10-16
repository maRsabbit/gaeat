<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico"/>
<title>가릿 - 가려서 먹자</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- css, bootstrap, js 적용 -->
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/userpage.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>

	<c:import url="/WEB-INF/views/includes/headNav.jsp"></c:import>

	<div class="mainbody container">
	
		
		<div class="row">

			<div style="padding-top: 30px;"></div>
			<div class="col-lg-2 col-md-2 hidden-sm hidden-xs">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="media">
							<div align="center">
								<img class="thumbnail img-responsive " src="${chef.profile }" width="300px" height="300px">
							</div>

							<!--  왼쪽부분 -->
							<div class="media-body">
								<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:18px; color:black;"><strong>${chef.nickname }</strong></a>
								<br>
								<br>
								
								
								<a href = "${pageContext.request.contextPath }/userpage/followedlist?chef_no=${chef.chef_no }" style="font-size:13px; color:green;" style = "float:left">팔로우</a>
								<a class = "followingNo" href="${pageContext.request.contextPath }/userpage/followinglist?chef_no=${chef.chef_no }" style="font-size:13px; color:green;" value = "${chef.following_count }">${chef.following_count }</a>
								<br>
								<a href = "${pageContext.request.contextPath }/userpage/followedlist?chef_no=${chef.chef_no }" style="font-size:13px; color:green;" style = "float:left">팔로워</a>
								<a class = "followerNo" href="${pageContext.request.contextPath }/userpage/followedlist?chef_no=${chef.chef_no }" style="font-size:13px; color:green;" value = "${chef.followed_count }">${chef.followed_count }</a>
								<br>
								<br>
								<br>
								<input id= "authUserFinder" type = "hidden" name = "${authUser.chef_no }">
								 <c:choose>
				 					<c:when test = "${authUser.chef_no == null}">
				 						<br>
				 					</c:when>
				 					<c:when test = "${authUser.chef_no == chef.chef_no}">
				 						<br>
				 					</c:when>
				 					<c:when test = "${authUser.chef_no != chef.chef_no}">
											
												<c:if test = "${followcheck == 1}">
													
													<a href="#" class="btn btn-xs btn-success followed" name = "${chef.chef_no}"> <span class="glyphicon glyphicon-heart"></span>팔로우 중</a>
													
												</c:if>
												
												<c:if test = "${followcheck != 1}">
													
													<a href="#" class="btn btn-xs btn-success following" name = "${chef.chef_no}"><span class="glyphicon glyphicon-heart-empty following"></span> 팔로우하기</a>
												
												</c:if>
											
									</c:when>
									
								</c:choose>
								
								<script>
									$(document).on("click",".followed",function(){
										
										str = "<a href='#' class='btn btn-xs btn-success following'><span class='glyphicon glyphicon-heart-empty following'></span> 팔로우하기</a>";
										
										$(this).replaceWith(str);
										
									})
									
									$(document).on("click",".following",function(){
										
										var chef_no = $(this).attr("name");
										
										str = "<a href='#' class='btn btn-xs btn-success followed'> <span class='glyphicon glyphicon-heart'></span> 팔로우 중</a>";
										
										$(this).replaceWith(str);
										
										var user_no = $("#authUserFinder").attr("name"); 
										
										console.log(user_no);
										
										var followVo = {
												user_no:user_no,
												chef_no:chef_no
										}
										
										$.ajax({
											url: "${pageContext.request.contextPath}/userpage/followAdd",
											type : "post",
											contentType : "application/json",
											data: JSON.stringify(followVo),
											dataType : "json",
											success : function(no) {
											
												console.log("follow 추가 보내기 성공");
												
												var followingNo = $(".followerNo").val();
												
												console.log(followingNo);
												followingNo = followingNo + 1;
												
												str = "<a class = 'followerNo' href='${pageContext.request.contextPath }/userpage/followedlist?chef_no=${chef.chef_no }' style='font-size:13px; color:green;'>"+ followingNo +"</a>"
												
												$(".followerNo").replaceWith(str);
											
											}, 
											error : function(XHR, status, error) {
												console.error(status + " : " + error);
											}
										});
										
									})
								</script>
								
								
								<br>
								<br>
								<p style="font-size:12px; color:gray;">${chef.self_intro }</p>
								<hr>
								<a href="${pageContext.request.contextPath }/userpage/scraplist?chef_no=${chef.chef_no }" style="font-size:12px; color:black;">스크랩한 글 모아보기</a>
								<hr>
								<h5>
									<strong>카테고리</strong>
									<a href="#" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-wrench" data-toggle="modal" data-target="#companyPositionModal" data-backdrop="false"></span>  </a>
								</h5>
								
								<c:forEach items="${recipebookList }" var="list">
									<tr>
										<a href="#" style="font-size:11px; color:black;">${list.recipebook_name }</a>
										<br>
									</tr>
								</c:forEach>
								<br>
								<hr>
								<br>
								<br>
								<br>
								<br>
									<a href="${pageContext.request.contextPath }/enrollform/enrollmentform?chef_no=${chef.chef_no }" style="font-size:11px; color:black;">글쓰기</a>
								<br>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
			
				<!-- 카테고리 -->
				<c:forEach items="${recipebookList }" var="blist">
					<div class="panel panel-default">
						<div class="panel-body">
							<h4>
								<a href="#" style="color:black;"><strong>${blist.recipebook_name }</strong></a> 
								&nbsp;
								
						<a data-toggle="modal" href="#myModal" class="btn btn-xs btn-default" data-backdrop="false">구독하기</a>
						
								<div style="text-align:right">
									<h style="font-size:12px; color:green;">${blist.subscription_count }명이 구독 중 입니다.</h>
								</div>
							</h4>
							<hr>
	
								<!-- 갤러리 -->
								<div class="container-fluid">
									<div class="row">
										<c:forEach items="${recipeList }" var="list">
											<c:if test ="${blist.recipebook_no  == list.recipebook_no }">
												<div class="col-md-4">
													<div class="single-blog-item">
														<div class="blog-thumnail">
															<a href="${pageContext.request.contextPath}/read/readform?recipe_no=${list.recipe_no }"><img src="${pageContext.request.contextPath}/assets/img/2.png" class ="foodimage" alt="blog-img"></a>
														</div>
														<div class="blog-content">
															<h4>
																<a href="${pageContext.request.contextPath}/user/readform" style="font-size:16px" >${list.recipe_title }</a>
																<h style="font-size:4px; color:green;">by </h>
																<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:10px; color:black;">${list.nickname }</a>
															</h4>
															<p>${list.introduction }</p>
														</div>
														<span class="blog-date">좋아요 ${list.like_count }</span>
													</div>
												</div>
											</c:if>	
										</c:forEach>
									</div>
								</div>
							
							<hr>
							<div class="media"></div>
						</div>
					</div>
				</c:forEach>
				
				
				
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>	
		
	<c:import url="/WEB-INF/views/includes/userModal.jsp"></c:import>
	
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
</body>