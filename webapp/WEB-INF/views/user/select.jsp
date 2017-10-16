<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico"/>
<title>가릿 - 가려서 먹자</title>
<meta name="viewport" content="width=device-width, initial-scale=1">



	<c:import url="/WEB-INF/views/includes/headNav.jsp"></c:import>

    
<style type="text/css">
	@import url("http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css");

.panel-pricing {
  -moz-transition: all .3s ease;
  -o-transition: all .3s ease;
  -webkit-transition: all .3s ease;
}
.panel-pricing:hover {
  box-shadow: 0px 0px 30px rgba(0, 0, 0, 0.2);
}
.panel-pricing .panel-heading {
  padding: 20px 10px;
}
.panel-pricing .panel-heading .fa {
  margin-top: 10px;
  font-size: 58px;
}
.panel-pricing .list-group-item {
  color: #777777;
  border-bottom: 1px solid rgba(250, 250, 250, 0.5);
}
.panel-pricing .list-group-item:last-child {
  border-bottom-right-radius: 0px;
  border-bottom-left-radius: 0px;
}
.panel-pricing .list-group-item:first-child {
  border-top-right-radius: 0px;
  border-top-left-radius: 0px;
}
.panel-pricing .panel-body {
  background-color: #f0f0f0;
  font-size: 40px;
  color: #777777;
  padding: 20px;
  margin: 0px;
}
</style>
    
</head>
<body>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
    
    <!-- Plans -->
    <section id="plans">
        <div class="container">
            <div class="row">
            
            <!-- item -->
                <div class="col-md-4 text-center">
                    <div class="panel panel-success panel-pricing">
                        <div class="panel-heading">
                            <i class="fa fa-desktop"></i>
                            <h3>채식주의자입니다.</h3>
                        </div>
                        <div class="panel-body text-center">
                            <p><strong>그림?</strong></p>
                        </div>
                        <ul class="list-group text-center">
                            <li class="list-group-item"><i class="fa fa-check"></i> Personal use</li>
                            <li class="list-group-item"><i class="fa fa-check"></i> Unlimited projects</li>
                            <li class="list-group-item"><i class="fa fa-check"></i> 27/7 support</li>
                        </ul>
                        <div class="panel-footer">
                            <a class="btn btn-lg btn-block btn-success" href="#">채식단계 선택하기</a>
                        </div>
                    </div>
                </div>
                <!-- /item -->

                <!-- item -->
                <div class="col-md-4 text-center">
                    <div class="panel panel-danger panel-pricing">
                        <div class="panel-heading">
                            <i class="fa fa-desktop"></i>
                            <h3>알러지가 있어요.</h3>
                        </div>
                        <div class="panel-body text-center">
                            <p><strong>그림?</strong></p>
                        </div>
                        <ul class="list-group text-center">
                            <li class="list-group-item"><i class="fa fa-check"></i> Personal use</li>
                            <li class="list-group-item"><i class="fa fa-check"></i> Unlimited projects</li>
                            <li class="list-group-item"><i class="fa fa-check"></i> 27/7 support</li>
                        </ul>
                        <div class="panel-footer">
                            <a class="btn btn-lg btn-block btn-danger" href="#">알러지 식재료 선택하기</a>
                        </div>
                    </div>
                </div>
                <!-- /item -->

                <!-- item -->
                <div class="col-md-4 text-center">
                    <div class="panel panel-warning panel-pricing">
                        <div class="panel-heading">
                            <i class="fa fa-desktop"></i>
                            <h3>그냥 좀 가립니다.</h3>
                        </div>
                        <div class="panel-body text-center">
                            <p><strong>그림?</strong></p>
                        </div>
                        <ul class="list-group text-center">
                            <li class="list-group-item"><i class="fa fa-check"></i> Personal use</li>
                            <li class="list-group-item"><i class="fa fa-check"></i> Unlimited projects</li>
                            <li class="list-group-item"><i class="fa fa-check"></i> 27/7 support</li>
                        </ul>
                        <div class="panel-footer">
                            <a class="btn btn-lg btn-block btn-warning" href="#">비선호 재료 선택하기</a>
                        </div>
                    </div>
                </div>
                <!-- /item -->

            </div>
        </div>
    </section>
    <!-- /Plans -->
    
    <br/><br/><br/><br/><br/><br/>
    
<script type="text/javascript"></script>
	
	
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
</body>