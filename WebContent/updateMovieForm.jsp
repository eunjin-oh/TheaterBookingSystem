<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>레코드 수정</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">영화정보수정</font></b>
        <br><br><br>
        
        <form method="post" action="updateMoviePro.jsp" class="formCenter">
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
            <input type="submit" value="수정"/>  <input type="button" value="취소">
        </form>
</body>
</html>