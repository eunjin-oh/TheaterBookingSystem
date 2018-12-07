<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>영화관정보수정</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<% 
	String id = request.getParameter("id");
	String movieid = request.getParameter("movieid");
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
    </header>
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">영화정보수정</font></b>
        <br><br><br>
        
        <form method="post" action="updateMoviePro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">영화번호</td>
                    <td>
                        <input type="hidden" name="movieid" value="<%=movieid %>"/><%=movieid%>
                    </td>
                </tr>                      
                <tr>
                    <td id="title">영화명</td>
                    <td>
                        <input type="text" name="moviename" maxlength="20">
                    </td>
                </tr>   
                <tr>
                    <td id="title">상영시간</td>
                    <td>
                        <input type="text" name="runtime" maxlength="10">
                    </td>
                </tr>                  
                <tr>
                    <td id="title">감독명</td>
                    <td>                
                        <input type="text" name="director" maxlength="10">                     
                    </td>
                </tr>
                <tr>
                    <td id="title">출연배우명</td>
                    <td>
                        <input type="text" name="actors" maxlength="10">
                    </td>
                </tr>        
                <tr>
                    <td id="title">상영등급</td>
                    <td>
                        <select name='rating'>
			                <option value='ALL'>전체관람가</option>
			                <option value='12'>12세관람가</option>
			                <option value='15'>15세관람가</option>
			                <option value='18'>청소년관람불가</option>
			            </select>
                    </td>
                </tr>
                <tr>
                    <td id="title">주요정보</td>
                    <td>
                        <input type="text" name="etcinfo" maxlength="30">
                    </td>
                </tr>     
            </table>
            <input type="hidden" name="id" value="<%=id%>"/>
            <br>
            <a href="updateMoviePro.jsp>" class="button" type="submit">수정</a>
            <a href="MovieInfo.jsp?id=<%=id%>" class="button" type="submit">취소</a>
       </form>
</body>
</html>