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
	<link href="${pageContext.request.contextPath}/assets/css/followerlist.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
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
								<img class="thumbnail img-responsive " src="${pageContext.request.contextPath}/assets/img/KTH.png" width="300px" height="300px">
							</div>

							<!--  왼쪽부분 -->
							<div class="media-body">
								<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:18px; color:black;"><strong>${chef.nickname }</strong></a>
								<br>
								<a href="${pageContext.request.contextPath }/userpage/followinglist?chef_no=${chef.chef_no }" style="font-size:11px; color:green;">팔로잉  ${chef.following_count }</a>
								<br>
								<a href="${pageContext.request.contextPath }/userpage/followedlist?chef_no=${chef.chef_no }" style="font-size:11px; color:green;">팔로워  ${chef.followed_count }</a>
								<br>
								<br>
								<br>
								<a href="#" class="btn btn-xs btn-success"><span class="glyphicon glyphicon-heart-empty"></span> 팔로우 하기</a>
								<a href="#" class="btn btn-xs btn-success"><span class="glyphicon glyphicon-heart"></span> 팔로우 중</a>
								
								
								<%-- 세션 추가 후 수정
								<c:choose>
				 					<c:when test = "${세션 == chef.chef_no }">    같은 사람 일 때 안 뜨고
				 						<td> </td>
				 					</c:when>
				 					<c:otherwise>    다른 사람일 때
					 					<c:when test = "${세션 != chef.chef_no }">   팔로우 안 눌렀으면
											<a href="#" class="btn btn-xs btn-success"><span class="glyphicon glyphicon-heart-empty"></span> 팔로우 하기</a>
											<c:otherwise>     팔로우 눌렀으면
												<a href="#" class="btn btn-xs btn-success"><span class="glyphicon glyphicon-heart"></span> 팔로우 중</a>
											</c:otherwise>
										</c:when>
									</c:otherwise>
								</c:choose> --%>
								
								
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
								<a href="${pageContext.request.contextPath }/enrollform/enrollmentform" style="font-size:11px; color:black;">글쓰기</a>
								<br>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">

				<!-- 카테고리 -->
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<h style="color:black;"><strong>${chef.nickname }님의 팔로우</strong></h>
						</h4>
						<hr>

						<!-- 프로필 섬네일 -->
						<div class="container-fluid">
				    		<div class="row">
					    		<c:forEach items="${followingList }" var="followingList">
					                <div class="col-md-4">
					                	<div class="artist-data pull-left">
					                    	<div class="artst-pic pull-left">
					                    		<a href="#">
					                    			<img src="${pageContext.request.contextPath}/assets/img/3.png" alt="" class="img-responsive" />
					                    		</a>
					                    	</div>
					                        <div class="artst-prfle pull-right">
					                        	<div class="art-title">
					                            	<a href="#" style="font-size:12px; color:black;"><Strong>${followingList.nickname }</Strong></a>
					                            	<br>
					                            	<h style="font-size:10px; color:gray;">${followingList.self_intro }</h>
					                            </div>
					                            <div class="counter-tab">
					                            	<span class="artst-like"><a href="#"><i class="glyphicon glyphicon-heart-empty"></i>${followingList.followed_count }</a></span>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </c:forEach>
				            </div>
						</div>
						
						<hr>
						<div class="media"></div>
					</div>
				</div>

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