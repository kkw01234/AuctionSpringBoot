<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring Boot Application with JSP</title>
</head>
<body>
Hello, Spring Boot App
<form action="/register" method="POST">
    ID : <input type="text" name="id">
    Password : <Input type="password" name="password">
    E-mail : <input type="email" name="email">
    Phone : <input type="text" name="phone">
    계좌번호 : <input type="text" name="account">
    주소 : <input type="text" name="address">
    <input type="submit" value="회원가입"/>
</form>


</body>
</html>