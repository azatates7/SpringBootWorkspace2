<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8"/>
    <title>Welcome</title>
</head>
<body>
<h1>Welcome</h1>
<h2>${message}</h2>

<a href="${pageContext.request.contextPath}/dblist">User List</a><br>
<a href="${pageContext.request.contextPath}/homepage">Homepage</a>

</body>
</html>