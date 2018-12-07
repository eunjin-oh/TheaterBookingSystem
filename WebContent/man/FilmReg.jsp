<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.*"%>
<%@page import="java.io.File"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*"%>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html lang="ko">
  <head>
  	<meta charset="UTF-8">
  	<link rel="stylesheet" type="text/css" href="../style.css">
  	<script src="../script.js" type="text/javascript"></script>
  </head>
  <% String id = request.getParameter("id"); %>
  <body>
    <header id="header">
      <div class="navbar">
        <a href="../manMain.jsp?id=<%=id%>">관리자</a>
        <div class="dropdown">
          <button class="dropbtn">영화관관리
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="CinemaInfo.jsp?id=<%=id%>">영화관정보</a>
            <a href="CinemaReg.jsp?id=<%=id%>">영화관등록</a>
          </div>
        </div>
        <div class="dropdown">
          <button class="dropbtn">영화관리
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="MovieInfo.jsp?id=<%=id%>">영화정보</a>
            <a href="MovieReg.jsp?id=<%=id%>">영화등록</a>
          </div>
        </div>
           <div class="dropdown">
          <button class="dropbtn">상영관리
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="ScreenInfo.jsp?id=<%=id%>">상영관정보</a>
            <a href="ScreenReg.jsp?id=<%=id%>">상영관등록</a>
            <a href="FilmReg.jsp?id=<%=id%>">상영영화등록</a>
            <a href="FilmDelete.jsp?id=<%=id%>">상영영화삭제</a>
          </div>
   		</div>
              <div class="dropdown">
          <button class="dropbtn">고객관리
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
            <a href="MemInfo.jsp?id=<%=id%>">VIP정보</a>
            </div>       
            </div>
          <div class="dropdown">
          <button class="dropbtn">티켓
            <i class="fa fa-caret-down"></i>
          </button>
           <div class="dropdown-content">
            <a href="ticketIssue.jsp?id=<%=id%>">티켓발행</a>
            </div>       
            </div>
    </header>
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">상영영화추가</font></b>
        <br><br><br>
        
        <form method="post" action="FilmRegPro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">상영일정번호</td>
                    <td>
                        <input type="text" name="filmid" maxlength="10">    
                    </td>
                </tr>                      
                <tr>
					<td id="title">영화명</td>
					<td><select name='moviename'>
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
									String sql = "select * from 영화";
									pstmt = conn.prepareStatement(sql);
									rs = pstmt.executeQuery();
									while (rs.next()) {
										String moviename = rs.getString("영화명");
							%>
							<option value=<%=moviename%>><%=moviename%></option>
							<%
								}
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
					</select></td>
				</tr>
                <tr>
					<td id="title">상영관번호</td>
					<td><select name='screenid'>
							<%
								//db 에서 회원목록 얻어와 테이블에 출력하기.
								conn = null;
								pstmt = null;
								str = "";
								rs = null;
								try {
									String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
									String dbId = "root";
									String dbPass = "admin";

									Class.forName("com.mysql.jdbc.Driver");
									conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
									String sql = "select * from 상영관";
									pstmt = conn.prepareStatement(sql);
									rs = pstmt.executeQuery();
									while (rs.next()) {
										String screenid = rs.getString("상영관번호");
							%>
							<option value=<%=screenid%>><%=screenid%></option>
							<%
								}
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
					</select></td>
				</tr>             
                <tr>
                    <td id="title">상영일</td>
                    <td>                
                        <input type="date" name="filmdate" maxlength="10">                     
                    </td>
                </tr>
                <tr>
                    <td id="title">상영시작시간</td>
                    <td>
                        <select name='filmstart'>
                        	<option value="07:00">07:00</option>
                        	<option value="08:00">08:00</option>
                        	<option value="09:00">09:00</option>
                        	<option value="10:00">10:00</option>
                        	<option value="11:00">11:00</option>
                        	<option value="12:00">12:00</option>
                        	<option value="13:00">13:00</option>
                        	<option value="14:00">14:00</option>
                        	<option value="15:00">15:00</option>
                        	<option value="16:00">16:00</option>
                        	<option value="17:00">17:00</option>
                        	<option value="18:00">18:00</option>
                        	<option value="19:00">19:00</option>
                        	<option value="20:00">20:00</option>
                        	<option value="21:00">21:00</option>
                        	<option value="22:00">22:00</option>
                        	<option value="23:00">23:00</option>
                        	<option value="24:00">24:00</option>
                        	<option value="01:00">01:00</option>
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="등록"/>  <input type="reset" value="취소">
        </form>
    </div>
    
</body>
</html>