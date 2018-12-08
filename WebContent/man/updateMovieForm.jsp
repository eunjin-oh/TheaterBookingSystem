<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>영화관정보수정</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<% 
	String id = request.getParameter("id");
	int movieid = Integer.parseInt(request.getParameter("movieid"));
%>
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
            </div>
    </header>
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	
	<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select * from 영화 where 영화번호='"+movieid+"';";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
				
		while(rs.next()){
			int passwd = rs.getInt("영화번호");
			String moviename = rs.getString("영화명");
			String runtime = rs.getString("상영시간");
			String director = rs.getString("감독명");
			String actors = rs.getString("출연배우명");
			String rating = rs.getString("상영등급");
			String etcinfo = rs.getString("주요정보");
			String fileName = rs.getString("이미지");			
			System.out.println(passwd);
	%>
	
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">영화정보수정</font></b>
        <br><br><br>
        
        <form action="updateMoviePro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">영화번호</td>
                    <td><input type="hidden" name="movieid" value="<%=movieid%>"><%=movieid%></td>
                </tr>                      
                <tr>
                    <td id="title">영화명</td>
                    <td><input type="text" name="modi_moviename" value="<%=moviename%>" maxlength="20"></td>
                </tr>   
                <tr>
                    <td id="title">상영시간</td>
                    <td><input type="text" name="modi_runtime" value="<%=runtime %>" maxlength="10"></td>
                </tr>                  
                <tr>
                    <td id="title">감독명</td>
                    <td><input type="text" name="modi_director" value="<%=director%>" maxlength="10"></td>
                </tr>
                <tr>
                    <td id="title">출연배우명</td>
                    <td><input type="text" name="modi_actors" value="<%=actors%>" maxlength="10"></td>
                </tr>        
                <tr>
                    <td id="title">상영등급</td>
                    <td>
                        <select name='modi_rating'>
                        	<option value="<%=rating%>" selected="seleceted"><%=rating%></option>
			                <option value='전체관람가'>전체관람가</option>
			                <option value='12세관람가'>12세관람가</option>
			                <option value='15세관람가'>15세관람가</option>
			                <option value='청소년관람불가'>청소년관람불가</option>
			            </select>
                    </td>
                </tr>
                <tr>
                    <td id="title">주요정보</td>
                    <td><input type="text" name="modi_etcinfo" value="<%=etcinfo%>" maxlength="30"></td>
                </tr>   
                <tr>
                <td id="title">이미지 등록</td>
                <td><input type="file" name="modi_fileName" value="<%=fileName%>"></td>
                </tr>    
            </table>
            <input type="hidden" name="id" value="<%=id%>">
            <br>
            <input type="submit" value="수정">
            <a href="MovieInfo.jsp?id=<%=id%>" class="button" type="submit">취소</a>
       </form>
       </div>
       <%
		}
	}catch(Exception e){
				e.printStackTrace();
	}finally{
	if(rs != null) try{rs.close();}catch(SQLException sqle){}
	if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
</body>
</html>