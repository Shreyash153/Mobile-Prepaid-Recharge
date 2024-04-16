/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bitu
 */
@WebServlet(name = "signin", urlPatterns = {"/signin"})
public class signin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
            String username=request.getParameter("username");
            String gender=request.getParameter("gender");
            String pass1=request.getParameter("password1");
            String pass2=request.getParameter("password2");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            out.println(username+" "+gender+" "+pass1+" "+pass2+" "+email+" "+phone);
            if(!(phone.matches("[0-9]+") && phone.length()==10))
            {
                response.sendRedirect("SignUp.jsp");
            }
            else if(!pass1.equals(pass2))
            {
                RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");
                rd.forward(request, response);
            }
            else
            {
                try
                {
                    out.println(username+" "+gender+" "+pass1+" "+pass2+" "+email+" "+phone);
                    Class.forName("com.mysql.jdbc.Driver"); 
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/meet","root","Shreyash@153");
                    //out.println(username+" "+gender+" "+pass1+" "+pass2+" "+email+" "+phone);
                    
                    String sql="select Mobile from customer";
                    Statement s=con.createStatement();
                    ResultSet rs=s.executeQuery(sql);
                    int flag=0;
                    while(rs.next())
                    {
                        String m=rs.getString("Mobile");
                        if(m.equals(phone))
                        {
                            flag=1;
                            break;
                        }
                    }
                    if(flag==1)
                    {
                        HttpSession session=request.getSession();
                        session.setAttribute("exists","exists");
                        response.sendRedirect("index.jsp");
                    }
                    sql="insert into customer values(?,?,?,?,?)";
                    PreparedStatement stmt=con.prepareStatement(sql);
                    stmt.setString(1,phone);
                    stmt.setString(2,username);
                    stmt.setString(3,email);
                    stmt.setString(4,pass1);
                    stmt.setString(5,gender);
                    stmt.executeUpdate();
                    HttpSession session=request.getSession();
                    session.setAttribute("mobile", phone);
                    session.setAttribute("name", username);
                    response.sendRedirect("home1.jsp");
                }
                catch(Exception e)
                {
                    out.println(e);
                }
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
            Logger.getLogger(signin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(signin.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(signin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(signin.class.getName()).log(Level.SEVERE, null, ex);
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
