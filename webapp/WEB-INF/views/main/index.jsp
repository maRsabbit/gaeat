<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>


<link href="${pageContext.request.contextPath}/assets/css/loginform.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico"/>

<title>가릿 - 가려서 먹자</title>

</head>

<body id="page-top">
	
<c:import url="/WEB-INF/views/includes/headNav.jsp"></c:import>	
	
		<!-- 캐러셀 -->
	<div>
		<div id="carousel-generic" class="carousel slide">
		
	         <!--  Indicators -->
	          <ol class="carousel-indicators">
	            <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
	            <li data-target="#carousel-generic" data-slide-to="1"></li>
	            <li data-target="#carousel-generic" data-slide-to="2"></li>
	            <li data-target="#carousel-generic" data-slide-to="3"></li>      
	          </ol>
  
         <!--   캐러셀 items -->
           <div class="carousel-inner">
              <div class="item active"  align="center">
                 <img src="${pageContext.request.contextPath}/assets/img/carousel/food1.jpg" alt="First slide">
              </div>
              <div class="item"  align="center">
              	<video src="${pageContext.request.contextPath}/assets/video/videoex.mp4" autoplay></video>
              </div>
              <div class="item"  align="center">
                 <img src="${pageContext.request.contextPath}/assets/img/carousel/food3.jpg" alt="Third slide">               
              </div>
              <div class="item"  align="center">
                 <img src="${pageContext.request.contextPath}/assets/img/carousel/food4.jpg" alt="Fourth slide">               
              </div>
           </div>
           
         <!--  캐러셀 Controls -->
            <a class="left carousel-control" href="#carousel-generic" data-slide="prev">
               <img src="${pageContext.request.contextPath}/assets/img/carousel/left.png" class="control">
            </a>
            <a class="right carousel-control" href="#carousel-generic" data-slide="next">
              <img src="${pageContext.request.contextPath}/assets/img/carousel/right.png" class="control">
            </a>
        </div>
        
       </div>
        
      
 		 <!-- gallery -->      
		 <div class="work" style = "margin-bottom: 150px">
		  <div class="category-buttons">
		    <a href="#" class="active all" data-group="all">All</a>
		    <a href="#" data-group="city">타이틀은</a>
		    <a href="#" data-group="nature">나중에</a>
		    <a href="#" data-group="food">천천히</a>
		    <a href="#" data-group="sports">바꿔</a>
		    <a href="#" data-group="people">볼게요.</a>
		  </div>
		
		  <div id="grid" class="grid">
		    <a class="card" href="#" data-groups="city,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/1.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="nature,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/2.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="food,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/3.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="sports,people,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/4.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="people,food,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/5.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="city,people,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/6.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="nature,food,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/7.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="food,people,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/8.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="sports,people,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/9.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="people,food">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/10.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="city,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/1.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="nature,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/2.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="food,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/3.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="sports,people,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/4.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="people,food,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/5.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="city,people,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/6.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="nature,food,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/7.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="food,people,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/8.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="sports,people,">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/9.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <a class="card" href="#" data-groups="people,food">
		      <img src="${pageContext.request.contextPath}/assets/img/foodsample/10.jpg" />
		      <div class="title">
      			<h style="font-size:14px;"><Strong>바게트빵을 크림과!!</Strong> </h>
				<h style="font-size:6px; color:green;">by </h>
				<h style="font-size:12px;">Kim Tae Hee </h>
				<p>남는 바게트빵은 이렇게 이용하시면 됩니다! 아주 맛이 있죱</p>	
			  </div>
		    </a>
		    <div class="guide"></div>
		  </div>
		</div>
		
		
			<!-- 사람 캐러젤 -->
			<div class="container-fluid" style="padding-bottom: 100px; padding-top:50px; background-image: url(${pageContext.request.contextPath}/assets/img/trending/carousel_back.png);">
				<div class="row">
                    <div class="col-md-12" data-wow-delay="0.2s">
                        <div class="carousel slide" data-ride="carousel" id="quote-carousel">
                            <!-- Bottom Carousel Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#quote-carousel" data-slide-to="0" class="active"><img class="img-responsive " src="https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg" alt="">
                                </li>
                                <li data-target="#quote-carousel" data-slide-to="1"><img class="img-responsive" src="https://s3.amazonaws.com/uifaces/faces/twitter/rssems/128.jpg" alt="">
                                </li>
                                <li data-target="#quote-carousel" data-slide-to="2"><img class="img-responsive" src="https://s3.amazonaws.com/uifaces/faces/twitter/adellecharles/128.jpg" alt="">
                                </li>
                            </ol>
                            <!-- 슬라이드 -->
                            <div class="carousel-inner text-center">
                                <!-- 사람 1 -->
                                <div class="item active">
                                        <div class="row">
                                            <div class="col-sm-8 col-sm-offset-2">
                                                <h2 style="color: white;">제육볶음 하나만으로 좋아요 1위를 기록한 바로~~</h2>
                                                <br>
                                                <h5 style="color: #6F7C80;"><strong>-여윤철닉-</strong></h5>
                                            </div>
                                        </div>
                                </div>
                                <!-- 사람 2 -->
                                <div class="item">
                                        <div class="row">
                                            <div class="col-sm-8 col-sm-offset-2">
                                                <h2 style="color: white;">소고기 요리의 장인 그는!</h2>
                                                <br>
                                                <h5 style="color: #6F7C80;"><strong>-은지닷-</strong></h5>
                                            </div>
                                        </div>
                                </div>
                                <!-- 사람 3 -->
                                <div class="item">
                                        <div class="row">
                                            <div class="col-sm-8 col-sm-offset-2">
                                                <h2 style="color: white;">채소만을 사용한 인기 채식 쉐프!</h2>
                                                <br>
                                                <h5 style="color: #6F7C80;"><strong>-근섭만세-</strong></h5>
                                            </div>
                                        </div>
                                </div>
                            </div>
                            <!-- 슬라이드 버튼 -->
                            <a data-slide="prev" href="#quote-carousel" class="left carousel-control"><i class="fa fa-chevron-left"></i></a>
                            <a data-slide="next" href="#quote-carousel" class="right carousel-control"><i class="fa fa-chevron-right"></i></a>
                        </div>
                    </div>
                </div>
			</div>
		
		
		<!-- 네가지 긴 사진 -->
        <div class = "container service" style = "margin-top: 50px; padding-bottom: 100px; padding-top: 100px;">
        	<div class = "row">
        		<div class = "col-xs-3">
        			<a>
        				<div class = "trendImage"  align="center">
        					<img class = "icon" src = "${pageContext.request.contextPath}/assets/img/trending/vegetarian.jpg"/>
						</div>
        			</a>
        		</div>
        		<div class = "col-xs-3">
        			<a>
        				<div class = "trendImage"  align="center">
        					<img class = "icon" src = "${pageContext.request.contextPath}/assets/img/trending/allergy.jpg"/>
						</div>
        			</a>
        		</div>
        		<div class = "col-xs-3">
        			<a>
        				<div class = "trendImage"  align="center">
        					<img class = "icon" src = "${pageContext.request.contextPath}/assets/img/trending/muslim.png"/>
						</div>
        			</a>
        		</div>
        		<div class = "col-xs-3 trendBlock">
        			<a>
        				<div class = "trendImage"  align="center">
        					<img class = "icon" src = "${pageContext.request.contextPath}/assets/img/trending/people.jpg"/>
						</div>
        			</a>
        		</div>
        	</div>
        	
        	
        	
			<div class="container-fluid" style="margin-top: 20px;">
			    <div class="row">
			    	<div class = "trendText" align="center" >
						<h4>채식주의자도, 알레르기가 있는 사람도, 특정 종교인 모두</h4>
		           		<h2>가려 먹습니다.</h2>
					</div>
			    </div>
				<!-- row requires "row-divided" class -->
				<div class="row row-divided" style="margin-top: 30px;">
					<div class="col-xs-6 column-one">
						<h2 style="text-align: center; padding-top: 60px;"></h2>
					</div>
					<div class="vertical-divider"></div>
					<div class="col-xs-6 column-two">
						<h5 style="line-height: 30px; padding-left: 30px; padding-top: 40px;">
							대한민국 사회에서는 편식하지 않는 것이 미덕이라고 여겨져 왔습니다.
							하지만 개인의 기호는 존중받아야 할 필요가 있습니다.
							이 뿐만 아니라 신체적으로나 심리적으로 가리게 되는 재료가 있는 사람들게게 편의를 제공합니다.
						</h5>
					</div>
				</div>
				<!--second-->
				<div class="row row-divided" style="margin-top: 40px;">
					<div class="col-xs-6 column-one">
						<h5 style="line-height: 30px; padding-left: 10px; padding-top: 40px;">
							한국채식연합의 통계에 따르면 국내 채식인구는 약 2%에 이르렀고 
							채식 위주로 식사를 하는 인구는 20-30%가 된다고 합니다. 
						</h5>
					</div>
					<div class="vertical-divider"></div>
					<div class="col-xs-6 column-two">
						<h2 style="text-align: center; padding-top: 60px;"></h2>
					</div>
				</div>
			    <!--second end-->
				<!--333333-->
				<div class="row row-divided" style="margin-top: 40px;" >
					<div class="col-xs-6 column-one">
					<h2 style="text-align: center; padding-top: 60px;"></h2></div>
					<div class="vertical-divider"></div>
					<div class="col-xs-6 column-two">
						<h5 style="line-height: 30px; padding-left: 30px; padding-top: 40px;">
							전국민의 5~10%는 식품과 관련된 알레르기 증상을 경험하였다고 합니다.
							이들이 고르는 레시피에는 그들이 못 먹는 재료가 가려져야 합니다.
						</h5>
					</div>
				</div>
				<!--333-->
				<!--44-->
				<div class="row row-divided"  style="margin-top: 40px;">
					<div class="col-xs-6 column-one">
						<h5 style="line-height: 30px; padding-left: 10px; padding-top: 40px;">
							이미 국내에는 14만 명 이상의 무슬림들이 살고 있습니다.
							무슬림과 같이 종교적인 특성으로 인해 재료를 가려야 하는 이들에게 편의를 제공합니다.
						</h5>
					</div>
					<div class="vertical-divider"></div>
					<div class="col-xs-6 column-two">
						<h2 style="text-align: center; padding-top: 60px;"></h2>
					</div>
				</div>
				<!--44-->
				<div class="row row-divided" style="margin-top: 30px;">
					<div class="col-xs-6 column-one">
						<h2 style="text-align: center; padding-top: 60px;"></h2>
					</div>
					<div class="vertical-divider"></div>
					<div class="col-xs-6 column-two">
						<h5 style="line-height: 30px; padding-left: 30px; padding-top: 40px;">
							<br><br><br>
						</h5>
					</div>
				</div>
			</div>
		</div>



       <c:import url="/WEB-INF/views/main/gallery.jsp"></c:import>	
       
       <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>	
       
</body>
	
</html>