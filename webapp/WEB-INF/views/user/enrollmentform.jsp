<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>가려서 먹자! 가릿</title>


<link href="${pageContext.request.contextPath}/assets/jqueryui/jquery-ui.min.css"  rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/jqueryui/jquery.js"></script>
<script type = "text/javascript" src = "${pageContext.request.contextPath}/assets/jqueryui/jquery-ui.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script> --%>
<link href="${pageContext.request.contextPath}/assets/css/enrollform.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico"/>
</head>

<body>

    <c:import url="/WEB-INF/views/includes/headNav.jsp"></c:import>
   
   
   <div class="container" style = "/* border: solid 0.5px #D0F5A9; */ background-color:#E6F8E0; margin-top:100px; margin-bottom:100px; padding-bottom:30px;" >
   
   
      <h2 style = "margin-top:50px; margin-left:30px">레시피 등록하기</h2>
   
      <br>
      <hr style = "border: solid 0.5px #528540">
   		<div class="form-horizontal" role="form">   
      <div class="col-sm-8" style = "margin-top:20px">
         <div class="form-group">
            <label for="title" class="col-sm-2 control-label">레시피 제목</label>
            <div class="col-sm-10">
               <input type="text" class="form-control" id="recipeTitle"
                  placeholder="레시피의 제목을 알려주세요 EX) 아플 때 기운이 나는 전복죽 레시피">
            </div>
         </div>
         <div class="form-group">
            <label for="foodName" class="col-sm-2 control-label">요리명</label>
            <div class="col-sm-10">
               <input type="text" class="form-control" id="foodTitle"
                  placeholder="요리명을 입력해주세요 EX) 파멸의 해장국">
            </div>
         </div>
         <div class="form-group">
            <label for="title" class="col-sm-2 control-label">요리 소개</label>
            <div class="col-sm-10">
               <textarea type="text" class="form-control" id="introduction" style = "resize: none;" placeholder="요리를 간단하게 설명해주세요 EX) 가볍게 구운 검은깨 두부에 매운 파무침을 얹어 만든 고소하고 매콤한 두부 요리 "></textarea>
            </div>
         </div>
         
<style>
.btn-select {
    position: relative;
    padding: 0;
    min-width: 236px;
    width: 100%;
    border-radius: 0;
    margin-bottom: 20px;
}

.btn-select .btn-select-value {
    padding: 6px 12px;
    display: block;
    position: absolute;
    left: 0;
    right: 34px;
    text-align: left;
    text-overflow: ellipsis;
    overflow: hidden;
    border-top: none !important;
    border-bottom: none !important;
    border-left: none !important;
}

.btn-select .btn-select-arrow {
    float: right;
    line-height: 20px;
    padding: 6px 10px;
    top: 0;
}

.btn-select ul {
    display: none;
    background-color: white;
    color: black;
    clear: both;
    list-style: none;
    padding: 0;
    margin: 0;
    border-top: none !important;
    position: absolute;
    left: -1px;
    right: -1px;
    top: 33px;
    z-index: 999;
}

.btn-select ul li {
    padding: 3px 6px;
    text-align: left;
}

.btn-select ul li:hover {
    background-color: #f4f4f4;
}

.btn-select ul li.selected {
    color: white;
}

/* info Start */
.btn-select.btn-info:hover, .btn-select.btn-info:active, .btn-select.btn-info.active {
    border-color: #46b8da;
}

.btn-select.btn-info ul li.selected {
    background-color: #46b8da;
    color: white;
}

.btn-select.btn-info ul {
    border: #46b8da 1px solid;
}

.btn-select.btn-info .btn-select-value {
    background-color: #5bc0de;
    border: #46b8da 1px solid;
}

/* info End */

}
         
</style>
        <div class="form-group">
         	<label for="title" class ="col-sm-2 control-label">레시피북</label>
         	<div class="col-sm-5">
			   <a class="btn btn-info btn-select">
			   		<input type = "hidden" class = "btn-select-input" id = "" name = "" value = ""/>
			   		<span class = "btn-select-value">레시피북을 선택하세요</span>
			   		<span class = 'btn-select-arrow glyphicon glyphicon-chevron-down'></span>
			   		<ul>
			   			<c:forEach items = "${rbList}" var="vo">
							<li>${vo.recipebookName}</li>
						</c:forEach>
			   		</ul>
			   </a>
          </div>
        </div>
      </div>
      
      
<!--  사진 첨부를 위한 제이쿼리 메소드  -->
 <script>
 
function broseMainFile(){

 	$(".main_photo").click();
    
    $(".main_photo").on("change",handleImageFile);
    
    function handleImageFile(e){
    	
    	var files = e.target.files;
    	var filesArr = Array.prototype.slice.call(files);
    
    	filesArr.forEach(function(f){
    		if(!f.type.match("image.*")){
    			alert("확장자는 이미지 확장자만 가능합니다.");
    			return;
    		}
    		
    		sel_file = f;
    		
    		var reader = new FileReader();
    	 	reader.onload = function(e) {
    	 		
    	 		$(".main_image").attr("src",e.target.result);
    	 		
 	  	 	return false;
    	 			
    	 	}
    	 	reader.readAsDataURL(f);
    	});
    	
    }

};

</script>

	
       <div class="form-group">
	       <div class = "col-sm-4">
	       <form id = "send_main_image" enctype= "multipart/form-data" action = "${pageContext.request.contextPath}/enrollform/enrollPhoto" method="post">
				 <input type="file" id ="main_photo" class="main_photo" name = "file" style = "display:none;"/>
		         <img class = "main_image" src = "${pageContext.request.contextPath}/assets/img/uploadspace.gif" onclick="broseMainFile();" style = "margin-left:50px; width:300px; height:300px; cursor:pointer;"/>
			</form>
	       </div>
        </div>

         <hr style = "border: solid 0.5px #528540; margin-bottom: 50px;">
         
         <div class="form-group">
            <label for="category" class="col-sm-2 control-label">세부사항</label>
         <div class = "col-sm-3" style = "floar:left;"> 
               <select
                  class="form-control foodGenre" name="종류별">
                  <option value="">종류별</option>
                  <option value="밑반찬">밑반찬</option>
                  <option value="메인반찬">메인반찬</option>
                  <option value="국/탕">국/탕</option>
                  <option value="찌개">찌개</option>
                  <option value="디저트">디저트</option>
                  <option value="면/만두">면/만두</option>
                  <option value="밥/죽/떡">밥/죽/떡</option>
                  <option value="퓨전">퓨전</option>
                  <option value="김치/젓갈/장류">김치/젓갈/장류</option>
                  <option value="양념/소스/잼">양념/소스/잼</option>
                  <option value="양식">양식</option>
                  <option value="샐러드">샐러드</option>
                  <option value="스프">스프</option>
                  <option value="빵">빵</option>
                  <option value="과자">과자</option>
                  <option value="차/음료/술">차/음료/술</option>
                  <option value="기타">기타</option>
               </select> 
            </div>
            <div class = "col-sm-3 howtocook" style = "float:left">
               <select class = "form-control howTo" name="방법별">
                  <option value="">방법별</option>
                  <option value="볶음">볶음</option>
                  <option value="끓이기">끓이기</option>
                  <option value="부침">부침</option>
                  <option value="조림">조림</option>
                  <option value="무침">무침</option>
                  <option value="비빔">비빔</option>
                  <option value="찜">찜</option>
                  <option value="절임">절임</option>
                  <option value="튀김">튀김</option>
                  <option value="삶기">삶기</option>
                  <option value="굽기">굽기</option>
                  <option value="데치기">데치기</option>
                  <option value="회">회</option>
                  <option value="기타">기타</option>
               </select>
            </div>
         </div>
         <div class="form-group">
           <label for="category" class="control-label col-sm-2" style = "float:left">카테고리</label>
            <div class = "col-sm-3" style = "float:left">
               <select name="인원 " class="form-control howMany">
                  <option value="">인원</option>
                  <option value="1인분">1인분</option>
                  <option value="2인분">2인분</option>
                  <option value="3인분">3인분</option>
                  <option value="4인분">4인분</option>
                  <option value="5인분">5인분</option>
                  <option value="6인분이상">6인분이상</option>
               </select>
            </div>
            <div class = "col-sm-3" style = "float:left">
                <select name="시간" class="cookingTime form-control">
                  <option value="">시간</option>
                  <option value="5분이내">5분이내</option>
                  <option value="10분이내">10분이내</option>
                  <option value="15분이내">15분이내</option>
                  <option value="30분이내">30분이내</option>
                  <option value="60분이내">60분이내</option>
                  <option value="90분이내">90분이내</option>
                  <option value="2시간이내">2시간이내</option>
                  <option value="2시간이상">2시간이상</option>
               </select> 
            </div>
            <div class = "col-sm-3" style = "float:left">
               <select name="난이도" class="cookingLevel form-control">
                  <option value="">난이도</option>
                  <option value="아무나">아무나</option>
                  <option value="초급">초급</option>
                  <option value="중급">중급</option>
                  <option value=">고급">고급</option>
                  <option value="신의 경지">신의 경지</option>
               </select>
            </div>
         </div>
         

         <!-- 재료와 양 입력 -->
         <div class="form-group ingreDiv_1">
               <label for="title" class="col-sm-2 control-label"  style = "float:left">재료</label>
            
            <div class = "foodInfo" style = "margin-bottom:10px;">
               <div class = "col-sm-3">
                  <input type="text" class="form-control" name = "ingre_1" style = "margin-right:20px; float:left" placeholder="재료를 적어주세요" value = "">
               </div>
               <div class = "col-sm-3">
                  <input type="text" class="form-control" name = "amount_1" style = "margin-right:20px; float:left" placeholder = "수량을 적어주세요" value = "" >
               </div>
            <div class="btn-group col-sm-3" style = "float:left;">
               <button class="btn addIngre" name = "ingreDiv_1">재료추가</button> 
            </div>
           </div>
            
         </div>
         
         <hr style = "border: solid 0.5px #528540; margin-top:50px;">
         
<script>


    
</script>
<!--  사진 첨부를 위한 제이쿼리 메소드  -->
         <%-- <img class = "emptyImage" src = "${pageContext.request.contextPath}/assets/img/uploadspace.gif" onclick="broseMainFile();" style = "margin-left:50px; width:300px; height:300px; cursor:pointer;"/> --%>
	            <div class="div_1 form-group"
					style="float: left; width: 1099px; margin-top: 10px; margin-bottom: 30px;">
						<label class="col-sm-2 order_1" name="order_1"
							style="margin-left: 60x; border-right: 0.5px solid green; color: #528540; margin-top: 20px; font-weight: bold; font-size: 30px;">
							1 단계 
						</label>
						<div class="promo-flex col-sm-8"
							style="margin-top: 10px; margin-bottom: 10px;">
		
							<div data-ix="blog-card" class="promo-card" style="float: left">
								<img class="orderEmptyImage" name="div_1"
									src="${pageContext.request.contextPath}/assets/img/photobox.png"
									style="cursor: pointer; width: 100%"> <input id="order_1"
									type="file" class="order_photo" name="div_1"
									style="display: none;" />
							</div>
							<div class="blog-description" style="width: 320px; height: 350px; float: left;">
								<textarea class="textContent_1"
									style="width: 100%; height: 100%; border-color: white; resize: none; border-top-right-radius: 10px; border-bottom-right-radius: 10px; font-size:15px;"
									value="";></textarea>
							</div>
		
						</div>

						<div class="btn-group col-sm-2" style="padding-right: 6px; padding-top: 15px;">
							<button class="orderAddBtn btn btn-success addOrder" name="div_1" style="border: 0; border-radius: 10px">단계 추가</button>
							<input id="div_1" type="text" name="order_1" value="1" style="display: none;" />
							<button class="orderRemoveBtn btn btn-danger addOrder" name="div_1" style="float: bottom; border: 0; border-radius: 10px; margin-top: 10px">단계 제거</button>
						</div>
				</div>


		<style>
		 .tagInsert {
		 	
		 	float:left;
		 
		 }
		</style>
		
		<div class="form-group" style = "margin-left:10px">    
            <div class="col-sm-offset-2 col-sm-7" style = "margin-bottom:20px;">
	               <label for="title" style = "font-size:20px">태그를 작성해주세요</label><br>
	               <ul style = "list-style:none; margin:0px; padding:0px; border: 1px solid #a1a1a1;
	               				padding: 1px 5px; overflow: auto; background:white;">
	               	 <li class = "tagInsert tagInsert_1" style = " display: block; float: left;  margin: 2px 5px 2px 0;">
	               	 	<input class = "tagInsertInput" type = "text" style = "border:0px;  outline: none;">
	               	</li>
	               </ul>
            </div>
            <div class="col-sm-3" style="float:right; margin-left:30px;">
               <button id ="form-deliver" type="submit" class="btn btn-primary">레시피 작성 완료</button>
            </div>
        </div>
        </div>
   </div>
   
   <input id = "userNo" type ="hidden" value = "${chef_no}" style = "display:none">

  
   <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

</body>
<script>
//재료와 요리 순서에 새로운 div를 붙이기 위해 만든 전역변수
var ingreNo = 1; 
var divNo = 1; 
var tagNo = 0;
var orderArray = new Array();
orderArray[0] = 1;
var ingreArray = new Array();
ingreArray[0] = 1;
var ingreAuto = new Array();
var tagArray = new Array(); 


//자바 스크립트 시작 
$(document).ready(function(){
	
	$(document).on("keydown",".tagInsert",function (key) {
		 
	    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	    
		    var tag = $(".tagInsertInput").val();
		    tagArray[tagNo] = tag;
		    
	    	console.log(tag);
	    	console.log(tagArray[tagNo]);
	    	
		    tagName = "tagInsert_" + tagNo;
		    
			var str = ""; 
		    
			str += "<li class = 'tagInsert' style = 'display:block; float: left;  margin: 2px 5px 2px 0;'>";
			str += "<input class = 'tagInsertInput' type = 'text' style = 'border:0px;  outline: none;' autofocus>";
			str += "</li>";
		    
		    $(this).after(str);
		    
		    $(this).replaceWith("<li class = '"+ tagName +"' style = 'display: block; float: left;  margin: 2px 5px 2px 0;'> <a id = '"+tagName+"' class='btn btn-default'><span name = '"+tagName+"' class='glyphicon glyphicon-remove'></span>" + tag + "</a></li>");

		    tagNo = tagNo + 1;
		   
		    console.log(tagArray);
		    
	    }
	    
	   if(key.keyCode == 8){
		   
		     var deleteName = tagArray.pop();
			
			 if ($(this).closest("li").prev().length) {
                 $(this).closest("li").prev().remove();
             }
		   
	   }
	    
	});
		

	$(document).on("click",".glyphicon-remove",function(){

			 var tagname = $(this).attr("name");
			 
			 console.log(tagname);
			 
			 var strArray = tagname.split("_");
			 var no = strArray[1];
				 
			 tagArray.splice(no,1);
				 
			 console.log(tagArray);
			 
			 $("." + tagname).remove();
			 
	})
	
	
	
		///시작시 ingre1도 자동 완성 가능하도록 해주는 부분
	
			$.ajax({

				url : "${pageContext.request.contextPath}/enrollform/autoIngre",
				type : "post",
				//contentType : "",
				//data : {},

				dataType : "json",
				success : function(ingreList) {

					for (var i = 0; i < ingreList.length; i++) {

						ingreAuto[i] = ingreList[i];

					}
					
					console.log(ingreAuto);
					
					$("input[name = ingre_1").autocomplete({
						source: ingreAuto
					}); 
					/*성공시 처리해야될 코드 작성*/
				
				},

				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		
	///////버튼 클릭해 요리순서 추가될 위치 지정해서 출력 함수로 보내버림
	$(document).on("click",".orderAddBtn",function(){
		
		
		console.log("추가");
		
		var location = $(this).attr("name");
		var orderNo = $("#" + location).val();
	
		//숫자변환
		orderNo *= 1;
		
		orderNo += 1; 
		
		console.log("orderNo은: " + orderNo);
		
		orderGetReady(location, orderNo);
			
	});
	///////////////////////////////////////////////////////////
	
	//div이름 재설정 후 위에서 받은 요리 순서참고해 출력할 위치에 갖다 밖는 부분
	//////////////////////////////////////////////////////////
	function orderGetReady(location, orderNo){
		
		var arrayLastNo = orderArray.length - 1;
		
		var arrayLocation = orderNo - 1;
		
		console.log("arrayLocation:" + arrayLocation);
		
		console.log("arrayLastNo : " + arrayLastNo);
		
		 if(!orderArray[arrayLocation]){
		
			console.log("비어 있어서 if문 들어옴");
			
			 orderArray[arrayLocation] = orderNo;
			 
			 console.log("if문 나가기 전 : " + orderArray);
			 
		
		} else {
			
			
			 for(var i = arrayLastNo; i >= arrayLocation; i--){
				
				 console.log("for문 들어옴");
				 console.log("현재 i의 값은 " + i);
				 console.log("더하기 전 배열 상태 : " + orderArray);
				 
				 //바꿀 order의 위치 찾기
				 var name = "order_" + orderArray[i];
				 console.log("바꿀 order위치:" + name);
				 
				 //찾은 위치에 넣어줄 order값을 1올려줌
				 orderArray[i] = orderArray[i] + 1;
				 console.log("찾은 위치에 넣어줄 order값을 1올려줌:"+ orderArray[i]);
				 
				 //올려준 값을 반영해 새로운 label값을 만들어줌
				 var newStep = orderArray[i] + " 단계";
				 console.log("올려준 값을 반영해 새로운 label값을 만들어줌:"+ newStep);
				 
				//찾은위치에 새로 반영한 label값 넣어줌
				 $("." + name).text(newStep);
				
				//새로운 이름
				var newName = "order_" + orderArray[i];
				console.log("새로운 이름:" +newName);
				
				//label name바꿔줌
				$("." + name).attr("name", ""+newName);	
				
				//찾은 위치의 order_no 바꿔줌 (클래스)
				$("." + name).attr("class","col-sm-2 "+newName);	
				
				//찾은 위치의 image id 값 바꿔줌
				$("input[id = " + name + "]").attr("id",""+newName);
				
				//name으로 찾은 인풋의 value값을 올려줌
				$("input[name=" + name + "]").val(orderArray[i]); 
	
				//name으로 찾을 name을 새로운 이름으로 바꿔줌
				$("input[name =" + name + " ]").attr("name",""+newName);
				
				//바꾼 값을 배열 하나 위에 넣어줌
				 orderArray[i + 1] = orderArray[i];
				 orderArray[i] = orderArray[i] - 1;
				
				 console.log("바꾼 값을 배열 하나 위에 넣어줌:" +orderArray[i + 1]);
				 
				 console.log("넣은 후  배열 체크 : " + orderArray);
				
			 	}
			 
		} 
	
		divNo += 1;
		
		console.log(divNo);
		console.log(orderNo);
		
		 var divName = "div_" + divNo;
		 var contentName = "textContent_" + divNo;
		 var orderName = "order_" + orderNo;
		 var str = " ";
		 
		 str += " <div class='"+divName+ " form-group' style = 'float:left; width: 1099px; margin-top:10px; margin-bottom:30px;'>"
	     str += "<label class='col-sm-2 "+ orderName +"' name = '"+ orderName +"' style = 'margin-left:60x; border-right:0.5px solid green; color:#528540; margin-top:20px;font-weight: bold; font-size:30px; '>"
	     str += "  	" + orderNo + " 단계"
	     str += "     </label>"
	     str += "            <div class='promo-flex col-sm-8' style = 'margin-top:10px; margin-bottom:10px;'>"
		 str += "        <div data-ix='blog-card' class='promo-card' style = 'float:left'>"
	     str += "     	<img class = 'orderEmptyImage' name = '"+divName+ "' src='${pageContext.request.contextPath}/assets/img/photobox.png' style = 'cursor:pointer; width:100%'>"
	     str += "    	<input id = '"+ orderName +"' type='file' class='order_photo' name='"+divName+ "' style = 'display:none;'/>"
	     str += "  </div>"
	   	 str += "				         <div class='blog-description' style ='width:330px; height:350px; float:left;'>"
	     str += "		           	<textarea class = '" +contentName+ "' style = 'width:100%; height:100%; border-color:white; "
	     str += "    										resize:none;  border-top-right-radius:10px; border-bottom-right-radius:10px;font-size:15px;' "
	     str += "					value = '';></textarea></div> </div>"
	     str += "	   			 <div class='btn-group col-sm-2' style='padding-right:6px; padding-top: 15px;'>"
	     str += "	                     <button class='orderAddBtn btn btn-success addOrder' name = '"+divName+ "' style = 'border:0; border-radius:10px'>단계 추가</button> "
	     str += "	                     <input id = '"+divName+"' type = 'text' name = '"+ orderName +"'  value = '"+ orderNo +"' style = 'display:none;'/>"
	     str += "	                     <button class='orderRemoveBtn btn btn-danger addOrder' name = '"+divName+ "' style = 'float:bottom; border:0; border-radius:10px; margin-top:10px'>단계 제거</button>" 
		 str += "	             </div>"
		 str += "</div>"
	
		 $("."+location).after(str);
		 
	};
	//////////////////////////////////////////////////////////
	
	
	/////////요리순서 지우기
	$(document).on("click",".orderRemoveBtn",function(){
		
		console.log("삭제");
		
		var currentLocation = $(this).attr("name");
		
		var orderNo = $("#" + currentLocation).val();
	
		//숫자변환
		orderNo *= 1;
		
		console.log("orderNo은: " + orderNo);
		
		orderRemoveGetReady(currentLocation, orderNo);
	
	});
	//////////////////////////////////////////////////////////
	
	//order지우는 함수
	function orderRemoveGetReady(currentLocation, orderNo){
		
		var arrayLastNo = orderArray.length - 1;
		
		arrayLocation = orderNo - 1;
		
		console.log("arrayLocation:" + arrayLocation);
		
		console.log("arrayLastNo : " + arrayLastNo);
		
		 if(arrayLocation == arrayLastNo){
		
			console.log("마지막 order라서 아무 작업 없이 그냥 삭제 가능");
			
			orderArray.splice(arrayLocation);
			 
		} else {
			
			var deleteOrderNo = arrayLocation + 1;
			
			 for(var i = deleteOrderNo; i <= arrayLastNo; i++){
				
				 console.log("for문 들어옴");
				 console.log("현재 i의 값은 " + i);
				 console.log("빼기 전 배열 상태 : " + orderArray);
				 
				 //바꿀 order의 위치 찾기
				 var name = "order_" + orderArray[i];
				 console.log("바꿀 order위치:" + name);
				 
				 //찾은 위치에 넣어줄 order값을 1빼줌
				 orderArray[i] = orderArray[i] - 1;
				 console.log("찾은 위치에 넣어줄 order값을 1 빼줌:"+ orderArray[i]);
				 
				 //올려준 값을 반영해 새로운 label값을 만들어줌
				 var newStep = orderArray[i] + " 단계";
				 console.log("뺀 값을 반영해 새로운 label값을 만들어줌:"+ newStep);
				 
				//찾은위치에 새로 반영한 label값 넣어줌
				 $("." + name).text(newStep);
				
				//새로운 이름
				var newName = "order_" + orderArray[i];
				console.log("새로운 이름:" +newName);
				
				//label name바꿔줌
				$("." + name).attr("name", ""+newName);	
				
				//찾은 위치의 order_no 바꿔줌 (클래스)
				$("." + name).attr("class","col-sm-2 "+newName);	
				
				//찾은 위치의 image id 값 바꿔줌
				$("input[id = " + name + "]").attr("id",""+newName);
				
				//name으로 찾은 인풋의 value값을 올려줌
				$("input[name=" + name + "]").val(orderArray[i]); 
	
				//name으로 찾을 name을 새로운 이름으로 바꿔줌
				$("input[name =" + name + " ]").attr("name",""+newName);
				
				//바꾼 값을 배열 하나 아래에 넣어줌
				 orderArray[i - 1] = orderArray[i];
				 
				 console.log("넣은 후  배열 체크 : " + orderArray);
				
			 	}
			
			 orderArray.splice(arrayLastNo);
			 
			 console.log("최종  배열 체크 : " + orderArray);
			 
			 console.log(orderArray.length);
			 
		} 
		
		//removeOrder
		 $("." + currentLocation).fadeOut("normal", function() {
			        $("." + currentLocation).remove();
			    });
		
	}
	
	/////버튼 클릭해 재료 추가될 위치 지정해서 출력 함수로 보내버림
	$(document).on("click",".addIngre",function(){
				
				var location = $(this).attr("name");
				
				ingreGetReady(location);
		
	});
	///////////////////////////////////////////////////////////
	
	
	//div이름 재설정 후 위에서 받은 재료추가 위치 참고해 출력할 위치에 갖다 밖는 부분
	/////////////////////////////////////////////////////////
	function ingreGetReady(location) {
	    	
	    	console.log(ingreNo);
	    	
	    	ingreNo += 1;
	    	
	    	console.log(ingreNo);
	    	
	    	ingreArray[ingreNo - 1] = ingreNo;
	    	
	    	console.log(ingreArray);
	    	
	    	var divName = "ingreDiv_" + ingreNo;
	    	var amount = "amount_" + ingreNo;
	    	var ingre = "ingre_" + ingreNo;
	    	
	    	var str = "";
	    	 
	         str += "<div class='form-group "+ divName +"'>";
	         str += "<div class = 'title col-sm-2'>";
	         str += "</div>";
	         str += "<div class = 'foodInfo' style = 'margin-bottom:10px;'>";
	         str += "   <div class = 'col-sm-3'>";
	         str += "      <input type='text' class='form-control' name = '"+ ingre +"' style = 'margin-right:20px; float:left' placeholder='재료를 적어주세요' value = ''>";
	         str += "   </div>";
	         str += "   <div class = 'col-sm-3'>";
	         str += "      <input type='text' class='form-control' name = '"+ amount +"' style = 'margin-right:20px; float:left' placeholder = '수량을 적어주세요' value = ''>";
	         str += "   </div>  ";
	         str += "	<div class = 'col-sm-3'>";
	         str += "    <button class='btn addIngre' name = '"+ divName +"'>재료추가</button>" 
	         str += "    <button class='btn btn-danger removeIngre' name ='"+ divName +"' style = 'margin-left:5px'>재료 삭제</button>" 
	         str += "   </div>";
	         str += "</div>";
	         str += "</div>";
	         
	         $("."+location).after(str);
	         
	         autoIngre(ingre);
	         
	};
	//////////////////////////////////////////////////////////
	
	function autoIngre(ingre){
		
	 	//자동 완성 실험중
		$("input[name = "+ ingre +"]").autocomplete({
			source: ingreAuto
		}); 
	}
	
				    	
	//제출 클릭시 데이터 전송
	//////////////////////////////////////////////////////////
	$(document).on("click", "#form-deliver", function(){
			
	 		event.preventDefault();
			
		    var userNo = $("#userNo").val();
			var	recipeTitle= $("#recipeTitle").val();
			var	foodName= $("#foodTitle").val();
			var	introduction = $("#introduction").val();
			var	cookingType= $(".foodGenre").val();
			var cookingMethod = $(".howTo").val();
			var amount = $(".howMany").val();
			var cookingTime = $(".cookingTime").val();
			var cookingLevel = $(".cookingLevel").val();
			var recipebookName = $(".btn-select-input").val();
		    
			console.log(recipeTitle +"," + foodName + "," + introduction + "," + cookingType
					 + "," +  cookingMethod + "," + amount + "," + cookingTime + "," + cookingLevel
					 + "," + recipebookName  + "," + recipebookName  + "," +userNo);
		
			$.ajax({
			
			url : "${pageContext.request.contextPath}/enrollform/enrollInfo",	
			type : "post",
			contentType : "application/json",
			data : JSON.stringify({ 
									userNo:userNo,
									recipeTitle: recipeTitle,
									recipebookName: recipebookName,
									foodName: foodName,
									introduction: introduction,
									cookingType: cookingType,
									cookingMethod: cookingMethod,
									amount: amount,
									cookingTime: cookingTime,
							        cookingLevel: cookingLevel}),
		    
				dataType : "json",						        
				success : function(recipeNo) {
				
				console.log("성공");
				tagSave(recipeNo);
				orderSave(recipeNo);
				ingreSave(recipeNo);
				mainphotoSave(recipeNo);
				/* orderphotoSave(recipeNo); */
			}, 
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
			});
			
		});
		
	//////////////////////////////////////////////////////////
	
	/////////////////////////tag저장
	function tagSave(recipeNo){
		
			for(var i = 0; i < tagArray.length; i++){
				
				if(tagArray[i]){
					
					var tag = tagArray[i];
					
					var tagVo = {
							tag:tag,
							recipeNo:recipeNo
					};
					
					$.ajax({
						url: "${pageContext.request.contextPath}/enrollform/saveTag",
						type : "post",
						contentType : "application/json",
						data: JSON.stringify(tagVo),
						/* dataType : "json", */
						success : function() {
							
							console.log("tag보냄");
							
						}, 
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
					});
				
					
				}
				
			}		
		
	}
	////////////////////////////////////////////////////////////
	
	//대표 사진 저장/////////////////////////////////////////////////
	function mainphotoSave(recipeNo){
		
		var data = $("#main_photo")[0].files[0];
		console.log(data);
		
		var formData = new FormData();
		
		formData.append("file", data);
		formData.append("recipeNo", recipeNo);
		
		console.log(formData);
		
		 $.ajax({
	        		 url: "${pageContext.request.contextPath}/enrollform/enrollPhoto",
	                 processData: false,
	                 contentType: false,
	                 data: formData,
	                 type: "POST",
	                 success: function(result){
	                 
	                 }
	         });
		
	};
	
	
	/////////////////////////////////////////////////////////
	
	//요리 순서 저장//////////////////////////////////////////////
	function orderSave(recipeNo){
		
		console.log("orderSave들어옴");
		
		for(var i = 0; i < orderArray.length; i++){
			
			console.log(orderArray[i]);
			
			var orderNo = orderArray[i];
			var orderName = "order_" + orderNo;
			
			var divName = $("input[name = " + orderName + "]").attr("id");
			var divSplitName = divName.split("_");
			
			console.log(divName);
			console.log(divSplitName);
			
			var divNo = divSplitName[1];
			
			var contentName = "textContent_" + divNo;
			
			var imageContent = "없음";
			
			var textContent = $("." + contentName).val();
			
			 var recipeContentVo = {
	
					recipeNo:recipeNo,
					orderNo:orderNo,
					textContent:textContent,
					imgContext:imageContent
			}; 
			
			 console.log(recipeContentVo);
			 
			$.ajax({
				url: "${pageContext.request.contextPath}/enrollform/enrollOrder",
				type : "post",
				contentType : "application/json",
				data: JSON.stringify(recipeContentVo),
				dataType : "json",
				success : function() {
					
					if(i = orderArray.length-1){
						orderphotoSave(recipeNo);
					}
					
				}, 
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		
		};
	};
	
	
	//순서 사진 저장/////////////////////////////////////////////////
	function orderphotoSave(recipeNo){
	
		for(var i = 0; i < orderArray.length; i++){
		
		console.log("순서 사진 저장");
		
		var orderNo = orderArray[i];
		
		var orderName = "order_" + orderNo;
		
		console.log(orderName);
		
		var data = $("input[id =" + orderName + "]")[0].files[0];
		
		console.log(data);
		
		var formData = new FormData();
		
		formData.append("photo", data);
		formData.append("orderNo", orderNo);
		formData.append("recipeNo",recipeNo);
	
		console.log(formData);
		
		 $.ajax({
	        		 url: "${pageContext.request.contextPath}/enrollform/enrollOrderPhoto",
	                 processData: false,
	                 contentType: false,
	                 data: formData,
	                 type: "POST",
	                 success: function(result){
	                   console.log("orderphotoSave성공");
	                   location.href = "${pageContext.request.contextPath}/read/readform?recipe_no="+recipeNo;
	                 }
	         });
		}
	};
	
	
	/////////////////////////////////////////////////////////
	
	function ingreSave(recipeNo){
		
		for(var i = 0;i < ingreArray.length; i++){
			
			var ingreNo = ingreArray[i];
			var recipeNo = recipeNo;
			var materialName = "ingre_" + ingreNo;
			var amountName = "amount_" + ingreNo;
			
			var material = $("input[name =" + materialName + "]").val();
			var amount = $("input[name =" + amountName + "]").val();
			
			var ingreVo = {
					
					recipeNo : recipeNo,
					materialName : material,
					amount : amount
	
			}
			
			console.log(ingreVo);
			
			$.ajax({
				url: "${pageContext.request.contextPath}/enrollform/enrollIngre",
				type : "post",
				contentType : "application/json",
				data: JSON.stringify(ingreVo),
				dataType : "json",
				success : function(recipeNo) {
					
					console.log("ingre 성공");
					console.log(recipeNo);
					
				}, 
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			
		}
	};
	
	//////////////////////////////////////////////////////////
			
	////////////////////////////////////order이미지 추가하는 함수
	$(document).on("click",".orderEmptyImage",function broseOrderFile(){
		
	 var name = $(this).attr("name"); 
		
	 console.log(name);
	 
	 $("input[name = " + name + "]").click(); 
	 
	 $("input[name = " + name + "]").on("change",handleOrderImageFile);
	 
		 function handleOrderImageFile(e){
				
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
		
				filesArr.forEach(function(f){
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					
					sel_file = f;
					
					var reader = new FileReader();
				 	reader.onload = function(e) {
				 		
				 	var str = "";
			  
			  		str += "<img class = 'orderEmptyImage' src = '"+ e.target.result +"' name = '"+ name +"' style = 'max-width:360px; height:350px; cursor:pointer; '/>"
		
			  		console.log(str);
			  	
			     	 $("img[name =" + name + "]").replaceWith(str);
			     
				 	/* return false; */
				 	
				 	}
				
				 	reader.readAsDataURL(f);
				
				});
			};
		});
	///////////////////////////////////////////////////////////
});
//document.ready끝


//////빼기 버튼 눌러 재료 지우기
$(document).on("click",".removeIngre", function(){
    	
      var currentLocation = $(this).attr("name");
      
      $("." + currentLocation).remove();

});
//////////////////////////////////////////////////////////


//레시피북 select 구현
//////////////////////////////////////////////////////////
$(document).on('click', '.btn-select', function (e) {
    e.preventDefault();
    var ul = $(this).find("ul");
    if ($(this).hasClass("active")) {
        if (ul.find("li").is(e.target)) {
            var target = $(e.target);
            target.addClass("selected").siblings().removeClass("selected");
            var value = target.html();
            $(this).find(".btn-select-input").val(value);
            $(this).find(".btn-select-value").html(value);
        }
        ul.hide();
        $(this).removeClass("active");
    }
    else {
        $('.btn-select').not(this).each(function () {
            $(this).removeClass("active").find("ul").hide();
        });
        ul.slideDown(300);
        $(this).addClass("active");
    }
});

$(document).on('click', function (e) {
    var target = $(e.target).closest(".btn-select");
    if (!target.length) {
        $(".btn-select").removeClass("active").find("ul").hide();
    }
});
//////////////////////////////////////////////////////////

</script>
</html>