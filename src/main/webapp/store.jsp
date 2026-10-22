<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*, com.phonestore.DBUtils" %>
<%
    if (session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
<head>
    <link rel="stylesheet" href="style.css">
    <title>חנות טלפונים - קטלוג</title>
</head>
<body >
    <h2>קטלוג המכשירים 📱</h2>

   <table border="1" cellpadding="8" style="border-collapse: collapse; width: 100%; text-align: center;">
           <tr style="background-color: #f2f2f2;">
               <th>שם המכשיר</th>
               <th>מחיר</th>
               <th>כמות במלאי</th>
               <% if ("admin".equals(session.getAttribute("userRole"))) { %>
                   <th>פעולות מנהל: </th>
               <% } %>
           </tr>
           <%
               try (Connection conn = DBUtils.getConnection();
                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM phones");
                    ResultSet rs = stmt.executeQuery()) {
                   while (rs.next()) {
                       int phoneId = rs.getInt("id");
                       int stock = rs.getInt("stock");
           %>
           <tr>
               <td><%= rs.getString("name") %></td>
               <td><%= rs.getDouble("price") %> ₪</td>
               <td><%= stock %></td>


               <% if ("admin".equals(session.getAttribute("userRole"))) { %>
                   <td>

                       <form action="updateStockServlet" method="POST" style="display:inline-block;margin-left: 5px ;">
                           <input type="hidden" name="phoneId" value="<%= phoneId %>">
                           <input type="number" name="newStock" value="<%= stock %>" min="1" required>
                           <input type="submit" value="עדכן מלאי">
                       </form>


                       <form action="deleteProductServlet" method="POST" style="display:inline-block;margin-left: 10px">
                           <input type="hidden" name="phoneId" value="<%= phoneId %>">
                           <input type="submit" value="מחק">
                       </form>
                   </td>
               <% } %>
           </tr>
           <%
                   }
               } catch (Exception e) { e.printStackTrace(); }
           %>
       </table>

    <% if ("admin".equals(session.getAttribute("userRole"))) { %>
        <hr style="margin: 40px 0;">
        <h3>אזור מנהל: הוספת מכשיר חדש למלאי </h3>
        <form action="addProductServlet" method="POST">
            שם המכשיר: <input type="text" name="phoneName" required>
            מחיר: <input type="number" step="0.01" name="price" required>
            כמות: <input type="number" name="stock" min="1" required>
            <input type="submit" value="הוסף מוצר">
        </form>
    <% } %>
</body>
</html>