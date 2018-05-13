<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page language="java" import="java.util.*,com.lrq.demo.model.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户界面</title>
    <script src="http://code.jquery.com/jquery-1.4.1.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#mainForm").submit(function (envent){
                envent.preventDefault();
                var form = $(this);
                $.ajax({
                    url: form.attr("action"),
                    type: form.attr("method"),
                    data: form.serialize(),
                    success: function(user){
                        if(user){
                            alert( "请求用户数据成功" + user.id+user.name+user.idNo,+user.gender);
                            $("#usermsg").val(user.id+user.name+user.idNo,+user.gender);
                        }else{
                            alert("请求用户数据失败"+user);
                        }
                    },
                    error: function(){
                        alert("请求用户数据失败");
                    }
                });
            });

        });
    </script>
</head>
<body>
<form id="mainForm" enctype="multipart/form-data" action="/demo/getUser.do" method="post">
    <table >
        <tr>
            <td><span>请输入姓名</span></td>
            <td>
                <input type="text" id="name" name="name"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="提交">
                <input type="reset" name="重置">
            </td>
        </tr>
    </table>
</form>
    <input type="text" id="usermsg" name="usermsg" readonly="readonly"/>
</body>
</html>