/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminDeskServlet", urlPatterns = {"/admin-desk"})
public class Admin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Connect to the database
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/meet", "root", "");
                
                // Query to count the number of recharges
                String sql = "SELECT COUNT(*) AS recharge_count FROM recharges";
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                
                if (rs.next()) {
                    int rechargeCount = rs.getInt("recharge_count");
                    request.setAttribute("rechargeCount", rechargeCount);
                    request.getRequestDispatcher("admin-desk.jsp").forward(request, response);
                }
                
                con.close();
            } catch (ClassNotFoundException | SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin Desk Servlet";
    }
}


