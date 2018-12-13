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
	String theatername = request.getParameter("theatername");
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
        <b><font size="6" color="gray">영화관정보수정</font></b>
        <br><br><br>
        
        <form method="post" action="updateTheaterPro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">영화관이름</td>
                    <td>
                        <input type="hidden" name="theatername" value="<%=theatername %>"/><%=theatername%>
                    </td>
                </tr>                      
                <tr>
                    <td id="title">영화관주소</td>
                    <td>
                        <input type="text" name="theateraddress" maxlength="100">
                    </td>
                </tr>   
                <tr>
                    <td id="title">영화관전화번호</td>
                    <td>
                        <input type="text" name="theaterphone" maxlength="12">
                    </td>
                </tr>                  
                <tr>
                    <td id="title">상영관 수</td>
                    <td>                
                        <input type="text" name="screennumber" maxlength="10">                     
                    </td>
                </tr>
                <tr>
                    <td id="title">총 좌석수</td>
                    <td>
                        <input type="text" name="seatnumber" maxlength="10">
                    </td>
                </tr>
            </table>
            <br>            
            <input type="hidden" name="id"value="<%=id%>"/> 
            <input type="submit" value="수정"/>  <input type="button" value="취소">
        </form>
</body>
</html>