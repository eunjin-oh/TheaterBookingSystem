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
  <% String id = request.getParameter("id"); %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none;}
</style>
		<link rel="stylesheet" href="assets/css/main.css" />
	
<body>
<header >
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
            <a href="reservationInfo.jsp?id=<%=id%>">예약예매</a>
          </div>
   		</div>
   		</div>
    </header>
	<b><%=id %></b>님이 로그인 하셨습니다.
	<form method="post" action="../cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	<center><h1>영화예매</h1>
<div class="w3-content w3-section" style="float:center" >
  <img class="mySlides" src="photo/snsd.jpg" style="width: 700px; height: 400px;">
  <img class="mySlides" src="photo/yourname.jpg" style="width: 700px; height: 400px;">
  <img class="mySlides" src="photo/animal.png" style="width: 700px; height: 400px;">
</div>
</center>
<br><br><br><br>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
<form style="text-align:center;">
<input type="text" name="subject" placeholder="영화검색" style="width: 100%; text-align:center; font-size:40px;">
<input type="submit" value="검색">
</form>

<%





%>
<div id="wrapper">
			<div id="main">
				<div class="inner">							
					<section class="tiles">
						<article class="style1">
							<span class="image">
								<img src="photo/bohemian.jpeg" alt="" />
							</span>
							<a href="#">
								<div class="content">
								<h2>보헤미안 랩소디</h2>
									<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
								</div>
							</a>
						</article>
						<article class="style2">
							<span class="image">
								<img src="photo/perfect.jpg" alt="" />
							</span>
							<a href="#">
								<div class="content">
								<h2>완벽한 타인</h2>
									<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
								</div>
							</a>
						</article>
						<article class="style3">
						<span class="image">
								<img src="photo/sbhan.jpg" alt="" />
							</span>
							<a href="#">
								<div class="content">
								<h2>신비한 동물사전</h2>
									<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
								</div>
							</a>
						</article>
						<article class="style4">
							<span class="image">
								<img src="photo/again.jpg" alt="" />
							</span>
							<a href="#">
							<div class="content">
							<h2>비긴어게인</h2>
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
							</div>
							</a>
						</article>
							<article class="style5">
							<span class="image">
								<img src="photo/city.jpg" alt="" />
							</span>
							<a href="#">
								<div class="content">
								<h2>범죄도시</h2>
									<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
								</div>
							</a>
						</article>
						<article class="style6">
						<span class="image">
								<img src="photo/kabin.jpg" alt="" />
							</span>
							<a href="#">
								<div class="content">
								<h2>케빈에 대하여</h2>
									<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
								</div>
							</a>
						</article>
						<article class="style2">
							<span class="image">
								<img src="photo/life.jpg" alt="" />
							</span>
							<a href="#">
								<div class="content">								
								<h2>라이프</h2>
									<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
								</div>
							</a>
						</article>
						<article class="style3">
							<span class="image">
							<img src="photo/nim.jpg" alt="" />
							</span>
							<a href="#">
								<div class="content">
								<h2>님은 먼곳에</h2>
									<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
								</div>
							</a>
						</article>
						<article class="style1">
							<span class="image">
								<img src="photo/sunrise.jpg" alt="" />
							</span>
							<a href="#">
								<div class="content">
								<h2>비포 선라이즈</h2>
									<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
								</div>
							</a>
						</article>
						<article class="style5">
							<span class="image">
								<img src="" alt="" />
							</span>
							<a href="#">
								<div class="content">
							<h2></h2>
									<p></p>
								</div>
							</a>
						</article>	
						<article class="style6">
							<span class="image">
								<img src="" alt="" />
							</span>
							<a href="#">
								<div class="content">
								<h2></h2>
									<p></p>
								</div>
							</a>
						</article>
						<article class="style4">
							<span class="image">
								<img src="" alt="" />
							</span>
							<a href="#">
								<div class="content">
								<h2></h2>
									<p></p>
								</div>
							</a>
						</article>
					</section>
				</div>
			</div>
		</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>


</body>
</html>
