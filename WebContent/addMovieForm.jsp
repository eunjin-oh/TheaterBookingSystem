<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%  request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
    <title>회원가입 화면</title> 
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
        <b><font size="6" color="gray" >영화추가</font></b>
        <br><br><br>
        
        <form method="post" action="addMoviePro.jsp" class="formCenter">
            <table>
                <tr>
                    <td id="title">영화번호</td>
                    <td>
                        <input type="text" name="movieid" maxlength="10">    
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
            <br>
            <input type="submit" value="등록"/>  <input type="reset" value="취소">
        </form>
    </div>
</body>
</html>