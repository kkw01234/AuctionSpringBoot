<%@ page import="io.kkw.auction.spring.bean.AucUserBean" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String id = (String) request.getAttribute("userid");
   String password = (String) request.getAttribute("password");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring Boot Application with JSP</title>
</head>
<body>
Hello, Spring Boot App
<h2>메인페이지</h2>
<a href="/loginpage"> 로그인 페이지로</a>
<a href="/registerpage"> 회원가입란</a>
<h2 class="test">ID : <%=id%>, Password : <%=password%></h2>
</body>
<script>


</script>
</html>