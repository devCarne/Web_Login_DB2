<%--
  Created by IntelliJ IDEA.
  User: kms
  Date: 2022-01-05
  Time: 오후 2:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = (String) session.getAttribute("name");
    String grade = (String) session.getAttribute("grade");
%>
<html>
<head>
    <style>
        div {
            float: right;
            width: 230px;
            text-align: center;
        }
        .gradeInfo {
            background-color: <%=grade%>;
        }
    </style>
    <title>Title</title>
</head>
<body>
<script>
    window.history.forward();
</script>
<header>
    <div>
        <p><%=name%>님 반갑습니다.</p>
        <p class="gradeInfo">회원님의 등급은 <%=grade%>입니다.</p>
        <form action="logOut.jsp" method="get">
            <input type="submit" value="로그아웃">
        </form>
    </div>
</header>
</body>
</html>
