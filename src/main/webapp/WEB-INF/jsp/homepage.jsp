<%@ page import="java.sql.Connection,java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<%@ page import="java.io.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
    int counter = 0;
    Connection connection;
    String connectionURL = "jdbc:mysql://localhost/mytestdb";
    ResultSet rs = null;
    Statement statement;
%>

<!DOCTYPE html>
<html>
<head>
    <title>HomePage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>

    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/css/mycss.css"/>
<script>
        function openWin() {
            ex = window
                .open("https://www.geeksforgeeks.org", "_blank", "width=786, height=786");
        }

        function closeWin() {
            ex.close();
        }
    </script>

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Logo</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="" class="digital-clock"></a></li>
                <li><a href="#">About</a></li>
                <li><a href="https://github.com/azatates7">Github</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a onlick="closeWin();"><span class="glyphicon glyphicon-log-in"></span>Close</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-2 sidenav">
            <h4>${message}</h4>
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#section1">Home</a></li>
                <li><a href="https://www.facebook.com/">Facebook</a></li>
                <li><a href="https://www.injavawetrust.com/">JAVA</a></li>
                <li><a href="https://www.imdb.com/user/ur68246206/lists?ref_=nv_usr_lst_3">IMDb</a></li>
            </ul>
            <br>
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search Blog..">
                <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>

            </div>
        </div>
        <div class="col-sm-8 text-left">
            <h4 style="text-align:center">

                All Records Showing Step by Step...

                <form action="homepage" method="get"><%
                    if (request.getParameter("showdata") != null) {
                        counter = Integer.parseInt(request.getParameter("showdata"));
                        if (counter <= 0) {
                            counter = 0;
                        }
                    }

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                        connection = DriverManager.getConnection(connectionURL, "root", "");
                        statement = connection.createStatement();
                        rs = statement.executeQuery("select * from user");
                        for (int i = 0; i < counter; i++) {
                            rs.next();
                        }
                if (!rs.next()) {

                        out.println("All Records Showed");
                    }
                    else {

%>
                        <table align="center">
                            <tr>
                                <th style="text-align:center">id</th>
                                <td><%= rs.getInt(1)%>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:center">Name</th>
                            <td><%= rs.getString(2)%>
                            </td>
                        </tr>
                        <tr style="text-align:center">
                            <th style="text-align:center">Userkey</th>
                            <td><%= rs.getString(3)%>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <button <input type="hidden" name="showdata" value="<%=counter - 1%>" /> Before Record />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="dblist" target="_blank">Show All Records</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <button <input type="hidden" name="showdata" value="<%=counter + 1%>" /> Next Record />
                    <%
                            }
                        }
                    catch (Exception ex) {
                        String redirectURL = "error";
                        response.setStatus(301);
                        response.setHeader( "Location", redirectURL);
                        response.setHeader("Connection", "close");
                                         }
                    %>
                </form>
            </h4>

            <h4>Leave a Comment:</h4>
            <form role="form" action="sendcomment.jsp">
                <div class="form-group">
                    <textarea class="form-control" rows="3" required></textarea>
                </div>
                <button type="submit"class="btn btn-success">Submit</button>
            </form>
            <br><br>
        </div>
</div>

    <%
    String filename = "src/main/resources/static/txt/counter.txt";
    File file = new File(filename);
    if (!file.exists()) {
        file.createNewFile();
    }
    BufferedReader reader = new BufferedReader(new FileReader(filename));
    String line=null;
    while (reader.ready()) {
        line=reader.readLine();
    }
    int times = Integer.valueOf(line);
    //System.out.println(times);
    reader.close();

    FileWriter fileWriter = new FileWriter(filename);
    PrintWriter printWriter = new PrintWriter(fileWriter);
    printWriter.print(times+1);
    printWriter.close();

    BufferedReader reader2 = new BufferedReader(new FileReader(filename));
    String line2=null;
    while (reader2.ready()) {
        line2=reader2.readLine();
    }
    //System.out.println(line2);
    int gettime = Integer.valueOf(line2);
    reader2.close();
    %>

<footer class="container-fluid text-center">
    <small> &copy; Copyright 2019 &nbsp;&nbsp;&nbsp;&nbsp; You come this link <%=gettime%> times </small>
</footer>

</body>
</html>