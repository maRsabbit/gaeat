<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico"/>
<title>가릿 - 가려서 먹자</title>

<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/assets/css/number.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css"	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/userpage.css"	rel="stylesheet" type="text/css">
<script type="text/javascript"	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
								
								
								
								<%-- <c:choose>
				 					<c:when test = "${authUser.authUser_no == chef.chef_no }">
				 						<td> </td>
				 					</c:when>
				 					<c:otherwise>
					 					<c:when test = "${authUser.authUser_no != chef.chef_no }">
											<a href="#" class="btn btn-xs btn-success"><span class="glyphicon glyphicon-heart-empty"></span> 팔로우 하기</a>
											<c:otherwise>
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
									<a href="${pageContext.request.contextPath }/enrollform/enrollmentform?chef_no=${chef.chef_no }" style="font-size:11px; color:black;">글쓰기</a>
								<br>
							</div>

						</div>
					</div>
				</div>
			</div>
	
		
		<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12" style="width:950px;">

			<!-- 카테고리 -->
			<div class="panel panel-default">
				<div class="panel-body">
					<h4>
						<a href="#" style="color:black;"><strong>${readformVo2.recipe_title}</strong></a>
					</h4>
					<hr>
					<br>
					
					
					<table border="0" width="880" >
					  <tr height="160">
					    <td rowspan="2" width="440px" valign="middle" align="center"><img src="${readformVo2.food_img}" alt="post img" class="foodsample"></td>
					    <td >
						   	<div class="container-fluid" style = "margin-left: 20px; margin-right: 20px">
								<div class="row">                   
							        <div class="progress">
							           <c:if test="${readformVo2.cooking_time=='5분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 12.5%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='10분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 25%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='15분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 37.5%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='30분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='60분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 62.5%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='90분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='2시간이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 87.5%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='2시간이상' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <span class="progress-type">조리시간</span>
							            <span class="progress-completed">${readformVo2.cooking_time }</span>
							        </div>
							        
							        <div class="progress">
							          <c:if test="${readformVo2.cooking_level=='아무나' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
							                <span class="sr-only">100% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.cooking_level=='초급' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
							                <span class="sr-only">100% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.cooking_level=='중급' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
							                <span class="sr-only">100% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.cooking_level=='고급' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
							                <span class="sr-only">100% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.cooking_level=='신의 경지' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
							                <span class="sr-only">100% Complete (success)</span>
							            </div>
							          </c:if>
							            <span class="progress-type">난이도</span>
							            <span class="progress-completed">${readformVo2.cooking_level }</span>
							        </div>
							        
							        <!-- 인분 -->
							        <div class="progress">
							          <c:if test="${readformVo2.amount=='1인분' }">
							           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 16%">
							                <span class="sr-only">20% Complete (success)</span>
							           </div>
							          </c:if>
							          <c:if test="${readformVo2.amount=='2인분' }">
							           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 32%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.amount=='3인분' }">
							           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 48%">
							                <span class="sr-only">20% Complete (success)</span>
							           </div>
							          </c:if>
							          <c:if test="${readformVo2.amount=='4인분' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 64%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.amount=='5인분' }">
							           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
							                <span class="sr-only">20% Complete (success)</span>
							           </div>
							          </c:if>
							          <c:if test="${readformVo2.amount=='6인분이상' }">
							           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
							                <span class="sr-only">20% Complete (success)</span>
							           </div>
							          </c:if>
							            <span class="progress-type">양</span>
							            <span class="progress-completed">${readformVo2.amount }</span>
							        </div>
								</div>
							</div>
						</td>
					  </tr>
					  <tr height="100">
					    <td align="center" style="padding-left:20px; padding-right:20px">${readformVo2.introduction}</td>
					  </tr>
					</table>
					<br>
					<br>
					<br>
					
					<div class="content-fluid">
					  <div>
					    <div>
					      <h6 class="line-title">재료 내역</h6> 
					     	<br>
							<br>
							<br>   
					    </div>
					    <div>
							<!-- 재료,양이 나오는 메소드 -->
							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="alert alert-success" style="width: 400px;">
											<table class="table" >
												<thead>
													<tr>
														<th>재료</th>
														<th>양</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${list3}" var="vo">
														<div class="row">
															<div class="col-md-5ths col-sm-5ths black"></div>
														</div>
														<tr>
															<td>${vo.material_name}</td>
															<td>${vo.amount}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
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
					
					<div>
						<div>
							<h6 class="line-title">조리 순서</h6>  
							<br>
							<br>
							<br>
						<br>  
						</div>
						
						<div>
							<div class="container">
								<div class="row">
									<!-- 조리 순서 리스트 -->
									<c:set var="no" value="0"/>
									<c:forEach items="${list}" var="vo">
									
										
										<table border="0" width="880" >
											<tr>
												<td width="150" valign="top" align="center">
													<div class="num-pad">
														<div class="span4">
															<div class="num">
																<div class="txt">${no+1 }</div>
																<c:set var="no" value="${no+1}"/>
															</div>
														</div>
													</div>
												</td>
												<td align="center">
													<div style="padding:25px">
														<img src="${vo.img_content}" width="440" height = "300">
													</div>
												</td>
												<td width="350" valign="top" style="padding:20px">
													<p class="list-group-item-text">${vo.text_content}</p>
												</td>
											</tr>
										</table>
										<br> 
									</c:forEach>
								</div>
							</div>
						</div>
					</div>	
					<br>
					<br>
					<br>
					<!-- <h6 class="line-title">댓글</h6> -->
					<br>
					<br>
					<br>

							<!-- 댓글 쓰는창 -->
							<div class="panel panel-default widget" style="width: 880px;">
								<div class="panel-heading">
									<span class="glyphicon glyphicon-comment"></span>
								</div>
								<div class="panel-body">
									<ul class="list-group">
										<li class="list-group-item">
											<div class="row">

												<div class="col-xs-10 col-md-11">
													<div>
														<a href="#" style="margin-left: 150px;"> id</a>
														<div class="col">
															<div class="panel-body">


																<!-- 댓글 프로필 사진  -->
																<div class="col-xs-2 col-md-1" style="width: 120px;">
																	<img src="http://placehold.it/80" class="img-circle img-responsive" alt="" />
																</div>
																															

																<!-- 댓글 창 -->
																<form id="write_form" method="post" action="${pageContext.request.contextPath}/read/insert">
																	<fieldset>
																		<div class="form-group">
																			<textarea name="user_comment" class="form-control" rows="3"
																				placeholder="댓글을 입력해주세요" style = "resize:none"></textarea>
																		</div>

																		<button type="submit" class="[ btn btn-success ]"
																			data-loading-text>댓글 달기</button>
																	</fieldset>
																</form>

															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
									</ul>
										<ul id="dat_list">
										</ul>
									<div id="pager" class="active" align=center>
									
									</div>
									
								</div>
							</div>
						</div>

					  <br>
					  <br>
					  <br>
					  <div>
						  <div>
						  	  <h6 class="line-title">연관된 다른 레시피</h6>
						  	  <br>
							  <br>
							  <br>    
						  </div>
						  
						  	<!-- 추천레시피 -->
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-4">
											<div class="single-blog-item">
												<div class="blog-thumnail">
													<a href="${pageContext.request.contextPath}/user/readform"><img src="${pageContext.request.contextPath}/assets/img/2.png" class ="foodimage" alt="blog-img"></a>
												</div>
												<div class="blog-content">
													<h4>
														<a href="${pageContext.request.contextPath}/user/readform">제육볶음</a>
														<h style="font-size:6px; color:green;">by </h>
														<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:12px; color:black;">Kim Tae Hee</a>
													</h4>
													<p>정말 맛있는 제육볶음 소개~</p>
												</div>
												<span class="blog-date">좋아요 99</span>
											</div>
										</div>
										<div class="col-md-4">
											<div class="single-blog-item">
												<div class="blog-thumnail">
													<a href="${pageContext.request.contextPath}/user/readform"><img src="${pageContext.request.contextPath}/assets/img/2.png" class ="foodimage" alt="blog-img"></a>
												</div>
												<div class="blog-content">
													<h4>
														<a href="${pageContext.request.contextPath}/user/readform">제육볶음</a>
														<h style="font-size:6px; color:green;">by </h>
														<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:12px; color:black;">Kim Tae Hee</a>
													</h4>
													<p>정말 맛있는 제육볶음 소개~</p>
												</div>
												<span class="blog-date">좋아요 99</span>
											</div>
										</div>
										<div class="col-md-4">
											<div class="single-blog-item">
												<div class="blog-thumnail">
													<a href="${pageContext.request.contextPath}/user/readform"><img src="${pageContext.request.contextPath}/assets/img/2.png" class ="foodimage" alt="blog-img"></a>
												</div>
												<div class="blog-content">
													<h4>
														<a href="${pageContext.request.contextPath}/user/readform">제육볶음</a>
														<h style="font-size:6px; color:green;">by </h>
														<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:12px; color:black;">Kim Tae Hee</a>
													</h4>
													<p>정말 맛있는 제육볶음 소개~</p>
												</div>
												<span class="blog-date">좋아요 99</span>
											</div>
										</div>
									</div>
								</div>
								
						  </div>
					  </div>
					<br>
					<br>
					<br>
				<div class="media"></div>
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


<!-- <script type="text/javascript">
(function($) {
	$.fn
			.extend({
				tableAddCounter : function(options) {

					// set up default options 
					var defaults = {

						start : 1,
						id : false,
						cssClass : false
					};

					// Overwrite default options with user provided
					var options = $.extend({}, defaults, options);

					return $(this)
							.each(
									function() {
										// Make sure this is a table tag
										if ($(this).is('table')) {

											// Add column title unless set to 'false'
											if (!options.title)
												options.title = '';
											$(
													'th:first-child, thead td:first-child',
													this)
													.each(
															function() {
																var tagName = $(
																		this)
																		.prop(
																				'tagName');
																$(this)
																		.before(
																				'<'
																						+ tagName
																						+ ' rowspan="'
																						+ $('thead tr').length
																						+ '" class="'
																						+ options.cssClass
																						+ '" id="'
																						+ options.id
																						+ '">'
																						+ options.title
																						+ '</' + tagName + '>');
															});

											// Add counter starting counter from 'start'
											$('tbody td:first-child', this)
													.each(
															function(i) {
																$(this)
																		.before(
																				'<td>'
																						+ (options.start + i)
																						+ '</td>');
															});

										}
									});
				}
			});
})(jQuery);

$(document).ready(
		function() {
			$('.table').tableAddCounter();
			$.getScript("http://code.jquery.com/ui/1.9.2/jquery-ui.js")
					.done(function(script, textStatus) {
						$('tbody').sortable();
						$(".alert-info").alert('close');
						$(".alert-success").show();
					});
		});
</script> -->



<!-- 댓글의 ajax -->

<script type="text/javascript">
	$(document).ready(function() {
		fetchlist();//list를 그려라 라는 명령

		//저장버튼 클릭
		$("#write_form").on("submit", function() {//위에 있는 write_form 즉, 전에 사용하던 write_Form의 기능을 막아준다.
			event.preventDefault();//원래 기능을 막아준다.
			console.log("전송완료");
			
			
			var user_comment = $("[name=user_comment]").val();
			
			console.log(user_comment);
			
			$('#dat_list').empty();
			$('#pager').empty();
			

			//ajax의 형식
			$.ajax({
				url : "${pageContext.request.contextPath }/read/add",
				type : "post",//데이터 형식
				/*contentType : "application/json",*/
				data : {
					user_comment : user_comment,
					recipe_no : '${readformVo2.recipe_no}',
					chef_no :'${chef.chef_no}'
				},//앞의 name은 앞쪽에서의 name 뒤에서는 넘기고 싶은 값

				dataType : "json",//json으로 받는다.
				success : function(datVo) {
					
					fetchlist();
					
					
					/*성공시 처리해야될 코드 작성*/},

				error : function(XHR, status, error) {
					console.error(status + " : " + error);

				}

			});

		});
		
		
		//목록
		$('#pager').on('click', 'button', function(){
			
			$('#dat_list').empty();
			
			
			
			var page=$(this).val()*1;
				
			var start=(page-1)*3;
			var end=(3*page);
		
		$.ajax({
			url : "${pageContext.request.contextPath }/read/list",
			type : "post",//데이터 형식
			/*contentType : "application/json",*/
			data : {recipe_no : '${readformVo2.recipe_no}'},

			//dataType : "json",
			success : function(datlist) {
				
								
				for (var i=start; i <end; i++) {
					reader(datlist[i], "down");//한번씩 List값을 가져오라는 얘기
				}
				

				
				/*성공시 처리해야될 코드 작성*/},

			error : function(XHR, status, error) {
				console.error(status + " : " + error);

			}

		});
		
		
		
		});//number의 마무리 괄호
		

		$('#dat_list').on('click', 'button', function(){
			
			
			console.log(this);
			var comment_no = $(this).val();
			console.log(comment_no);
			
			$('#dat_list').empty();
			$('#pager').empty();
			
			console.log(comment_no);
				
		
		$.ajax({
			url : "${pageContext.request.contextPath }/read/delete",
			type : "post",//데이터 형식
			/*contentType : "application/json",*/
			data : {comment_no: comment_no},

			//dataType : "json",
			success : function(datlist) {
				
				fetchlist();

				
				/*성공시 처리해야될 코드 작성*/},

			error : function(XHR, status, error) {
				console.error(status + " : " + error);

			}

		});
		
		
		
		});//number의 마무리 괄호
		
		
		
		

	});//ready를 마무리 하는 괄호

	
	
	function fetchlist() {

		//ajax의 형식
		$.ajax({
			url : "${pageContext.request.contextPath }/read/list",
			type : "post",//데이터 형식
			/*contentType : "application/json",*/
			data : {recipe_no : '${readformVo2.recipe_no}' },

			//dataType : "json",
			success : function(datlist) {
				
				
				for (var i =0; i < 3; i++) {
					reader(datlist[i], "down");//한번씩 List값을 가져오라는 얘기
				}
				if(datlist.length%3==0){
					var pageNo=datlist.length/3;
					for(var j=1; j<=pageNo; j++){
						paging(j);
					}
				}
				else{
					var pageNo2=(datlist.length/3)+1;
					for(var k=1; k<=pageNo2; k++){
						paging(k);
					}
				}

				
				/*성공시 처리해야될 코드 작성*/},

			error : function(XHR, status, error) {
				console.error(status + " : " + error);

			}

		});

	}
	
	

	function reader(datVo, updown) {

		var str = "";//여기에 문자열을 담는다.

		

		
		str += "   <ul class='list-group'>";
		str += "      <li class='list-group-item'>";
		str += "          <div class='row'>";
		str += "            <div class='col-xs-10 col-md-11'>";
		str += "               <div>";
		str += "                  <a href='#' style='margin-left: 150px;'>"+ datVo.nickname +"</a>";
		str += "                    <div class='col'>";
		str += "                      <div class='panel-body'>";
		str += "                         <div class='col-xs-2 col-md-1' style='width: 120px;'>";
		str += "                           <img src='"+ datVo.profile +"' class='img-circle img-responsive' alt='' />";
		str += "                         </div> ";
		str += "                              <fieldset>";
		str += "                                 <div class='form-group'>";
		str += "                                   <p class='form-control'>"+ datVo.user_comment +"</p>";
		str += "                                 </div>";
		str += "                              </fieldset>";
		str += "                      </div>";
		str += "                    </div>";
		str += "                   </div>";
		str += "               </div>";
		str += "            </div>";
		str += "          </div>";
		str += "                <div align=right>";
		
		if(datVo.chef_no==1){
			str += "             <button class='[ btn btn-success ]' name='comment_no' id='comment_no' value="+datVo.comment_no+">삭제</button>"
		}
	    str += "                </div>";
		str += "          </li>";
		str += "   </ul>";
		

		if (updown == "down") {
			$("#dat_list").append(str);//javascript는 ()를 이용

		} else if (updown == "up") {
			$("#dat_list").prepend(str);
		} else {
			$("#dat_list").append(str);
		}

	}
	
	function paging(length){
		
		var str="";
		
		
		str+="<button class='[ btn btn-success ]' value="+length+">"+length+"</button> ";
		
		$("#pager").append(str);
		
	}

	function readURL(input) {

	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#blah').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#imgInp").change(function(){
	    readURL(this);
	});
	
</script>

	<!-- progress bar -->
    <style type="text/css">
        body {
    margin: 30px 0px;
}
.progress {
    position: relative;
	height: 25px;
}
.progress > .progress-type {
	position: absolute;
	left: 0px;
	font-weight: 800;
	padding: 3px 30px 2px 10px;
	color: rgb(255, 255, 255);
	background-color: rgba(25, 25, 25, 0.2);
}
.progress > .progress-completed {
	position: absolute;
	right: 0px;
	font-weight: 800;
	padding: 3px 10px 2px;
}



/* text box */
body, html {
  height: 100%;
}

body {
  font-size: 1.3em;
  line-height: 1.4em;
  color: #6F7C80;
}

.content {
  padding-top: 100px;
}

section {
  width: 500px;
  margin: auto;
  text-align: center;
  margin-bottom: 3em;
}

.line-title {
  margin-bottom: 1.3em;
  font-size: 1.5em;
  text-align: center;
  display: block;
  position: relative;
  overflow: hidden;
}
.line-title:before, .line-title:after {
  content: '';
  display: inline-block;
  height: 1px;
  background: #6F7C80;
  width: 50%;
  position: relative;
  vertical-align: middle;
}
.line-title:before {
  left: -0.5em;
  margin-left: -50%;
}
.line-title:after {
  right: -0.5em;
  margin-right: -50%;
}



    </style>
    
    
    

</html>
