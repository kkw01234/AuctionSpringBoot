<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring Boot Application with JSP</title>
</head>
<body>
Hello, Spring Boot App
<form action="/login" method="post">
    아이디 : <input type="text" name="id"/> <br/>
    비밀번호 : <input type="password" name="password"/> <br/>
    <input type="submit" value="로그인"/>
    <input type="button" value="아이디/비밀번호 찾기"/>
    <input type="button" value="회원가입"/>

</form>



</body>
</html>