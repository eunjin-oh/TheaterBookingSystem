<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>���ڵ� ����</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">ȸ����������</font></b>
        <br><br><br>
        
        <form method="post" action="updateTestPro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">���̵�</td>
                    <td>
                        <input type="text" name="id" maxlength="15">    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="passwd" maxlength="20">
                    </td>
                </tr>   
                <tr>
                    <td id="title">�̸�</td>
                    <td>
                        <input type="text" name="name" maxlength="10">
                    </td>
                </tr>                  
                <tr>
                    <td id="title">�������</td>
                    <td>
                        <input type="date" name="birth" maxlength="10">                     
                    </td>
                </tr>
                <tr>
                    <td id="title">�ּ�</td>
                    <td>
                        <input type="text" maxlength="100" name="address"/>
                    </td>
                </tr>        
                <tr>
                    <td id="title">����ó</td>
                    <td>
                        <input type="text" maxlength="12" name="phone"/>
                    </td>
                </tr>

            </table>
            <br>
            <input type="submit" value="����"/>  <input type="button" value="���">
        </form>
</body>
</html>