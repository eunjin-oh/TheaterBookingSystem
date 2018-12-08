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
<meta charset="EUC-KR">
</head>
<body>
<%   
   int movieid = Integer.parseInt(request.getParameter("movieid"));
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try{
      String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
      String dbId = "root";
      String dbPass = "admin";
      
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      String sql = "select * from 영화 where 영와번호="+movieid+";";
   
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      
      while(rs.next()){
         String moviename = rs.getString("영화명");
         String runtime = rs.getString("상영시간");
         String director = rs.getString("감독명");
         String actors = rs.getString("출연배우명");
         String rating = rs.getString("상영등급");
         String etcinfo = rs.getString("주요정보");
         String fileName = rs.getString("이미지");         
   %>
   <div id="wrap">
      <br><br>
           <b><font size="6" color="gray">영화정보</font></b>
           <br><br><br>      
           <form action="" class="formCenter">
              <table>
                 <tr>
            <td><img src="../phto/<%=fileName%>" width="500" height="300"></td>         
            </tr>                
            <tr>
               <td>영화번호</td>
               <td><%=movieid%></td>
            </tr>
            <tr>
               <td>영화이름</td>
               <td><%=moviename%></td>
            </tr>
            <tr>
               <td>상영시간</td>
               <td><%=runtime%></td>
            </tr>
            <tr>
               <td>감독명</td>
               <td><%=director%></td>
            </tr>
            <tr>
               <td>출연배우</td>
               <td><%=actors%></td>
            </tr>
            <tr>
               <td>상영등급</td>
               <td><%=rating%></td>
            </tr>
            <tr>
               <td>주요정보</td>
               <td><%=etcinfo%></td>
            </tr>
         </table>
         <input type="submit" value="예매하기"/>
       </form>
   </div>
</body>
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
</html>