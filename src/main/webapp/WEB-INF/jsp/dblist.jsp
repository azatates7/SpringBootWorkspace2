<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<h2>Hello ${name}!</h2>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/mytestdb"
                   user="root" password=""/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from user;
</sql:query>

<table style="width:80%; border: 2px solid black">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>userkey</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td style="text-align:center"><c:out value="${row.id}"/></td>
            <td style="text-align:center"><c:out value="${row.name}"/></td>
            <td style="text-align:center"><c:out value="${row.userkey}"/></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>