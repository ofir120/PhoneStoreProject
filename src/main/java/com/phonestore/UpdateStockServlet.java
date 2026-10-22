package com.phonestore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateStockServlet")
public class UpdateStockServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String role = (String) request.getSession().getAttribute("userRole");
        if (!"admin".equals(role)) {
            response.sendRedirect("store.jsp");
            return;
        }

        int phoneId = Integer.parseInt(request.getParameter("phoneId"));
        int newStock = Integer.parseInt(request.getParameter("newStock"));


        try (Connection conn = DBUtils.getConnection()) {
            String sql = "UPDATE phones SET stock = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, newStock);
            stmt.setInt(2, phoneId);

            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("store.jsp");
    }
}