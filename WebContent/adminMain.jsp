<!doctype html>
<html lang="kr">
   <head>
   <meta charset="UTF-8">
   <title>http://www.blueb.co.kr</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style rel="stylesheet">
body {
   font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
   color: #333333;
   background: #596778;
}
</style>
</head>
<body>

<form class="signUp" id="signupForm" action="logCheck.jsp">
   <h1 class="signUpTitle">로그인 하기</h1>
   <input type="text" name = "id" class="signUpInput" placeholder="아이디" autofocus required>
   <input type="password" name ="password" class="signUpInput" placeholder="비밀번호" required>
   학생<input type="radio" name="login" value="stu" value="학생">
   교수<input type="radio"  name="login" value="pro" value="교수">
   관리자<input type="radio" name="login"  value="man" value="관리자">

   <input type="submit" value="로그인" class="signUpButton">
</form>

</body>
</html>