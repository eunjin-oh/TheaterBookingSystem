<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 
<%! // 선언부
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	ResultSet rs = null;
%>
 
<% 
    try{         
    	String jdbcUrl = "jdbc:mysql://localhost:3306/db_termp?useUnicode=true&characterEncoding=UTF-8";
		String dbId = "root";
		String dbPass = "euncha315^^";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select * from 상영관";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>

<form action="delete_do.jsp" method="post">
<table border="1" cellspacing="0">
<tr>
<td>상영관번호</td>
<td>좌석수</td>
<td>영화관</td>
<th>비고</th>
</tr>
<%
    while(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
%><tr>
<td><%=rs.getInt("상영관번호")%></td>
<td><%=rs.getString("좌석수")%></td>
<td><%=rs.getString("영화관이름")%></td>
<!--  <td><a href="delete_do.jsp?del=<%=rs.getString(1)%>">삭제</a>
</td>-->
</tr>
<%
    } // end while
%></table>
</form>
<%
  rs.close();        // ResultSet exit
  pstmt.close();     // Statement exit
  conn.close();    // Connection exit
}
catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>

<%/*
        while(rs.next()){
            int id = rs.getInt("상영관번호");
            String name = rs.getString("좌석수");
            String addr = rs.getString("영화관이름");
            System.out.println("id : " + id + " name : " + name + " address : " + addr);
        }
        conn.commit();
    }catch(Exception e){
        e.printStackTrace();
        //conn.rollback();
    }finally{
        if ( rs != null ) rs.close();
        if ( pstmt != null ) pstmt.close();
        if ( conn != null ) conn.close();
    }
*/%>

</body>
</html>