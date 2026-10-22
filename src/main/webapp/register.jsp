<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
    <title>הרשמה</title>
</head>
<body>

    <h2>הרשמה למערכת</h2>


    <% if ("failed".equals(request.getParameter("error"))) { %>
        <p style="color: red;">שגיאה: שם המשתמש כבר קיים או שקרתה תקלה.</p>
    <% } %>

    <form action="registerServlet" method="post">
        שם משתמש: <input type="text" name="username" required> <br><br>
        סיסמה: <input type="password" name="password" required> <br><br>

        <button type="submit">הירשם</button>
    </form>

    <br>
    <a href="index.jsp">כבר יש לך חשבון? התחבר כאן</a>

</body>
</html>