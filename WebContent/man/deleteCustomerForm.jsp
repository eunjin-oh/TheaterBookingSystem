<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ��Ż��</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<% 
	String id = request.getParameter("id");
	String cusid = request.getParameter("cusid");
%>
  <body>
    <header id="header">
      <div class="navbar">
        <a href="../manMain.jsp?id=<%=id%>">������</a>
        <div class="dropdown">
          <button class="dropbtn">��ȭ������
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="CinemaInfo.jsp?id=<%=id%>">��ȭ�� ����</a>
            <a href="CinemaReg.jsp?id=<%=id%>">��ȭ�� ���</a>
          </div>
        </div>
        <div class="dropdown">
          <button class="dropbtn">��ȭ����
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="MovieInfo.jsp?id=<%=id%>">��ȭ����</a>
            <a href="MovieReg.jsp?id=<%=id%>">��ȭ���</a>
          </div>
        </div>
           <div class="dropdown">
          <button class="dropbtn">�󿵰���
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="ScreenInfo.jsp?id=<%=id%>">�󿵰� ����</a>
            <a href="ScreenReg.jsp?id=<%=id%>">�󿵰� ���</a>
          </div>
   		</div>
         <div class="dropdown">
          <button class="dropbtn">������
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
           	<a href="Customerinfo.jsp?id=<%=id%>">ȸ������</a>
            <a href="MemInfo.jsp?id=<%=id%>">VIP����</a>
            </div>       
            </div>
    </header>
	<b><%=id %></b>���� �α��� �ϼ̽��ϴ�.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="�α׾ƿ�">
	</form>
   <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">ȸ��Ż��</font></b>
        <br><br><br>
        
        <form method="get" action="deleteCustomerPro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">���̵�</td>
                    <td>
                        <input type="hidden" name="cusid" value="<%=cusid %>"/><%=cusid%>
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="passwd" maxlength="20">
                    </td>
                    <td style="display:none;">
                        <input type="hidden" name="id" value="<%=id %>">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Ż��"/>  <input type="button" value="���">
        </form>
</body>
</html>