<%@ page import="java.sql.*" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-01-04
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    Connection connection;
    Statement statement;
%>
<%
    request.setCharacterEncoding("UTF-8");
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "1111");
        statement = connection.createStatement();

        String sql = "INSERT INTO tbl_members VALUES (" +
                "'" + request.getParameter("id") + "'," +
                "'" + request.getParameter("password") + "'," +
                "'" + request.getParameter("name") + "', " +
                "'" + request.getParameter("gender") + "'," +
                "'" + Arrays.toString(request.getParameterValues("hobby")) + "'," +
                "'" + Arrays.toString(request.getParameterValues("regPath")) + "'," +
                "'" + request.getParameter("grade") + "')";
        statement.executeUpdate(sql);
%>
<script>
    alert("회원가입을 환영합니다.");
</script>
<%
        response.sendRedirect("index.jsp");
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
%>
<script>
    alert("입력 정보를 다시 검토해주세요.");
    history.go(-1);
</script>
<%
    }
%>
</body>
</html>