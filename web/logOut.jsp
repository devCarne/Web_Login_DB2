<%--
  Created by IntelliJ IDEA.
  User: kms
  Date: 2022-01-05
  Time: 오후 2:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.removeAttribute("name");
    session.removeAttribute("grade");
    out.print("<script>alert('로그아웃 되었습니다.');location.href='index.jsp';</script>");
%>
</body>
</html>
