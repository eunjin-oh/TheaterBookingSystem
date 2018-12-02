<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="java.sql.*" %>
<%@ page import="login.LogonDBBean" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="customer" class="login.LogonDataBean">
	<jsp:setProperty name="customer" property="*"/>
</jsp:useBean>

<%
	//customer.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean logon = LogonDBBean.getInstance();
	logon.insertcustomer(customer);
%>

<jsp:getProperty property="id" name="customer"/>님 회원가입을 축하합니다.