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
        <b><font size="6" color="gray">��ȭ����������</font></b>
        <br><br><br>
        
        <form method="post" action="updateTheaterPro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">��ȭ���̸�</td>
                    <td>
                        <input type="text" name="theatername" maxlength="10">    
                    </td>
                </tr>                      
                <tr>
                    <td id="title">��ȭ���ּ�</td>
                    <td>
                        <input type="text" name="theateraddress" maxlength="100">
                    </td>
                </tr>   
                <tr>
                    <td id="title">��ȭ����ȭ��ȣ</td>
                    <td>
                        <input type="text" name="theaterphone" maxlength="12">
                    </td>
                </tr>                  
                <tr>
                    <td id="title">�󿵰� ��</td>
                    <td>                
                        <input type="text" name="screennumber" maxlength="10">                     
                    </td>
                </tr>
                <tr>
                    <td id="title">�� �¼���</td>
                    <td>
                        <input type="text" name="seatnumber" maxlength="10">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="����"/>  <input type="button" value="���">
        </form>
</body>
</html>