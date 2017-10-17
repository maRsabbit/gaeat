<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>가릿 - 가려서 먹자</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css, bootstrap, js 적용 -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/list.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://dl.dropboxusercontent.com/u/86701580/mypersonalcdn/renda/renda-icon-font.css">
<!--  -->
<link href="${pageContext.request.contextPath}/assets/css/dropdown.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript">
	$(window).resize(function() {
		if ($(window).width() <= 600) {
			$('#prop-type-group').removeClass('btn-group');
			$('#prop-type-group').addClass('btn-group-vertical');
		} else {
			$('#prop-type-group').addClass('btn-group');
			$('#prop-type-group').removeClass('btn-group-vertical');
		}
	});
</script>

</head>

<body>
	<c:import url="/WEB-INF/views/includes/headNav.jsp"></c:import>
	<!-- 체크박스 -->
	<br>
	<div class="fluid-container">
		<div style="padding: 10px;">
			<form action="">
				<div class="container">
					<div class="form-group col-md-3">
						<label for="Select">종류별</label> <select class="form-control"
							id="byType">
							<option value='종류별' selected="selected">종류별</option>
							<option value='밑반찬'>밑반찬</option>
							<option value='메인반찬'>메인반찬</option>
							<option value='국/탕'>국/탕</option>
							<option value='찌개'>찌개</option>
							<option value='디저트'>디저트</option>
							<option value='면/만두'>면/만두</option>
							<option value='밥/죽/국'>밥/죽/국</option>
							<option value='퓨전'>퓨전</option>
							<option value='김치'>김치</option>
							<option value='양념/소스/젬'>양념/소스/젬</option>
							<option value='양식'>양식</option>
							<option value='샐러드'>샐러드</option>
							<option value='스프'>스프</option>
							<option value='빵'>빵</option>
							<option value='과자'>과자</option>
							<option value='차/음료/술'>차/음료/술</option>
							<option value='기타'>기타</option>
						</select>
					</div>
					<div class="form-horizontal col-md-3">
						<label for="Select">방법별</label> <select class="form-control"
							id="byMethod">
							<option value='방법별' selected="selected">방법별</option>
							<option value='볶음'>볶음</option>
							<option value='끓이기'>끓이기</option>
							<option value='부침'>부침</option>
							<option value='조림'>조림</option>
							<option value='무침'>무침</option>
							<option value='비빔'>비빔</option>
							<option value='찜'>찜</option>
							<option value='절임'>절임</option>
							<option value='튀김'>튀김</option>
							<option value='삶기'>삶기</option>
							<option value='굽기'>굽기</option>
							<option value='데치기'>데치기</option>
							<option value='>회'>회</option>
							<option value='기타'>기타</option>
						</select>
					</div>

					<div class="form-group col-md-3">
						<label for="Select">난이도</label> <select class="form-control"
							id="byLevel">
							<option value='난이도' selected="selected">난이도</option>
							<option value='아무나'>아무나</option>
							<option value='초급'>초급</option>
							<option value='중급'>중급</option>
							<option value='고급'>고급</option>
							<option value='신의 경지'>신의 경지</option>
						</select>
					</div>
					<div class="form-horizontal col-md-3">
						<label for="Select">조리시간</label> <select class="form-control"
							id="byTime">
							<option value='조리시간' selected="selected">조리시간</option>
							<option value='5분'>5분이내</option>
							<option value='10분'>10분이내</option>
							<option value='15분'>15분이내</option>
							<option value='30분'>30분이내</option>
							<option value='60분'>60분이내</option>
							<option value='90분'>90분이내</option>
							<option value='2시간'>2시간이내</option>
							<option value='그  이상'>2시간이상</option>
						</select>
					</div>
				</div>
			</form>
		</div>
	</div>
	<hr style="border: solid 1px #528540;">
	<form>
		<div class="radio">
			<div class="container">
				<div class="btn-group" data-toggle="buttons" id="orderbtn">


					<label class="btn btn-primary active"> <input type="radio"
						name="orderby" id="orderby1" value="요리명" checked>요리명
					</label> <label class="btn btn-primary"> <input type="radio"
						name="orderby" id="orderby2" value="제목순"> 제목순
					</label> <label class="btn btn-primary"> <input type="radio"
						name="orderby" id="orderby3" value="인기순"> 인기순
					</label> <label class="btn btn-primary"> <input type="radio"
						name="orderby" id="orderby4" value="작성자순"> 작성자순
					</label> <label class="btn btn-primary"> <input type="radio"
						name="orderby" id="orderby5" value="최신순"> 최신순
					</label>
				</div>
			</div>
		</div>
	</form>
	<br>
	<br>
	<!-- 갤러리 -->
	<div class="container">
		<div class="row" id="recipeList"></div>
	</div>
	<div class="container-fluid">
		<div class="row  jjPager">
			<div class="row  jPager" id="pagination"></div>
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

	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

<style>
.txt_post {
	display: -webkit-box;
	display: -ms-flexbox;
	display: box;
	margin-top: 1px;
	max-height: 80px;
	overflow: hidden;
	vertical-align: top;
	text-overflow: ellipsis;
	word-break: break-all;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3
}

.jjPager {
	margin-top: 50px;
	height: 100;
	width: 100%;
	text-align:center; 
}

.jPager {
	position: relative;
	width: 50%;
	height: 50%;
	display:inline-block; 
	padding-left: 220px;
}

.pageNumT {
	margin-left:20px;
	width: 30px;
	text-align: center;
	padding-right: 10px;
	padding-left: 10px;
}

.pageNumL {
	text-align: center;
	padding-right: 10px;
	padding-left: 10px;
}

.jumpBtn {
	background-color: ivory;
	margin: 15px;
	padding-left: 10px;
	padding-right: 10px;
	border-radius: 5px;
	border:0.5px solid;
}

.jumpBtn2 {
	background-color: ivory;
	margin-right: 5px;
	width: 40px;
	border-radius: 40px;
	border:0.5px solid;
}
</style>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		//var type, method, level, time;
		var kvo = new Object();
		kvo.type = $("#byType option:selected").text();
		kvo.method = $("#byMethod option:selected").text();
		kvo.level = $("#byLevel option:selected").text();
		kvo.time = $("#byTime option:selected").text();
		kvo.currNo = 0;
		kvo.orderOption = $(':radio[name=orderby]:checked').val();
		list(kvo.currNo);
		//console.log(kvo);
		$("#byType").change(function() {
			kvo.type = $(this).children("option:selected").text();
			console.log(kvo.type);
			list(1);
		});
		$("#byMethod").change(function() {
			kvo.method = $(this).children("option:selected").text();
			console.log(kvo.method);
			list(1);
		});
		$("#byLevel").change(function() {
			kvo.level = $(this).children("option:selected").text();
			console.log(kvo.level);
			list(1);
		});
		$("#byTime").change(function() {
			kvo.time = $(this).children("option:selected").text();
			console.log(kvo.time);
			list(1);
		});
		$("#orderbtn label").on("click", function() {
			kvo.orderOption = $(this).children().val();
			console.log(kvo.orderOption);
			list(1);
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
		if (curr == 0) {
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
				//console.log(kvo.currNo);
				console.log(recipeList);
				//var length = recipeList.length;
				//console.log("recipeList.length의 길이는 "+length);
				var page = calculate(kvo.currNo, recipeList.length);
				console.log(page);
				for (var i = page.rowStart; i <= page.rowEnd; i++) {
					render(recipeList[i - 1]);
				}
				drawPaging(page);
				$("body").scrollTop(0);
				/*
				for (var i = 0; i < recipeList.length; i++) {
					render(recipeList[i]);
				}*/
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});

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
		if (rowEnd >= totalCnt) {
			rowEnd = totalCnt;
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

	function render(recipeVo) {
		var str = "";
		str += "<div class=\"col-md-4\">";
		str += "<div class=\"single-blog-item\">";
		str += "<div class=\"blog-thumnail\"style=\" height: 220px; overflow: hidden\">";
		str += "<a href=\"${pageContext.request.contextPath }/read/readform?recipe_no="
				+ recipeVo.recipe_no + "\">";
		if (recipeVo.food_img == "이미지 없음") {
			str += "<img src=\"${pageContext.request.contextPath}/assets/img/2.jpg\" alt=\"blog-img\" style=\"width: auto; height: auto;\"></a>";
		} else {
			str += "<img src=\""+recipeVo.food_img+"\" alt=\"blog-img\" style=\"width: auto; height: auto;\"></a>";
		}
		str += "</div>";
		str += "<div class=\"blog-content\">";
		str += "<h4>";
		str += "<a href=\"#\">" + recipeVo.recipe_title + "</a>";
		str += "<a href=\"#\" style=\"font-size:11px; color:black;\">   by  "
				+ recipeVo.nickname + "</a>";
		str += "</h4>";
		str += "<div class = 'target'>";
		str += "<p>" + recipeVo.introduction + "</p>";
		str += "</div>";
		//str += "<a href='${pageContext.request.contextPath }/read/readform?recipe_no="+recipeVo.recipe_no+" ' class=\"more-btn\">View More</a>";
		str += "</div>";
		str += "<span class=\"blog-date\">좋아요 " + recipeVo.like_count
				+ "</span>";
		str += "</div>";
		str += "</div>";

		$("#recipeList").append(str);
	}

	function drawPaging(page) {
		var str = "";
		str += "<div class=\"input-group   col-lg-6  col-md-6  col-sm-6 col-xs-12\">";
		if (page.page == 1) { //련재페이지가 1이면 표시하지 않는다.
			str += "<input class=\"jumpBtn2\"  type=\"button\" value=\"<<\" style=\"display: none;\">";
			str += "<input class=\"jumpBtn2\"  type=\"button\" value=\"<\"  style=\"display: none;\">";
		} else {
			str += "<input class=\"jumpBtn2\"  type=\"button\" value=\"<<\" onClick=\"gotoPage(1)\">";
			str += "<input class=\"jumpBtn2\"  type=\"button\" value=\"<\" onClick=\"gotoPage("
					+ page.prevPage + ")\">";
		}
		str += "<input type=\"text\" id=\"currNoBox\" value="+page.page+" class=\"pageNumT\" >";
		str += "<label class=\"pageNumL\" > / " + page.totPage + "</label>";
		str += "<input  class=\"jumpBtn\" type=\"button\" value=\"이동\" onClick=\"gotoPage2()\">";
		if (page.page == page.totPage) {
			str += "<input class=\"jumpBtn2\"  type=\"button\" value=\">\" style=\"display: none;\" >";
			str += "<input class=\"jumpBtn2\"  type=\"button\" value=\">>\" style=\"display: none;\" >";
		} else {
			str += "<input class=\"jumpBtn2\"  type=\"button\" value=\">\" onClick=\"gotoPage("
					+ page.nextPage + ")\">";
			str += "<input class=\"jumpBtn2\"  type=\"button\" value=\">>\" onClick=\"gotoPage("
					+ page.totPage + ")\">";
		}
		str += "</div>";
		$("#pagination").append(str);
	}
	function gotoPage(currNo) {
		list(currNo);
	}

	function gotoPage2() {
		var jumpNo = $("#currNoBox").val();
		console.log(jumpNo);
		list(jumpNo);
	}
</script>

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
</html>
