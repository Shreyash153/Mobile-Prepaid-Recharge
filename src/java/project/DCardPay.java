/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Bitu
 */
@WebServlet(name = "DCardPay", urlPatterns = {"/DCardPay"})
public class DCardPay extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DCardPay</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DCardPay at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
            
            String card1=request.getParameter("cardNumber");
            String m1=request.getParameter("expiryMonth");
            String y1=request.getParameter("expiryYear");
            String cvv1=request.getParameter("cvCode");
            int m2=Integer.parseInt(m1);
            int y2=Integer.parseInt(y1);
            int cvv2=Integer.parseInt(cvv1);
            HttpSession session=request.getSession();
//            String amoun=(String) session.getAttribute("amount");
//            int amount=Integer.parseInt(amoun);
            String amoun = (String) session.getAttribute("amount");
            float amount = Float.parseFloat(amoun);

            out.println(card1+" "+m1+" "+y1+" "+cvv1);
            int flag=0,amount2=0;
            
            try{
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/meet","root","Shreyash@153");
            Statement stmt=con.createStatement();
            String sql="select * from debitcards";
            ResultSet rs=stmt.executeQuery(sql);
            
            
            while(rs.next())
            {
                String card3=rs.getString("Number");
                String m3=rs.getString("MM");
                String y3=rs.getString("YY");
                String cvv3=rs.getString("CVV");
                int m4=Integer.parseInt(m3);
                int y4=Integer.parseInt(y3);
                int cvv4=Integer.parseInt(cvv3);
                out.println(card3+" "+m4+" "+y4+" "+cvv4);
                if(card1.equals(card3))
                {
                    if(m2==m4 && y2==y4 && cvv2==cvv4)
                    {
                        String amount1=rs.getString("Balance");
                        amount2=Integer.parseInt(amount1);
                        if(amount<=amount2)
                        {
                            //int rem=amo-amount;
                            //sql="update debitcards set Balance="+rem+" where Number="+card;
                            //stmt.executeUpdate(sql);
                            flag=1;
                        }
                        else
                        {
                            flag=2;
                        }
                        //flag=1;
                        break;
                    }                    
                }
                out.println(flag);
            }
            if(flag==0)
            {
                session.setAttribute("debit", "debit");
            }
            out.println(flag);
            sql="insert into transactions(User_mobile,Mobile_mobile,Operator,Amount,Status,Payment_method,Time) values(?,?,?,?,?,?,CURRENT_TIMESTAMP)";
            //HttpSession session=request.getSession();
            String user_mobile=(String) session.getAttribute("mobile");
            String mobile_mobile=(String) session.getAttribute("mobile_mobile");
            String operator=(String) session.getAttribute("operator");
            String status="";
            out.println(sql);
            if(flag==1)
            {
                status="SUCCESS";
            }
                
            else
            {
                status="FAIL";
            }
            out.println(status);  
            String method="Card";
            Date d=new Date();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,user_mobile);
            ps.setString(2,mobile_mobile);
            ps.setString(3,operator);
            ps.setInt(4,amount);
            ps.setString(5,status);
            ps.setString(6,method);
            //ps.setDate(7, d);
            //out.println(status);
            ps.executeUpdate();
           // out.println(status);
            
            if(flag==1)
            {
                int rem=amount2-amount;
                sql="update debitcards set balance="+rem+" where number="+card1;
                stmt.executeUpdate(sql);
                response.sendRedirect("FinalPage.jsp");
            }
            else
            {    
                response.sendRedirect("DCard.jsp");
            }
            }catch(Exception e)
            {
                out.println(e);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DCardPay.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DCardPay.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DCardPay.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DCardPay.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
