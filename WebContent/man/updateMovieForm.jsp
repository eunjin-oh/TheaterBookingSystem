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
        <b><font size="6" color="gray">��ȭ��������</font></b>
        <br><br><br>
        
        <form method="post" action="updateMoviePro.jsp" class="formCenter">
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
                <tr>
                    <td id="title">�󿵽ð�</td>
                    <td>
                        <input type="text" name="runtime" maxlength="10">
                    </td>
                </tr>                  
                <tr>
                    <td id="title">������</td>
                    <td>                
                        <input type="text" name="director" maxlength="10">                     
                    </td>
                </tr>
                <tr>
                    <td id="title">�⿬����</td>
                    <td>
                        <input type="text" name="actors" maxlength="10">
                    </td>
                </tr>        
                <tr>
                    <td id="title">�󿵵��</td>
                    <td>
                        <select name='rating'>
			                <option value='ALL'>��ü������</option>
			                <option value='12'>12��������</option>
			                <option value='15'>15��������</option>
			                <option value='18'>û�ҳ�����Ұ�</option>
			            </select>
                    </td>
                </tr>
                <tr>
                    <td id="title">�ֿ�����</td>
                    <td>
                        <input type="text" name="etcinfo" maxlength="30">
                    </td>
                </tr>     
            </table>
            <br>
            <input type="submit" value="����"/>  <input type="button" value="���">
        </form>
</body>
</html>