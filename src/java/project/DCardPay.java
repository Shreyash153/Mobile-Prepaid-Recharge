package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DCardPay", urlPatterns = {"/DCardPay"})
public class DCardPay extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("text1");
        try (PrintWriter out = response.getWriter()) {
            String card1 = request.getParameter("cardNumber");
            String m1 = request.getParameter("expiryMonth");
            String y1 = request.getParameter("expiryYear");
            String cvv1 = request.getParameter("cvCode");
            int m2 = Integer.parseInt(m1);
            int y2 = Integer.parseInt(y1);
            int cvv2 = Integer.parseInt(cvv1);
            HttpSession session = request.getSession();
            String amoun = (String) session.getAttribute("amount");
            int amount = Integer.parseInt(amoun);

            int flag = 0, amount2 = 0;
            System.out.println("text2");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/meet", "root", "Shreyash@153");
                Statement stmt = con.createStatement();
                String sql = "select * from debitcards";
                ResultSet rs = stmt.executeQuery(sql);
                System.out.println("text3");
                while (rs.next()) {
                    String card3 = rs.getString("Number");
                    String m3 = rs.getString("MM");
                    String y3 = rs.getString("YY");
                    String cvv3 = rs.getString("CVV");
                    int m4 = Integer.parseInt(m3);
                    int y4 = Integer.parseInt(y3);
                    int cvv4 = Integer.parseInt(cvv3);
                    System.out.println("text4");
                    if (card1.equals(card3)) {
                        if (m2 == m4 && y2 == y4 && cvv2 == cvv4) {
                            System.out.println("text5");
                            String amount1 = rs.getString("Balance");
                            amount2 = Integer.parseInt(amount1);
                            if (amount <= amount2) {
                                flag = 1;
                                System.out.println("text6");
                            } else {
                                flag = 2;
                            }
                            break;
                        }
                    }
                }
                if (flag == 0) {
                    session.setAttribute("debit", "debit");
                }
                System.out.println("text7");
                sql = "insert into transactions(User_mobile,Mobile_mobile,Operator,Amount,Status,Payment_method,Time) values(?,?,?,?,?,?,CURRENT_TIMESTAMP)";
                String user_mobile = (String) session.getAttribute("mobile");
                String mobile_mobile = (String) session.getAttribute("mobile_mobile");
                String operator = (String) session.getAttribute("operator");
                String status = flag == 1 ? "SUCCESS" : "FAIL";
                String method = "Card";

                PreparedStatement ps = con.prepareStatement(sql);
                System.out.println("text");
                ps.setString(1, user_mobile);
                ps.setString(2, mobile_mobile);
                ps.setString(3, operator);
                ps.setInt(4, amount);
                ps.setString(5, status);
                ps.setString(6, method);

                ps.executeUpdate();
                flag=1;
                if (flag == 1) {
                    int rem = amount2 - amount;
                    sql = "update debitcards set balance=" + rem + " where number=" + card1;
                    stmt.executeUpdate(sql);
                    response.sendRedirect("FinalPage.jsp");
                } else {
                    response.sendRedirect("DCard.jsp");
                }
            } catch (ClassNotFoundException e) {
                out.println("Error: MySQL JDBC Driver not found.");
            } catch (SQLException e) {
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
        return "Short description";
    }
}
