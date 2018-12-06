<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상영관삭제</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<% 
	String id = request.getParameter("id");
	String screenid = request.getParameter("screenid");

%>
<body>
   <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">상영관삭제</font></b>
        <br><br><br>
        
        <form method="post" action="deleteScreenPro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">영화번호</td>
                    <td>
                        <input type="hidden" name="screenid" value="<%=screenid %>"/><%=screenid%>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="삭제"/>  <input type="reset" value="취소">
        </form>
        <
</body>
</html>