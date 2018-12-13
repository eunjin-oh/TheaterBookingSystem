<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
				<button class="dropbtn">
					영화관관리 <i class="fa fa-caret-down"></i>
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
		<br>
		<br> <b><font size="6" color="gray">상영관추가</font></b> <br>
		<br>
		<br>

		<form method="post" action="ScreenRegPro.jsp" class="formCenter">
			<table>
				<tr>
					<td id="title">상영관번호</td>
					<td><input type="text" name="screenid" maxlength="10">
					</td>
				</tr>
				<tr>
					<td id="title">좌석수</td>
					<td><input type="text" name="seatnumber" maxlength="10">
					</td>
				</tr>
				<tr>
					<td id="title">영화관이름</td>
					<td><select name='theatername'>
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
									String sql = "select * from 영화관";
									pstmt = conn.prepareStatement(sql);
									rs = pstmt.executeQuery();
									while (rs.next()) {
										String theatername = rs.getString("영화관이름");
							%>
							<option value=<%=theatername%>><%=theatername%></option>
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
			</table>
			<br> 
			<input type="hidden" name="id" value="<%=id%>">
			<input type="submit" value="등록" /> <input type="reset"
				value="취소">
		</form>
	</div>
</body>
</html>