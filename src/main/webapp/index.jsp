<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<link rel="stylesheet" href="style.css">
    <title>התחברות לחנות</title>
</head>
<body>
    <h2>התחברות למערכת 🔒</h2>


    <form action="loginServlet" method="POST">
        שם משתמש: <input type="text" name="username" required><br><br>
        סיסמה: <input type="password" name="password" required><br><br>
        <input type="submit" value="היכנס">
    </form>

    <br><br><br>
        <a href="register.jsp">אין לך חשבון? הירשם כאן</a>
</body>
</html>