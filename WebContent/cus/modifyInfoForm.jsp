<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
   
<!DOCTYPE html>
<html lang="ko">
  <head>
  	<meta charset="UTF-8">
  	<link rel="stylesheet" type="text/css" href="../style.css">
  	<script src="../script.js" type="text/javascript"></script>
  </head>
 <% String id = request.getParameter("id"); 
	String passwd= request.getParameter("passwd"); 
%>
    <header id="header">
      <div class="navbar">
        <a href="../cusMain.jsp?id=<%=id%>">회원</a>
        <div class="dropdown">
          <button class="dropbtn">My Page
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="modifyInfo.jsp?id=<%=id%>">정보수정</a>
            <a href="withdraw.jsp?id=<%=id%>">회원탈퇴</a>
          </div>
        </div>
        <div class="dropdown">
          <button class="dropbtn">영화
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="Movie.jsp?id=<%=id%>">영화예매</a>
          </div>
        </div>
           <div class="dropdown">
          <button class="dropbtn">예약현황
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="reservationInfo.jsp?id=<%=id%>">예약정보</a>
          </div>
   		</div>
   		</div>
    </header>
    <body>
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
		<%
			//db 에서 회원목록 얻어와 테이블에 출력하기.
			Connection conn = null;
			PreparedStatement pstmt = null;
			String str = "";
			ResultSet rs = null;
			try {

				String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
				String dbId = "root";
				String dbPass = "admin";
				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
				
				String sql = "select * from 회원";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String ps= rs.getString("회원비밀번호");
					String n = rs.getString("회원이름");
					String b = rs.getString("생년월일");
					String a = rs.getString("회원주소");
					String p = rs.getString("회원연락처");
				%>	
			
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원정보수정</font></b>
        <br><br><br>       
        <form action="modifyInfoFinish.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td><%=id%></td>
                </tr>                       
                <tr>
                    <td id="title">비밀번호</td>
                    <td><input type="password" name="modi_passwd" maxlength="20" value="<%=ps%>"></td>
                </tr>   
                <tr>
                    <td id="title">이름</td>
                    <td><input type="text" name="name" maxlength="10" value="<%=n%>"></td>
                </tr>                  
                <tr>
                    <td id="title">생년월일</td>
                    <td><input type="date" name="birth" maxlength="10" value="<%=b%>"></td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td><input type="text" maxlength="100" name="address" value="<%=a%>"></td>
                </tr>        
                <tr>
                    <td id="title">연락처</td>
                    <td><input type="text" maxlength="12" name="phone" value="<%=p%>"></td>
                </tr>
            </table>
            <br>
            <input type="hidden" name="id" value="<%=id%>"/>           
            <input type="hidden" name="passwd" value="<%=passwd%>"/>
            <input type="submit" value="수정"/>
        </form>
        </div>        
<% 	}
				} catch (SQLException se) {
					System.out.println(se.getMessage());
				} finally {
				try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					} catch (SQLException se) {
						System.out.println(se.getMessage());
					}
				}
			%>
</body>
</html>