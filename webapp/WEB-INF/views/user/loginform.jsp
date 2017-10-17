<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<link href="${pageContext.request.contextPath}/assets/css/loginform.css" rel="stylesheet" type="text/css">
<!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
<title>Modal Login with jQuery Effects - Bootsnipp.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
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
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>


	<!-- 로그인 버튼 -->
	<div class="container">
		<div class="row">
			<p class="text-center">
				<a href="#" class="btn btn-primary btn-sm" role="button"
					data-toggle="modal" data-target="#login-modal">로그인</a>
			</p>
		</div>
	</div>
	<!-- 로그인 버튼 긑 -->



	<!-- 최초 로그인 폼 -->
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
				</div>

				<!-- Begin # DIV Form -->
				<div id="div-forms">

					<!-- Begin # Login Form -->
					<form id="login-form">
						<div class="modal-body">
							<div id="div-login-msg">
								<div id="icon-login-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-login-msg">이메일과 비밀번호를 입력하세요.</span>
							</div>
							<input id="login_username" class="form-control" type="text"
								placeholder="E-mail" required> <input
								id="login_password" class="form-control" type="password"
								placeholder="Password" required>
							<div class="checkbox">
								<label> <input type="checkbox"> 내 입력내용 기억
								</label>
							</div>
						</div>
						<div class="modal-footer">
							<div>
								<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
								<input class="btn btn-lg btn-facebook btn-block" type="submit" value="facebook으로 로그인 하기"> 
								<input class="btn btn-lg btn-facebook3 btn-block" type="submit"	value="NAVER으로 로그인 하기">
							</div>
							<div>
								<button id="login_lost_btn" type="button" class="btn btn-link">비밀번호찾기</button>
								<button id="login_register_btn" type="button" class="btn btn-link">회원가입</button>
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
								<button type="submit" class="btn btn-primary btn-lg btn-block">찾기</button>
							</div>
							<div>
								<button id="lost_login_btn" type="button" class="btn btn-link">로그인</button>
								<button id="lost_register_btn" type="button"
									class="btn btn-link">회원가입</button>
							</div>
						</div>
					</form>
					<!-- 비밀번호 찾기 긑 -->

					<!-- Begin | Register Form -->
					<form id="register-form" style="display: none;">
						<div class="modal-body">
							<div id="div-register-msg">
								<div id="icon-register-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-register-msg">이메일을 등록하세요.</span>
							</div>
							<input id="register_username" class="form-control" type="text"
								placeholder="Username (type ERROR for error effect)" required>
							<input id="register_email" class="form-control" type="text"
								placeholder="E-Mail" required> <input
								id="register_password" class="form-control" type="password"
								placeholder="Password" required>
						</div>
						<div class="modal-footer">
							<div>
								<button type="submit" class="btn btn-primary btn-lg btn-block">회원가입</button>
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
	<script type="text/javascript">
		

		$(function() {

			var $formLogin = $('#login-form');
			var $formLost = $('#lost-form');
			var $formRegister = $('#register-form');
			var $divForms = $('#div-forms');
			var $modalAnimateTime = 300;
			var $msgAnimateTime = 150;
			var $msgShowTime = 2000;

			$("form").submit(
					function() {
						switch (this.id) {
						case "login-form":
							var $lg_username = $('#login_username').val();
							var $lg_password = $('#login_password').val();
							if ($lg_username == "ERROR") {
								msgChange($('#div-login-msg'),
										$('#icon-login-msg'),
										$('#text-login-msg'), "error",
										"glyphicon-remove", "Login error");
							} else {
								msgChange($('#div-login-msg'),
										$('#icon-login-msg'),
										$('#text-login-msg'), "success",
										"glyphicon-ok", "Login OK");
							}
							return false;
							break;
						case "lost-form":
							var $ls_email = $('#lost_email').val();
							if ($ls_email == "ERROR") {
								msgChange($('#div-lost-msg'),
										$('#icon-lost-msg'),
										$('#text-lost-msg'), "error",
										"glyphicon-remove", "Send error");
							} else {
								msgChange($('#div-lost-msg'),
										$('#icon-lost-msg'),
										$('#text-lost-msg'), "success",
										"glyphicon-ok", "Send OK");
							}
							return false;
							break;
						case "register-form":
							var $rg_username = $('#register_username').val();
							var $rg_email = $('#register_email').val();
							var $rg_password = $('#register_password').val();
							if ($rg_username == "ERROR") {
								msgChange($('#div-register-msg'),
										$('#icon-register-msg'),
										$('#text-register-msg'), "error",
										"glyphicon-remove", "Register error");
							} else {
								msgChange($('#div-register-msg'),
										$('#icon-register-msg'),
										$('#text-register-msg'), "success",
										"glyphicon-ok", "Register OK");
							}
							return false;
							break;
						default:
							return false;
						}
						return false;
					});

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

			function msgChange($divTag, $iconTag, $textTag, $divClass,
					$iconClass, $msgText) {
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
</body>
</html>