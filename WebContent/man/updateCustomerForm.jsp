<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>ȸ������ ����</title>
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
        <b><font size="6" color="gray">ȸ����������</font></b>
        <br><br><br>
        
        <form method="post" action="updateCustomerPro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">���̵�</td>
                    <td><input type="hidden" name="cusid" value="<%=cusid %>"/><%=cusid%>
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