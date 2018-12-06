<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
    <title>영화관 추가</title> 
    <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
      	}
       .formCenter{
			position:absolute;
			top:50%;
			left:50%;
		 	transform:translate(-50%, -50%);		  
		}

    </style>
</head>
<body>

    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">영화관추가</font></b>
        <br><br><br>
        
        <form method="post" action="addTheaterPro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">영화관이름</td>
                    <td>
                        <input type="text" name="theatername" maxlength="10">    
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
            <input type="submit" value="등록"/>  <input type="reset" value="취소">
        </form>
    </div>
</body>
</html>