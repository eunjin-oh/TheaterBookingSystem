<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ����</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<% 
	String id = request.getParameter("id");
	int movieid = Integer.parseInt(request.getParameter("movieid"));
	String moviename = request.getParameter("moviename");
%>
<body>
   <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">��ȭ����</font></b>
        <br><br><br>
        <font color="blue">��ȭ�� �����Ͻðڽ��ϱ�?</font>
        <form method="post" action="deleteMoviePro.jsp" class="formCenter">
            <table  class="formCenter" border="1" width="300">
                <tr>
                    <td id="title">��ȭ��ȣ</td>
                    <td><%=movieid%></td>
                </tr>                        
                <tr>
                    <td id="title">��ȭ�̸�</td>
                    <td><%=moviename%></td>
                </tr>   
            </table>
            <br><br>
            <br><br>
            <br><br>
            <input type="hidden" name="movieid" value="<%=movieid%>"/>
            <input type="hidden" name="moviename" value="<%=moviename%>"/>
            <input type="hidden" name="id" value="<%=id%>">
          <input type="submit" value="����">
          <input type="button" onclick="location.href='MovieInfo.jsp?id=<%=id%>' " value="���">
        </form>
       </div>
</body>
</html>