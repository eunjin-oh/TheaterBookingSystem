<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ����</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
   <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">��ȭ����</font></b>
        <br><br><br>
        
        <form method="post" action="deleteMoviePro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">��ȭ��ȣ</td>
                    <td>
                        <input type="text" name="movieid" maxlength="10">    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">��ȭ��</td>
                    <td>
                        <input type="text" name="moviename" maxlength="20">
                    </td>
                </tr>   
            </table>
            <br>
            <input type="submit" value="����"/>  <input type="reset" value="���">
        </form>
</body>
</html>