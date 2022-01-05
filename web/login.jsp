        <%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-01-04
  Time: 오전 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Connection connection;
    Statement statement;
    ResultSet resultSet;
%>
        <%
            request.setCharacterEncoding("UTF-8");
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "1111");
                statement = connection.createStatement();

//                String sql = "SELECT id, password, name, grade FROM tbl_members WHERE id = '" + request.getParameter("loginID") +"'";
//                resultSet = statement.executeQuery(sql);

                String sql2 = "SELECT id, password, name, grade FROM tbl_members WHERE id = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setString(1, request.getParameter("loginID"));
                resultSet = preparedStatement.executeQuery();

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%

        try{
            if(resultSet.next()) {
                if (resultSet.getString(2).equals(request.getParameter("loginPassword"))) {
                    session.setAttribute("name", resultSet.getString(3));
                    session.setAttribute("grade", resultSet.getString(4));
                    response.sendRedirect("mainPage.jsp");
                } else {
                    out.print("<script>alert('비밃번호가 잘못되었습니다.');history.go(-1);</script>");
                }
            } else {
                out.print("<script>alert('등록된 아이디가 아닙니다.');history.go(-1);</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
