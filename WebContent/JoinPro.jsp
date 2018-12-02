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
    int phone = Integer.parseInt(request.getParameter("phone"));
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    
    try{
       String jdbcUrl = "jdbc:mysql://localhost:3306/termp?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&useSSL=false";
       String dbId = "root";
       String dbPass = "admin";
       
       
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
       
       String sql = "insert into customer values(?,?,?,?,?,?,?)";
       pstmt = conn.prepareStatement(sql);
       
       pstmt.setString(1,id);
       pstmt.setString(2,passwd);
       pstmt.setString(3,name);
       pstmt.setString(4,birth);
       pstmt.setString(5,address);
       pstmt.setInt(6,phone);
       pstmt.setInt(7,0);
       pstmt.executeUpdate();     
       
       str = "customer 테이블에 새로운 레코드를 추가했습니다.";
    }catch(Exception e) {
       e.printStackTrace();
       str = "customer 테이블에 새로운 레코드를 추가에 실패했습니다.";
    }finally {
       if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
       if(conn != null) try{conn.close();}catch(SQLException sqle){}
    }
  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>레코드 추가</title>
</head>
<body>
   <%=str %>
</body>
</html>
