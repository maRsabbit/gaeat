<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/assets/css/loginform.css"
	rel="stylesheet" type="text/css">
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">

<!-- css, bootstrap, js 적용 -->
<link href="${pageContext.request.contextPath}/assets/css/loginform.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css"
	rel="stylesheet" type="text/css">


<style type="text/css">
.target {
	display: /* 한 줄 자르기 */ display : inline-block;
	width: 320px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis; /* 여러 줄 자르기 추가 스타일 */
	white-space: normal;
	line-height: 1.2;
	height: 3.6em;
	text-align: left;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}
</style>


<!-- 로그인폼 스타일  -->

<style type="text/css">
/* #####################################################################
   #
   #   Project       : Modal Login with jQuery Effects
   #   Author        : Rodrigo Amarante (rodrigockamarante)
   #   Version       : 1.0
   #   Created       : 07/28/2015
   #   Last Change   : 08/02/2015
   #
   ##################################################################### */
@import url(http://fonts.googleapis.com/css?family=Roboto);

* {
	font-family: 'Roboto', sans-serif;
}

#login-modal .modal-dialog {
	width: 350px;
}

#login-modal input[type=text], input[type=password] {
	margin-top: 10px;
}

#div-login-msg, #div-lost-msg, #div-register-msg {
	border: 1px solid #dadfe1;
	height: 30px;
	line-height: 28px;
	transition: all ease-in-out 500ms;
}

#div-login-msg.success, #div-lost-msg.success, #div-register-msg.success
	{
	border: 1px solid #68c3a3;
	background-color: #c8f7c5;
}

#div-login-msg.error, #div-lost-msg.error, #div-register-msg.error {
	border: 1px solid #eb575b;
	background-color: #ffcad1;
}

#icon-login-msg, #icon-lost-msg, #icon-register-msg {
	width: 30px;
	float: left;
	line-height: 28px;
	text-align: center;
	background-color: #dadfe1;
	margin-right: 5px;
	transition: all ease-in-out 500ms;
}

#icon-login-msg.success, #icon-lost-msg.success, #icon-register-msg.success
	{
	background-color: #68c3a3 !important;
}

#icon-login-msg.error, #icon-lost-msg.error, #icon-register-msg.error {
	background-color: #eb575b !important;
}

#img_logo {
	max-height: 100px;
	max-width: 100px;
}

/* #########################################
   #    override the bootstrap configs     #
   ######################################### */
.modal-backdrop.in {
	filter: alpha(opacity = 50);
	opacity: .8;
}

.modal-content {
	background-color: #ececec;
	border: 1px solid #bdc3c7;
	border-radius: 0px;
	outline: 0;
}

.modal-header {
	min-height: 16.43px;
	padding: 15px 15px 15px 15px;
	border-bottom: 0px;
}

.modal-body {
	position: relative;
	padding: 5px 15px 5px 15px;
}

.modal-footer {
	padding: 15px 15px 15px 15px;
	text-align: left;
	border-top: 0px;
}

.checkbox {
	margin-bottom: 0px;
}

.btn {
	border-radius: 0px;
}

.btn:focus, .btn:active:focus, .btn.active:focus, .btn.focus, .btn:active.focus,
	.btn.active.focus {
	outline: none;
}

.btn-lg, .btn-group-lg>.btn {
	border-radius: 0px;
}

.btn-link {
	padding: 5px 10px 0px 0px;
	color: #95a5a6;
}

.btn-link:hover, .btn-link:focus {
	color: #2c3e50;
	text-decoration: none;
}

.glyphicon {
	top: 0px;
}

.form-control {
	border-radius: 0px;
}

.searchbar-btn-custom {
	background-color: hsl(145, 31%, 71%) !important;
	background-repeat: repeat-x;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#e0efe6",
		endColorstr="#9ecbb1");
	background-image: -khtml-gradient(linear, left top, left bottom, from(#e0efe6),
		to(#9ecbb1));
	background-image: -moz-linear-gradient(top, #e0efe6, #9ecbb1);
	background-image: -ms-linear-gradient(top, #e0efe6, #9ecbb1);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #e0efe6),
		color-stop(100%, #9ecbb1));
	background-image: -webkit-linear-gradient(top, #e0efe6, #9ecbb1);
	background-image: -o-linear-gradient(top, #e0efe6, #9ecbb1);
	background-image: linear-gradient(#e0efe6, #9ecbb1);
	border-color: #9ecbb1 #9ecbb1 hsl(145, 31%, 66%);
	color: #333 !important;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.33);
	-webkit-font-smoothing: antialiased;
}

/* 체크박스 */
.checkbox {
	padding-left: 20px;
}

.checkbox label {
	display: inline-block;
	position: relative;
	padding-left: 5px;
}

.checkbox label::before {
	content: "";
	display: inline-block;
	position: absolute;
	width: 17px;
	height: 17px;
	left: 0;
	margin-left: -20px;
	border: 1px solid #cccccc;
	border-radius: 3px;
	background-color: #fff;
	-webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
	-o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
	transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
}

.checkbox label::after {
	display: inline-block;
	position: absolute;
	width: 16px;
	height: 16px;
	left: 0;
	top: 0;
	margin-left: -20px;
	padding-left: 3px;
	padding-top: 1px;
	font-size: 11px;
	color: #555555;
}

.checkbox input[type="checkbox"] {
	opacity: 0;
}

.checkbox input[type="checkbox"]:focus+label::before {
	outline: thin dotted;
	outline: 5px auto -webkit-focus-ring-color;
	outline-offset: -2px;
}

.checkbox input[type="checkbox"]:checked+label::after {
	font-family: 'FontAwesome';
	content: "\f00c";
}

.checkbox input[type="checkbox"]:disabled+label {
	opacity: 0.65;
}

.checkbox input[type="checkbox"]:disabled+label::before {
	background-color: #eeeeee;
	cursor: not-allowed;
}

.checkbox.checkbox-circle label::before {
	border-radius: 50%;
}

.checkbox.checkbox-inline {
	margin-top: 0;
}

.checkbox-primary input[type="checkbox"]:checked+label::before {
	background-color: #428bca;
	border-color: #428bca;
}

.checkbox-primary input[type="checkbox"]:checked+label::after {
	color: #fff;
}

.checkbox-danger input[type="checkbox"]:checked+label::before {
	background-color: #d9534f;
	border-color: #d9534f;
}

.checkbox-danger input[type="checkbox"]:checked+label::after {
	color: #fff;
}

.checkbox-info input[type="checkbox"]:checked+label::before {
	background-color: #5bc0de;
	border-color: #5bc0de;
}

.checkbox-info input[type="checkbox"]:checked+label::after {
	color: #fff;
}

.checkbox-warning input[type="checkbox"]:checked+label::before {
	background-color: #f0ad4e;
	border-color: #f0ad4e;
}

.checkbox-warning input[type="checkbox"]:checked+label::after {
	color: #fff;
}

.checkbox-success input[type="checkbox"]:checked+label::before {
	background-color: #5cb85c;
	border-color: #5cb85c;
}

.checkbox-success input[type="checkbox"]:checked+label::after {
	color: #fff;
}

@font-face{
	
	font-family:'squareRoundEB';
	src:url(${pageContext.request.contextPath}/assets/fonts/NanumSquareRoundEB.ttf) format('truetype') ;
	
	
}
.row a,.sidhatefood ,.chef{font-family:'squareRoundEB';font-size:20px}


#loginBtn ,#modalBtn
	{background-color:#aeb991 !important;background-image:none	}
	
.button-add
	{background-color:#8a9887 ; border:0px ;width:150px;height:50px;font-size:30px;color:#faf9f7}
</style>

<!-- Navigation -->
<!-- Navigation -->
<div class="container-fluid">
	<nav class="navbar navbar-fixed-top" role="navigation"
		id="navbar-scroll" style="margin-bottom:0px;height: 110px; background-image: url(${pageContext.request.contextPath}/assets/img/main_back.png);">
		<div class="container-fluid" style="width: 1300px; heigt: auto;margin-right: auto; margin-left: auto;">

			<!-- toggle -->
			<div class="col-xs-1" >
				<a id="main" style="z-index: 1">
				 <img src ="${pageContext.request.contextPath}/assets/img/MENU.png" style="margin-top:30px;cursor: pointer;" onclick="openNav()">
				</a>

				<div id="mySidenav" class="sidenav">
				<div>
				
				</div>
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<!-- 로그인 버튼 -->
					<div class="row">
						<p class="text-center" id="userchange">
						<p id="userremove">
							<c:choose>
								<c:when test="${authUser!=null}">

									<div id="profile" align="center">
										<img src="${authUser.profile}" width="100" />
									</div>

									<c:choose>
										<c:when test="${authUser.nickname==null}">
										<a class ="chef"> chef :  </a>
										<p> ${authUser.nickname}</p>
											<a id="name" 
												href="${pageContext.request.contextPath }/userpage/main?chef_no=${authUser.chef_no}"> chef home  </a>
										</c:when>
										<c:otherwise>
										<a class ="chef"> chef : ${authUser.name} </a>
											<a id="name"
												href="${pageContext.request.contextPath }/userpage/main?chef_no=${authUser.chef_no}">  chef home   </a>
										</c:otherwise>
									</c:choose>
										<a id="modify" 
										href="${pageContext.request.contextPath}/user/userprofile">my page </a>
									<c:choose>
										<c:when test="${authUser.socialcheck=='s'}">
											<a id="logoutbtn"
												href="${pageContext.request.contextPath}/main/logout">로그아웃</a>
										</c:when>
										<c:otherwise>
											<a id="logoutbtn"
												href="${pageContext.request.contextPath}/main/logoutUser">로그아웃</a>
										</c:otherwise>
									</c:choose>
									
								</c:when>
					<c:otherwise>
									
									<a id="custom-login-btn" href="javascript:loginWithKakao()">
									<img src="${pageContext.request.contextPath}/assets/img/kakologin.png"/>
									</a>
									
									<a class="btn-facebook "  id="loginBtn" >
									<img src="${pageContext.request.contextPath}/assets/img/facebooklogin.png"/>
									</a>
									
									<a href="#login-modal" id="modalBtn"
										 role="button"
										data-toggle="modal" data-backdrop="false" >
										<img src="${pageContext.request.contextPath}/assets/img/gaeatlogin.png"/>
										</a>
								</c:otherwise>

							</c:choose>
						</p>
						</p>
					</div>

					<!-- 최초 로그인 폼 -->
					<div class="modal fade" id="login-modal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
						style="display: none; background-color: rgba(0, 0, 0, 0.5); z-index: 2;">
						<div class="modal-dialog" style="left: 0%">
							<div class="modal-content">
								<div class="modal-header" align="center">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span class="glyphicon glyphicon-remove" aria-hidden="true">
										</span>
									</button>
								</div>
								<!-- Begin # DIV Form -->
								<div id="div-forms">

									<!-- 로그인 폼 시작  -->
									<form id="login-form" method="post"
										action="${pageContext.request.contextPath}/user/login">
										<div class="modal-body">
											<div id="div-login-msg">
												<div id="icon-login-msg"
													class="glyphicon glyphicon-chevron-right"></div>
												<span id="text-login-msg">이메일/비밀번호를 입력하세요.</span>
											</div>
											<input id="login_username" name="Id" class="form-control"
												type="text" placeholder="가입하신 이메일 아이디를 입력하세요." value="">
											<input id="login_password" name="password"
												class="form-control" type="password"
												placeholder="비밀번호를 입력하세요 " value="">
											<div class="checkbox">
												<label> <input type="checkbox"> 내 입력내용 기억
												</label>
											</div>
										</div>
										<div class="modal-footer">
											<div>
												<button type="submit"
													class="btn btn-primary btn-lg btn-block">로그인</button>
											</div>
											<div>
												<button id="login_lost_btn" type="button"
													class="btn btn-link">비밀번호찾기</button>
												<button id="login_register_btn" type="button"
													class="btn btn-link">회원가입</button>
											</div>
										</div>
									</form>
									<!-- End # Login Form -->

									<!-- 비밀번호 찾기 -->
									<form id="lost-form" style="display: none;">
										<div class="modal-body">
											<div id="div-lost-msg">
												<div id="icon-lost-msg"
													class="glyphicon glyphicon-chevron-right"></div>
												<span id="text-lost-msg">이메일을 입력하세요.</span>
											</div>
											<input id="lost_email" class="form-control" type="text"
												placeholder="E-Mail (type ERROR for error effect)" required>
										</div>
										<div class="modal-footer">
											<div>
												<button type="submit"
													class="btn btn-primary btn-lg btn-block">찾기</button>
											</div>
											<div>
												<button id="lost_login_btn" type="button"
													class="btn btn-link">로그인</button>
												<button id="lost_register_btn" type="button"
													class="btn btn-link">회원가입</button>
											</div>
										</div>
									</form>
									<!-- 비밀번호 찾기 끝 -->


									<!-- 회원가입폼 시작 -->
									<form id="register-form" method="post" style="display: none;"
										action="${pageContext.request.contextPath }/user/join"
										enctype="multipart/form-data">
										<div class="modal-body" style="height: 400px">
											<div id="image_preview">
												<img src="" width="100"
													class="avatar img-circle img-thumbnail" alt="avatar"
													id="LoadImg">
											</div>

											<input name="file" type="file" id="images"
												onchange="preview_images();"> <input name="Id"
												class="form-control" type="text"
												placeholder="aaa@naver.com 의 형식으로 입력해주세요. " required>
											<input name="name" class="form-control" type="text"
												placeholder="사용자 이름을 입력해 주세요 . " required> 
												<input
												name="nickname" class="form-control" type="text"
												placeholder="사용하실 닉네임을 입력해 주세요 . " required> 
												<input
												name="password" class="form-control" type="password"
												placeholder="사용자 비밀번호를 입력해 주세요. " required> 
												<input
												name="userintro" class="form-control" type="text"
												height="20px" placeholder="사용자 홈에 표시될 간단한 자기 소개를 작성해 주세요."
												required> 
												<input name="socialcheck"
												style="display: none" value="none" id="imgchange">
										</div>
										<div class="modal-footer">
											<div>
												<input type="submit">
											</div>
											<div>
												<button id="register_login_btn" type="button"
													class="btn btn-link">로그인</button>
												<button id="register_lost_btn" type="button"
													class="btn btn-link">비밀번호찾기</button>
											</div>
										</div>
									</form>
									<!-- End | Register Form -->
								</div>
								<!-- End # DIV Form -->
							</div>
						</div>
					</div>
					<!-- 최초 로그인 폼 끝 -->
					<hr style="border: solid 1px #faf9f7;">
					<!-- 구분 라인 -->
					<c:choose>
							<c:when test="${authUser!=null}">
								<div class="sidhatefood">
									<img src="${pageContext.request.contextPath}/assets/img/dislike.PNG" onclick="ab()" />
								<div id="hatefoodlist">
								</div>
								</div>
							</c:when>
							<c:otherwise>
								<div></div>
							</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			<!-- 토글 끝  -->
			<script>
				function openNav() {
					document.getElementById("mySidenav").style.width = "250px";
					document.getElementById("main").style.marginLeft = "0px";//사이드메뉴가 클릭되면 메인을 왼쪽으로 옮길지 ?
					/* document.body.style.backgroundColor = "#E1FFE1"; */
				}

				function closeNav() {
					document.getElementById("mySidenav").style.width = "0";
					document.getElementById("main").style.marginLeft = "0";
					document.body.style.backgroundColor = "white";
				}
			</script>
			<script type="text/javascript">
				function ab(){
					$("#hatefoodlist").empty();
					var chef_no = ${authUser.chef_no};
					console.log(chef_no);
					$.ajax({
								url : "${pageContext.request.contextPath }/user/seldislist",
								type : "POST",
								/* contentType : "application/json", */
								data : {
									chef_no : chef_no
								},
								dataType : "json",
								success : function(authUser) {
									renderhatefood(authUser);
										console.log(authUser);
								},
								error : function(XHR, status, error) {
									console.error(status + " : " + error);
								}
							});
				}
				function renderhatefood(authUser) {
					var hatefood = authUser.hatefood;
					if (hatefood != null && hatefood != "") {
						dislist = hatefood.split(',')
						for (var i = 0; i < dislist.length; i++) {
							var str = "";
							str += "<div id ='dislist"+i+"'  value='"+dislist[i]+"' >"
							str += "<input type='text' name='hatefood'  value='"+dislist[i]+"' style='width:100px;margin-bottom:5px;background-color:transparent;border:0px;margin-left:31px;margin-top:10px' readonly> ";
							str += " <input type='button'  id ='dislist"
									+ i
									+ "' value='삭제' style='border-radius: 5px;background-color: transparent;border: 2px solid #6082af ;margin-left:20px' onclick='dislist_remove(this)'> "
							$("#hatefoodlist").append(str);
						}
					} else {
						var str = "";
						str += "<input type='text' id= 'nohatefood' value='제외된 재료가 없습니다.' style='width:200px;margin-bottom:5px'>";
						$("#hatefoodlist").append(str);
						$("#nohatefood").fadeOut();
					}
				}

				function dislist_remove(obj) {
					var delete_id = obj.getAttribute('id');
					var value_by_id = $('#' + delete_id + '').attr('value');
					console.log(value_by_id);
					$
							.ajax({
								url : "${pageContext.request.contextPath }/user/dellist",
								type : "POST",
								/* contentType : "application/json", */
								data : {
									hatefood : value_by_id
								},
								dataType : "json",
								success : function(authUser) {
									console.log("Aa");
								},
								error : function(XHR, status, error) {
									console.error(status + " : " + error);
								}
							});
					document.getElementById(obj.getAttribute('id')).remove();
				}
			</script>
			<script type="text/javascript">
				function preview_images() {
					$("#image_preview").empty();
					var total_file = document.getElementById("images").files.length;
					for (var i = 0; i < total_file; i++) {
						$('#image_preview')
								.append(
										"<img  width='100' class='avatar img-circle img-thumbnail' src='"
												+ URL
														.createObjectURL(event.target.files[i])
												+ "'> ");
					}
				}
			</script>

			<!-- searchbar 입니다.-->
			<div class="col-xs-10" style="z-inde: -1;">
				<div id="custom-search-input"
					style="display: table; margin-left: auto; margin-right: auto;">
					<div class="input-group" id="searchbtn">
						<input type="text" id="search_word" name="search_word"
							class="search-query form-control"
							style="margin-bottom: 10px; margin-top: 10px; width: 600px; height: 45px; float: left; border-style: solid; border-color: green; border-width: thin; text-size: 30px; font-weight: bold;"
							제외하고 싶은 재료 앞에 -를 붙여주세요!! 검색어 키워드간 , 구분은 필수입니다." /> <span
							class="input-group-btn">
							<button class="btn searchbar-btn-custom" id="search_btn"
								type="submit"
								style="height: 45px; border-style: solid; border-color: green; border-width: thin; float: right; z-index: 2"
								value="";>
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
					<p
						style="float: bottom; font-size: 7px; align: center; margin-left: 30px" id="recommendTag">
						추천 태그:&emsp;</p>
				</div>
			</div>

			<script type="text/javascript">
			//자동 갱신한다.
			reloadtag();
			function reloadtag() {
				console.log("recommendTag");
				$.ajax({
					url : "${pageContext.request.contextPath }/etc/drawtag",
					type : "post",
					dataType : "json",
					success : function(t_list) {
						console.log("1");
						for (var i = 0; i < t_list.length; i++) {
							drawtag(t_list[i]);
						}
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
					});
			}
			function drawtag(t_list){
				var str = "";
				str += "<u><a href=\"javascript:tagsearch("+t_list.tag_no+");\">"+t_list.tag_name+"</a></u> &emsp;&emsp; ";
	
				$("#recommendTag").append(str);
			}
			
			function tagsearch(tag_no){
				var kvo = new Object();
				kvo.type = "종류별";
				kvo.method = "방법별";
				kvo.level ="난이도";
				kvo.time = "조리시간";
				kvo.tag_no = tag_no;
				kvo.orderOption = "최신순"; 
				kvo.currNo=1;
				console.log(kvo);
				
				$.ajax({
					url : "${pageContext.request.contextPath }/etc/tagsearch",
					type : "post",
					dataType : "json",
					data : kvo,
					success : function(recipeList) {
						var page = calculate(kvo.currNo, recipeList.length);
						console.log(page)
						if($("#recipeList").length){
							$("#pagination").empty();
							$("#recipeList").empty();
							console.log(recipeList);
							for (var i = page.rowStart; i <=page.rowEnd; i++) {
								render(recipeList[i-1]);
							}
							drawPaging(page);
							$("body").scrollTop(0);
						} else {
							window.location.href ="${pageContext.request.contextPath}/etc/list";
							console.log(recipeList);for (var i = page.rowStart; i <=page.rowEnd; i++) {
								render(recipeList[i-1]);
							}
							drawPaging(page);
							$("body").scrollTop(0);
						}
						
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			}
			</script>
			<!-- 검색 버튼 클릭 -->
			<script type="text/javascript">

			
				$("#search_btn").on("click", function(){
					console.log("넌 이미 눌렀다.");
					var inputkey = $("#search_word").val();
					if($("#byType").length){
						console.log("검색페이지얌");
						var kvo = new Object();
						kvo.type = $("#byType option:selected").text();
						kvo.method = $("#byMethod option:selected").text(); 
						kvo.level = $("#byLevel option:selected").text();
						kvo.time = $("#byTime option:selected").text();
						kvo.orderOption = $(':radio[name=orderby]:checked').val(); 
						kvo.currNo = 0;
						kvo.word = inputkey;
						console.log(kvo);
					} else {
						console.log("검색페이지가 아님");
						var kvo = new Object();
						kvo.type = "종류별";
						kvo.method = "방법별";
						kvo.level ="난이도";
						kvo.time = "조리시간";
						kvo.word = inputkey;
						kvo.orderOption = "최신순"; 
						kvo.currNo = 0;
						console.log(kvo);
					}
					console.log(inputkey);
					
					$.ajax({
						url : "${pageContext.request.contextPath }/etc/search2",
						type : "post",
						dataType : "json",
						data : kvo,
						success : function(recipeList) {
							var page = calculate(kvo.currNo, recipeList.length);
							if($("#recipeList").length){
								$("#recipeList").empty();
								$("#pagination").empty();
								console.log(recipeList);
								console.log(page);
								for (var i = page.rowStart; i <=page.rowEnd; i++) {
									render(recipeList[i-1]);
								}
								drawPaging(page);
								$("body").scrollTop(0);
							} else {
								window.location.href ="${pageContext.request.contextPath}/etc/list";
								console.log(recipeList);
								console.log(page);
								for (var i = page.rowStart; i <=page.rowEnd; i++) {
									render(recipeList[i-1]);
								}
								drawPaging(page);
								$("body").scrollTop(0);
							}
						},
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
					});
				});
				function list(curr) {
					$("#recipeList").empty();
					$("#pagination").empty();
					var kvo = new Object();
					kvo.type = $("#byType option:selected").text();
					kvo.method = $("#byMethod option:selected").text(); 
					kvo.level = $("#byLevel option:selected").text();
					kvo.time = $("#byTime option:selected").text();
					kvo.word = $("#search_word").val();
					kvo.currNo;
					if(curr == 0){
						kvo.currNo = 0;
					} else {
						kvo.currNo = curr
					}
					kvo.orderOption = $(':radio[name=orderby]:checked').val(); 
					console.log(kvo);
					$.ajax({
						url : "${pageContext.request.contextPath }/etc/search2",
						type : "get",
						dataType : "json",
						data : kvo,
						success : function(recipeList) {
							console.log(recipeList);
							var page = calculate(kvo.currNo, recipeList.length);
							console.log(page);
							for (var i = page.rowStart; i <=page.rowEnd; i++) {
								render(recipeList[i-1]);
							}
							drawPaging(page);
							$("body").scrollTop(0);
						},
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
					});

				}
				
				function render(recipeVo){
					var str = "";
					str += "<div class=\"col-md-4\">";
						str += "<div class=\"single-blog-item\">";
							str += "<div class=\"blog-thumnail\"style=\" height: 220px; overflow: hidden\">";
								str += "<a href=\"\">";
								if(recipeVo.food_img=="이미지없음"){
									str += "<img src=\"${pageContext.request.contextPath}/assets/img/2.jpg\" alt=\"blog-img\" style=\"width: auto; height: auto;\"></a>";
								} else {
									str += "<img src=\""+recipeVo.food_img+"\" alt=\"blog-img\" style=\"width: auto; height: auto;\"></a>";
								}
							str += "</div>";
							str += "<div class=\"blog-content\">";
								str += "<h4>";
									str += "<a href=\"#\">"+recipeVo.recipe_title+"</a>";
									str += "<a href=\"#\" style=\"font-size:11px; color:black;\">   by  "+recipeVo.nickname+"</a>";
								str += "</h4>";
								str += "<div class = 'target'>";
								str += "<p>"+recipeVo.introduction+"</p>";
								str += "</div>";
								str += "<a href='${pageContext.request.contextPath }/read/readform?recipe_no="+recipeVo.recipe_no+" ' class=\"more-btn\">View More</a>";
							str += "</div>";
							str += "<span class=\"blog-date\">좋아요 "+recipeVo.like_count+"</span>";
						str += "</div>";
					str += "</div>";
					
					$("#recipeList").append(str);
					
				}

				function calculate(currNo, length) {
					var countPerPage = 6; // 한번에 6개를 표시해준다.
					var totalCnt = length; // 전체 데이터 수
					var page; // 현재 페이지
					var prevPage; // 시작페이지
					var nextPage; // 종료페이지

					if (currNo == 0) {
						page = 1;
					} else {
						page = currNo;
					}
					var totPage = Math.ceil(length / countPerPage);
					var rowStart = (page - 1) * countPerPage + 1;
					var rowEnd = (page - 1) * countPerPage + 6;
					if(rowEnd>=totalCnt){
						rowEnd=totalCnt;
					}
					if (page <= 1) {
						prevPage = 0;
					} else {
						prevPage = page - 1;
					}

					if (page >= totPage) {
						nextPage = 0;
					} else {
						nextPage = page + 1;
					}

					var pageVo = {
						countPerPage : countPerPage,
						totPage : totPage,
						totalCnt : totalCnt,
						page : page,
						prevPage : prevPage,
						nextPage : nextPage,
						rowStart : rowStart,
						rowEnd : rowEnd
					}

					return pageVo;
				}


				function drawPaging(page){
					var str = "";
					str += "<div class=\"input-group   col-lg-6  col-md-6  col-sm-6 col-xs-12\">";
					if (page.page == 1) { //련재페이지가 1이면 표시하지 않는다.
						str += "<input class=\"jumpBtn\"  type=\"button\" value=\"First\" style=\"display: none;\">";
						str += "<input class=\"jumpBtn\"  type=\"button\" value=\"Prev\"  style=\"display: none;\">";
					} else {
						str += "<input class=\"jumpBtn\"  type=\"button\" value=\"First\" onClick=\"gotoPage(1)\">";
						str += "<input class=\"jumpBtn\"  type=\"button\" value=\"Prev\" onClick=\"gotoPage("
								+ page.prevPage + ")\">";
					}
					str += "<input type=\"text\" id=\"currNo\" value="+page.page+" class=\"pageNumT\" >";
					str += "<label class=\"pageNumL\" > / " + page.totPage + "</label>";
					str += "<input  class=\"jumpBtn\" type=\"button\" value=\"이동\" onClick=\"gotoPage2()\">";
					if (page.page == page.totPage) {
						str += "<input class=\"jumpBtn\"  type=\"button\" value=\"Next\" style=\"display: none;\" >";
						str += "<input class=\"jumpBtn\"  type=\"button\" value=\"Last\" style=\"display: none;\" >";
					} else {
						str += "<input class=\"jumpBtn\"  type=\"button\" value=\"Next\" onClick=\"gotoPage("
								+ page.nextPage + ")\">";
						str += "<input class=\"jumpBtn\"  type=\"button\" value=\"Last\" onClick=\"gotoPage("
								+ page.totPage + ")\">";
					}
					str += "</div>";
					$("#pagination").append(str);
					/*
					<div class="input-group   col-lg-6  col-md-6  col-sm-6 col-xs-12">
							<span class="input-group-addon btn btn-primary" data-pager-action='first'>
							<i class="fa fa-angle-left"></i>First</span>
							<span class="input-group-addon btn btn-primary" data-pager-action='previous'>
							<i class="fa fa-angle-double-left"></i> Previous</span>
							<input type="text" class="form-control" data-pager-action='pagenum'>
							<span class="input-group-addon btn btn-primary" data-pager-action='next'>
							<i class="fa  fa-angle-double-right"></i> Next</span>
							<span class="input-group-addon btn btn-primary" data-pager-action='last'>
							<i class="fa  fa-angle-right"></i> Last</span>
						</div>
					*/
				}
				function gotoPage(currNo){
					list(currNo);
				}

				function gotoPage2() {
					var jumpNo = $("#currNoBox").val();
					console.log(jumpNo);
					list(jumpNo);
				}
				</script>
			<!-- mainLogo -->
			<div class="col-xs-1">

				<a href="${pageContext.request.contextPath}/main/index"><img
					src="${pageContext.request.contextPath}/assets/img/nlogo.png"
					style="margin-bottom: 19px; margin-top: 15px; margin-left: 0x;"
					alt="logo.png"></a>

			</div>
		</div>
	</nav>
</div>

<!-- 최초 로그인 폼 끝 -->
<script type="text/javascript">
	$(function() {

		var $formLogin = $('#login-form');
		var $formLost = $('#lost-form');
		var $formRegister = $('#register-form');
		var $divForms = $('#div-forms');
		var $modalAnimateTime = 300;
		var $msgAnimateTime = 150;
		var $msgShowTime = 2000;

		$('#login_register_btn').click(function() {
			modalAnimate($formLogin, $formRegister)
		});
		$('#register_login_btn').click(function() {
			modalAnimate($formRegister, $formLogin);
		});
		$('#login_lost_btn').click(function() {
			modalAnimate($formLogin, $formLost);
		});
		$('#lost_login_btn').click(function() {
			modalAnimate($formLost, $formLogin);
		});
		$('#lost_register_btn').click(function() {
			modalAnimate($formLost, $formRegister);
		});
		$('#register_lost_btn').click(function() {
			modalAnimate($formRegister, $formLost);
		});

		function modalAnimate($oldForm, $newForm) {
			var $oldH = $oldForm.height();
			var $newH = $newForm.height();
			$divForms.css("height", $oldH);
			$oldForm.fadeToggle($modalAnimateTime, function() {
				$divForms.animate({
					height : $newH
				}, $modalAnimateTime, function() {
					$newForm.fadeToggle($modalAnimateTime);
				});
			});
		}

		function msgFade($msgId, $msgText) {
			$msgId.fadeOut($msgAnimateTime, function() {
				$(this).text($msgText).fadeIn($msgAnimateTime);
			});
		}

		function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass,
				$msgText) {
			var $msgOld = $divTag.text();
			msgFade($textTag, $msgText);
			$divTag.addClass($divClass);
			$iconTag.removeClass("glyphicon-chevron-right");
			$iconTag.addClass($iconClass + " " + $divClass);
			setTimeout(function() {
				msgFade($textTag, $msgOld);
				$divTag.removeClass($divClass);
				$iconTag.addClass("glyphicon-chevron-right");
				$iconTag.removeClass($iconClass + " " + $divClass);
			}, $msgShowTime);
		}
	});
</script>

<!-- facebook -->
<script type="text/javascript">
	//3데이타를 받아오는 메소드 
	function getUserData() {
		FB.api(
						'/me',
						{
							fields : 'name,email,id,picture'
						},
						function(response) {
							var facebookvo = {
								name : response.name,
								profile : response.picture.data.url,
								id : response.id
							}
							$.ajax({
										url : "${pageContext.request.contextPath }/user/facebook/add",
										type : "POST",
										contentType : "application/json",
										data : JSON.stringify(facebookvo),
										dataType : "json",
										success : function(authUser) {
											FB.logout(function(response) {
											});
											facebookrender(authUser);
											/* location.reload(); */
											if (authUser.nickname == null) {
												window.location.href = "${pageContext.request.contextPath}/user/userprofile";
											} else {
												location.reload();
											}
										},
										error : function(XHR, status, error) {
											console.error(status + " : "
													+ error);
										}

									});
						});
	}

	function facebookrender(authUser) {

		console.log("render 실행 ");
		var str = "";
		str += " <div id='profile' align='center' ><img src='"+authUser.profile+"'width='100'>";
		str += "		<a id='name' href='${pageContext.request.contextPath }/user/userpage'>"
				+ authUser.name + "님의 프로필입니다.</a>";
		str += "			<a id= 'mypage' href='${pageContext.request.contextPath}/user/userprofile' >내정보 수정 </a>";
		str += "			<a id='logoutbtn' href='${pageContext.request.contextPath}/main/logout' >로그아웃</a>";

		$("#userremove").remove();
		$("#userchange").append(str);
		document.getElementById('logoutbtn').onclick = function() {
			$("#userchange").remove();
			FB.logout(function(response) {
				// Person is now logged out
				console.log("aa")
			});
		}
	}

	//1준비하는 메소드 	        
	window.fbAsyncInit = function() {
		//SDK loaded, initialize it
		FB.init({
			appId : '1903977823198887',
			cookie : true, // enable cookies to allow the server to access
			// the session
			xfbml : true, // parse social plugins on this page
			version : 'v2.10' // use graph api version 2.8
		});

		//2check user session and refresh it 로그인 여부를 확인합니다. 
		FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				//3
				console.log("커넥트되어있음 ");
				getUserData();
			} else {
				//로그인 하지않은 상태면 디스플레이 하지않음 

				console.log("커넥트 되어 있지 않음  ");
				//user is not authorized
			}
		});
	};

	//load the JavaScript SDK
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.com/ko_KR/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	//add event listener to login button

	var fa1 = document.getElementById('loginBtn');
	if (fa1) {
		fa1.addEventListener('click', function() {
			//do the login
			FB.login(function(response) {
				if (response.authResponse) {
					access_token = response.authResponse.accessToken; //get access token
					user_id = response.authResponse.userID; //get FB UID
					first_name = response.first_name; //get FB UID

					console.log('access_token = ' + access_token);
					console.log('user_id = ' + user_id);

					getUserData();
				}
			}, {
				scope : 'email,public_profile',
				return_scopes : true
			});

		}, false);

	}

	/*   카카오톡
	 사용할 앱의 JavaScript 키  */

	Kakao.init('e7164519a5043bff4a23dce18aedf1cf');
	// 카카오 로그인 버튼을 생성합니다.
		   function loginWithKakao() {
		Kakao.Auth.login({
		success : function(authObj) {
			// 로그인 성공시 api호출합니다. 
			access_token = authObj.access_token;
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(resultObj) {
					getUserDataKakao(resultObj);
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
		});
		
		}

	function getUserDataKakao(res) {
		var kakaovo = {
			name : res.properties.nickname,
			profile : res.properties.profile_image,
			id : res.kaccount_email
		}
		$.ajax({
					url : "${pageContext.request.contextPath }/user/kakao/add",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify(kakaovo),
					dataType : "json",
					success : function(authUser) {
						renderkako(authUser);
						if (authUser.nickname == null) {
							Kakao.Auth.logout(function() { console.log("logged out."); });
							location.reload();
							window.location.href = "${pageContext.request.contextPath}/user/userprofile";
						} else {
							Kakao.Auth.logout(function() { console.log("logged out."); });
							location.reload();
						}
					},
					error : function(XHR, status, error) {
					

					}

				});

	}
	function renderkako(authUser) {
		console.log("카카오 렌더 " + authUser);
		var str = "";
		str += " <div id='profile' align='center' ><img src='"+authUser.profile+"'width='100'>";
		str += "		<a id='name' href='${pageContext.request.contextPath }/user/userpage'>"
				+ authUser.name + "님의 프로필입니다.</a>";
		str += "			<a id= 'mypage' href='${pageContext.request.contextPath}/user/userprofile' >내정보 수정 </a>";
		str += "			<a id='logoutbtn' href='${pageContext.request.contextPath}/main/logout' >로그아웃</a>";
		$('#userremove').remove();
		$("#userchange").append(str);

		var ka1 = document.getElementById('logoutbtn');
		if (ka1) {
			Kakao.Auth.logout(function() { console.log("logged out."); });
			ka1.onclick = function() {
				Kakao.Auth.logout(function() { console.log("logged out."); });
			}
		}
	}
</script>




