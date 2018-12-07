<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>��ȭ����������</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<% 
	String id = request.getParameter("id");
	String movieid = request.getParameter("movieid");
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
            <a href="CinemaInfo.jsp?id=<%=id%>">��ȭ������</a>
            <a href="CinemaReg.jsp?id=<%=id%>">��ȭ�����</a>
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
            <a href="ScreenInfo.jsp?id=<%=id%>">�󿵰�����</a>
            <a href="ScreenReg.jsp?id=<%=id%>">�󿵰����</a>
            <a href="FilmReg.jsp?id=<%=id%>">�󿵿�ȭ���</a>
            <a href="FilmDelete.jsp?id=<%=id%>">�󿵿�ȭ����</a>
          </div>
   		</div>
                 <div class="dropdown">
          <button class="dropbtn">������
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
            <a href="MemInfo.jsp?id=<%=id%>">VIP����</a>
            </div>       
            </div>
          <div class="dropdown">
          <button class="dropbtn">Ƽ��
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
            <a href="ticketIssue.jsp?id=<%=id%>">Ƽ�Ϲ���</a>
            </div>       
            </div>
    </header>
	<b><%=id %></b>���� �α��� �ϼ̽��ϴ�.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="�α׾ƿ�">
	</form>
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">��ȭ��������</font></b>
        <br><br><br>
        
        <form method="post" action="updateMoviePro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">��ȭ��ȣ</td>
                    <td>
                        <input type="hidden" name="movieid" value="<%=movieid %>"/><%=movieid%>
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
            <input type="hidden" name="id" value="<%=id%>"/>
            <br>
            <a href="updateMoviePro.jsp>" class="button" type="submit">����</a>
            <a href="MovieInfo.jsp?id=<%=id%>" class="button" type="submit">���</a>
       </form>
</body>
</html>