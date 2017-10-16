<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>

</head>
<body>
    <form id="frm" name="frm" enctype="multipart/form-data">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>�Խñ� �ۼ�</caption>
            <tbody>
                <tr>
                    <th scope="row">����</th>
                    <td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="20" cols="100" title="����" id="CONTENTS" name="CONTENTS"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <input type="file" name="file">
        <br/><br/>
         
        <a href="#this" class="btn" id="write">�ۼ��ϱ�</a>
        <a href="#this" class="btn" id="list">�������</a>
    </form>

    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //������� ��ư
                e.preventDefault();
                fn_openBoardList();
            });
             
            $("#write").on("click", function(e){ //�ۼ��ϱ� ��ư
                e.preventDefault();
                fn_insertBoard();
            });
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
            comSubmit.submit();
        }
         
        function fn_insertBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/user/a' />");
            comSubmit.submit();
        }
    </script>
</body>
</html>
