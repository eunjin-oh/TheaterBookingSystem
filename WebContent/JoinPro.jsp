<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
 <% 
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    String name = request.getParameter("name");
    String birth = request.getParameter("birth");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    
    try{
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
       String dbId = "root";
       String dbPass = "admin";
       
       
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
       
       String sql = "insert into 회원 values(?,?,?,?,?,?,?,?)";
       pstmt = conn.prepareStatement(sql);
       
       pstmt.setString(1,id);
       pstmt.setString(2,passwd);
       pstmt.setString(3,name);
       pstmt.setString(4,birth);
       pstmt.setString(5,address);
       pstmt.setString(6,phone);
       pstmt.setInt(7,0);
       pstmt.setInt(8,0);
       pstmt.executeUpdate();     
       
       str = "회원 테이블에 새로운 레코드를 추가했습니다.";
    }catch(Exception e) {
       e.printStackTrace();
       str = "회원 테이블에 새로운 레코드를 추가에 실패했습니다.";
    }finally {
       if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
       if(conn != null) try{conn.close();}catch(SQLException sqle){}
    }
  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
 	<script src="script.js" type="text/javascript"></script>
<style rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입확인</title>
<style>
        #wrap{
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
</head>
<body>

 <%  request.setCharacterEncoding("UTF-8");  %>
 <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=name%></font>님 가입을 축하드립니다.
        <br><br>     
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=id %></td>
            </tr>                       
            <tr>
                <td id="title">비밀번호</td>
                <td><%=passwd %></td>
            </tr>                   
            <tr>
                <td id="title">이름</td>
                <td><%=name %></td>
            </tr>                  
            <tr>
                <td id="title">생년월일</td>
                <td>
                <%=birth %>
            </tr>
            <tr>
                <td id="title">휴대전화</td>
                <td><%=phone %></td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td>
                    <%=address %>
                </td>
            </tr>
        </table>
        
        <br>
      <a href="#" class="button" type="submit" onclick="move('loginForm.jsp');"/>로그인하기</a>
    </div>
</body>
</html>
