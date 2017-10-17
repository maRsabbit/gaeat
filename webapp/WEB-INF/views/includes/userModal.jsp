<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <meta charset="utf-8">
</head>
<body>
<!-- 구독하기 모달 -->
<div class="modal" id="myModal">
	<div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h4 class="modal-title">구독하기</h4>
        </div>
        <div class="modal-body">
        	해당 카테고리를 구독하시겠습니까?
        </div>
        <div class="modal-footer">
          <a href="#" data-dismiss="modal" class="btn">취소</a>
          <a ${blist.recipebook_no}" class="btn btn-primary subCheck" name = "subscribe_${blist.recipebook_no}">확인</a>
        </div>
      </div>
    </div>
</div>

<script type="text/javascript">


$('#openBtn').click(function(){
	$('#myModal').modal({show:true});
	var subNo = $(this).val();
	console.log(subNo);
	
});

$(document).on("click",".subCheck",function(){
	
	var subNo = $(this).val();
	
	console.log(subNo);
});

</script>


    <!-- 카테고리 편집 모달 -->
    <div class="modal fade" id="companyPositionModal" tabindex="-1" role="dialog" aria-labelledby="companyPositionLabel" aria-hidden="true" style= "background-color: rgba(0, 0, 0, 0.5);">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="companyPositionLabel">카테고리 수정하기</h4>
          </div>
          <div class="modal-body">
            <div class="hidden" id="companyPosEditTemplate">
              <form role="form">
                  <div class="">
                    <input type="hidden" name="position_id" class="hidden" value="">
                    <div class="input-group input-group-option col-xs-12">
                        <input type="text" name="position_label" class="form-control companyPosInput" value="">
                        <span class="input-group-btn companyPosButtonsEdit">
                            <button class="btn btn-primary companyPosEditSaveBtn" data-loading-text="Saving..." type="button"><span class="glyphicon glyphicon-ok"></span></button>
                            <button class="btn btn-default companyPosEditCancelBtn" type="button" data-toggle="tooltip" data-placement="top" title="Cancel" >
                                <span class="glyphicon glyphicon-remove"></span>
                            </button>
                        </span>
            		</div>
                </div>
              </form>
             </div>
            <div class="row">
            	<div class="col-sm-offset-2 col-sm-8">
        			<ul class="list-group companyPosItemsList">
        			
        			<!-- 카테고리 리스트 -->
        			<c:forEach items="${recipebookList}" var="list">
        				<li class="list-group-item ${list.recipebook_no}" data-position-id="123">
                            <div class="companyPosItem">
            					<span class="companyPosLabel">${list.recipebook_name }</span>
            					<ul class="list-group-submenu">
            						<li class="list-group-submenu-item">
                                        <button type="button" name = "${list.recipebook_no}" class="btn btn-default no-border removeCategory" data-toggle="tooltip" data-placement="top" title="Remove">
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </button>
                                    </li>
            					</ul>
                            </div>
        				</li>
        			</c:forEach>
        			</ul>
        			
                    <div class="form-group form-group-options">
                    	<div class="input-group input-group-option col-xs-12">
                			<p>카테고리 추가하기</p>
                			<input type="text" name="position_label" class="form-control companyPosInputNew categoryName" 
                			placeholder="추가할 카테고리의 이름을 입력하세요" />
                			<br>
                			<button id = "addCategory" class = "btn btn-primary" type = "button" style = "float:right; margin-top:10px;"><span class="glyphicon glyphicon-ok">  카테고리 추가</button>
                            <!-- <span class="input-group-btn companyPosButtonsNew">
                                <button class="btn btn-primary companyPosSaveBtn" data-loading-text="Saving..." type="button"><span class="glyphicon glyphicon-ok"></span></button>
                                <button class="btn btn-default companyPosCancelBtn" type="button"><span class="glyphicon glyphicon-remove"></span></button>
                            </span> -->
                		</div>
                	</div>
        		</div>
        	</div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
          </div>
        </div>
      </div>
    </div>
    
    <input type = "hidden" id = "itschefno"  value = "${chef.chef_no}">
    
<script type="text/javascript">

//카테고리 추가
$(document).on("click","#addCategory", function(e){
	
	var name = $(".categoryName").val();
	var chef_no = $("#itschefno").val();
	
	console.log(chef_no);
	
	var nameVo = {
			recipebookName:name,
			chefNo:chef_no
	}
	
		$.ajax({
			url: "${pageContext.request.contextPath}/userpage/categoryAdd",
			type : "post",
			contentType : "application/json",
			data: JSON.stringify(nameVo),
			dataType : "json",
			success : function(newBookNo) {
			
				console.log("recipeBook 추가 보내기 성공");
				console.log(newBookNo);
				
				var str = "";
				
				str += "<li class='list-group-item "+newBookNo+"' data-position-id='123'>";
				str += "<div class='companyPosItem'>";
				str += "	<span class='companyPosLabel'>"+name+"</span>";
				str += "	<ul class='list-group-submenu'>";
				str += "		<li class='list-group-submenu-item'>";
				str += "            <button type='button' name = '"+newBookNo+"' class='btn btn-default no-border removeCategory' data-toggle='tooltip' data-placement='top' title='Remove'>";
				str += "                <span class='glyphicon glyphicon-remove'></span>";
				str += "            </button></li></ul> </div></li>";
			
				$(".companyPosItemsList").append(str);
				
			}, 
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	
		
	
	})

$(document).on("click",".removeCategory", function(e){
	
	var recipebookNo = $(this).attr("name");
	
	var recipebookVo = {
			recipebookNo:recipebookNo
	}
	
	$.ajax({
		url: "${pageContext.request.contextPath}/userpage/categoryRemove",
		type : "post",
		contentType : "application/json",
		data: JSON.stringify(recipebookVo),
		dataType : "json",
		success : function() {
		
			console.log("recipeBook 삭제 보내기 성공");
		
		}, 
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
	$("." + recipebookNo).remove();

}); 


$(function () {
    var formTemplate = $('#companyPosEditTemplate');
    
    $(document).on('click', '#companyPositionModal', function(e) {
        cleanAddNewCompanyPosForm(e, $(this));
    });
    
    function closeAllOpenedForms() {
        $('ul.companyPosItemsList').find('form').each(function() {
            $(this).closest('li.list-group-item').find('.companyPosItem').removeClass('hidden');
            $(this).remove();
        });
    }
    
    function stopCompanyPositionEdition(event, element) {
        var listItem = $(element).closest('li.list-group-item');
        listItem.find('form').remove();
        listItem.find('.companyPosItem').removeClass('hidden');
    }
    
    function cleanAddNewCompanyPosForm(event, element) {
        $(element).find('.companyPosButtonsNew').addClass('hidden');
        $(element).find('.companyPosInputNew').val('');
    }
    
    $(document).on('click', '.companyPosLabel', function(event) {
        closeAllOpenedForms();
        
        var listItem = $(this).closest('li.list-group-item');
        var companyPosItem = listItem.find('.companyPosItem');
        var label = $(this).html();
        var id = listItem.data('positionId');
        var form = formTemplate.find('form').clone();
        form.find('input[name=position_id]').val(id);
        form.find('input[name=position_label]').val(label);
        companyPosItem.addClass('hidden');
        listItem.append(form).find('input[name=position_label]').focus();
    });
    
    function saveEditedCompanyPos(event, element) {
        var listItem = $(element).parents('li.list-group-item');
        var btn = $(listItem).find('.companyPosEditSaveBtn');
        var cancelBtn = $(listItem).find('.companyPosEditCancelBtn');
        var inputField = $(listItem).find('.companyPosInput');
        var value = inputField.val();
        if (value) {
            cancelBtn.addClass('hidden');
            btn.button('loading');
            
            // todo: replace with AJAX
            setTimeout(function(){
                listItem.html(
                    '<div class="companyPosItem">' +
                        '<span class="companyPosLabel">' + value + '</span>' +
            			'<ul class="list-group-submenu">' +
        					'<li class="list-group-submenu-item">' +
                                '<button type="button" class="btn btn-default no-border" data-toggle="tooltip" data-placement="top" title="Remove">' +
                                    '<span class="glyphicon glyphicon-remove"></span>' +
                                '</button>' +
                            '</li>' +
    					'</ul>' +
                    '</div>'
                );
            }, 1500);
        }
    }
    
    $(document).on('click', '.companyPosEditSaveBtn', function (e) {
        console.log('clicked');
        e.stopPropagation();
        saveEditedCompanyPos(e, $(this));
    });
    
    $(document).on('keypress', '.companyPosInput', function (e) {
        if (e.which === 13) {
            e.stopPropagation();
            e.preventDefault();
            saveEditedCompanyPos(e, $(this));
        }
    });
    
    $(document).on('click', '.companyPosEditCancelBtn', function(e) {
        stopCompanyPositionEdition(e, $(this));
    });
    
    $(document).on('click', '.companyPosEditCancelBtn', stopCompanyPositionEdition);
    
    $(document).on('focus', '.companyPosInputNew', function() {
        var buttonsBar = $(this).parents('div').find('.companyPosButtonsNew');
        buttonsBar.removeClass('hidden');
    });
    
    $(document).on('click', '.companyPosCancelBtn', function (e) {
        cleanAddNewCompanyPosForm(e, $(this));
    });
    
    function saveNewCompanyPos(event, btn, inputField) {
        var cancelBtn = $('.companyPosCancelBtn');
        var listContainer = $('ul.companyPosItemsList');
        var value = inputField.val();
        
        if (value) {
            cancelBtn.addClass('hidden');
            btn.button('loading');
//        $.ajax(...).always(function () {
//        });
            // todo: replace with AJAX
            setTimeout(function(){
                listContainer.append(
                    '<li class="list-group-item"  data-position-id="231">' +
                        '<div class="companyPosItem">' +
                            '<span class="companyPosLabel">' + value + '</span>' +
            				'<ul class="list-group-submenu">' +
            					'<li class="list-group-submenu-item">' +
                                    '<button type="button" class="btn btn-default no-border" data-toggle="tooltip" data-placement="top" title="Remove">' +
                                        '<span class="glyphicon glyphicon-remove"></span>' +
                                    '</button>' +
                                '</li>' +
        					'</ul>' +
                        '</div>' +
    				'</li>'
                );
                inputField.val('');
                btn.button('reset');
                cancelBtn.removeClass('hidden');
            }, 1500);
        }
    }
    
    $(document).on('click', '.companyPosSaveBtn', function (e) {
        e.stopPropagation();
        var btn = $(this);
        var inputField = btn.parents('div').find('.companyPosInputNew');
        saveNewCompanyPos(e, btn, inputField);
    });
    
    $(document).on('keypress', '.companyPosInputNew', function (e) {
        if (e.which === 13) {
            e.stopPropagation();
            var inputField = $(this);
            var btn = inputField.parents('div').find('.companyPosSaveBtn');
            saveNewCompanyPos(e, btn, inputField);
        }
    });
});
</script>
</body>
