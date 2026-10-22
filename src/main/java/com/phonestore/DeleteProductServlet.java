package com.phonestore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteProductServlet")
public class DeleteProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {


        String role = (String) request.getSession().getAttribute("userRole");
        if (!"admin".equals(role)) {
            response.sendRedirect("store.jsp");
            return;
        }

        int phoneId = Integer.parseInt(request.getParameter("phoneId"));


        try (Connection conn = DBUtils.getConnection()) {
            String sql = "DELETE FROM phones WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, phoneId);

            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("store.jsp");
    }
}