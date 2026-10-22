<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
<head>
<link rel="stylesheet" href="style.css">
    <title>אודות החנות</title>
</head>
<body>
    <h1>אודות PhoneStore 📱</h1>
    <p>ברוכים הבאים לחנות הטלפונים המובילה!</p>
    <p>אנו מציעים את המכשירים החדישים ביותר בשוק במחירים ללא תחרות ושירות מעולה.</p>

    <br><br>
    <a href="store.jsp" style="padding: 10px 20px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px;">
        מעבר לקטלוג המוצרים
    </a>
</body>
</html>