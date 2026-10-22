package com.phonestore;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.setCharacterEncoding("UTF-8");

        String usernameInput = request.getParameter("username");
        String passwordInput = request.getParameter("password");

        try (Connection conn = DBUtils.getConnection()) {
            String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usernameInput);
            stmt.setString(2, passwordInput);

            stmt.executeUpdate();
            stmt.close();

            response.sendRedirect("index.jsp?msg=registered");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=failed");
        }
    }
}