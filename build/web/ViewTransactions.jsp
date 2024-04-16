<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    if(session.getAttribute("mobile")==null)
    {
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction History</title>
    </head>
    <body>
        <style>
            
            
            
            
            
           @import url('https://fonts.googleapis.com/css?family=Amatic+SC');
            
            
            
.button_container {
	position: absolute;
  left: 0;
  right: 0;
}

.description, .link {
  font-family: 'Amatic SC', cursive;
  text-align: center;
}

.description {
	font-size: 35px;
}

.btn {
  border: none;
  display: block;
  text-align: center;
  cursor: pointer;
  text-transform: uppercase;
  outline: none;
  overflow: hidden;
  position: relative;
  color: #fff;
  font-weight: 700;
  font-size: 15px;
  background-color: #222;
  padding: 10px 60px;
  margin: 0 auto;
  box-shadow: 0 5px 15px rgba(0,0,0,0.20);
}

.btn span {
  position: relative; 
  z-index: 1;
}

.btn:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  height: 490%;
  width: 140%;
  background: #78c7d2;
  -webkit-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
  -webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
  transform: translateX(-98%) translateY(-25%) rotate(45deg);
}

.btn:hover:after {
  -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
  transform: translateX(-9%) translateY(-25%) rotate(45deg);
}

.link {
  font-size: 20px;
  margin-top: 30px;
}

.link a {
  color: #000;
  font-size: 25px; 
}    
            
            
            
            
            
            
        body {
            background-color: #ddd;
          font-family: Arial, Helvetica, sans-serif;
          background-image: url('6.jfif');background-image: url('6.jfif');
        }

        body {
            background-color: #ddd;
          font-family: Arial, Helvetica, sans-serif;
        }

        .navbar {
          overflow: hidden;
          background-color: #0062cc;
        }

        .navbar a {
          float: left;
          font-size: 16px;
          color: white;
          text-align: center;
          padding: 14px 16px;
          text-decoration: none;
        }

        .dropdown {
          float: left;
          overflow: hidden;
        }

        .dropdown .dropbtn {
          font-size: 16px;  
          border: none;
          outline: none;
          color: white;
          padding: 14px 16px;
          background-color: inherit;
          font-family: inherit;
          margin: 0;
        }

        .navbar a:hover, .dropdown:hover .dropbtn {
          background-color: cornflowerblue;
        }

        .dropdown-content {
          display: none;
          position: absolute;
          background-color: #f9f9f9;
          min-width: 160px;
          box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
          z-index: 1;
        }

        .dropdown-content a {
          float: none;
          color: black;
          padding: 12px 16px;
          text-decoration: none;
          display: block;
          text-align: left;
        }

        .dropdown-content a:hover {
          background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
          display: block;
        }
        form { 
            height: 100px;
        margin: 0 auto; 
        margin-left: 35%;
        margin-top: 15%;
        }
        
        
        
        h2{ 
      color: #4287f5; 
      } 
        
        table {
            height: 100px;
        margin: 0 auto; 
        margin-left: 17%;
        margin-top: 2%;
        }
        table{ 
      border-collapse:separate; 
      border-spacing: 0 15px; 
      } 
      th{ 
      background-color: #4287f5; 
      color: white; 
      } 
      th,td{ 
      width: 150px; 
      text-align: center; 
      border: 1px solid black; 
      padding: 5px;
      }
        
        </style>
        <div class="navbar">
            
            
            <a href="home1.jsp">Home</a>
            <a href="logout" onclick="alert("You will be logged out!!")">Log Out</a>
        </div>
        <table>
            <tr>
                <td>
                    <h2>
                        
                    Mobile No.</h2>
                </td>
                <td>
                    <h2>
                        Operator
                    </h2>
                </td>
                <td>
                    <h2>
                    Amount
                        
                    </h2>
                </td>
                <td>
                    <h2>
                        Successfull/Fail
                    </h2>
                    
                </td>
                <td>
                    <h2>
                       Method 
                    </h2>
                    
                </td>
                <td>
                    <h2>
                    Time    
                    </h2>
                    
                </td>
            </tr>
        <%
            String mobile=(String)session.getAttribute("mobile");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/meet","root","Shreyash@153");
            Statement stmt=con.createStatement();
            String sql="select * from transactions where User_mobile="+mobile;
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next())
            {
                String phone=rs.getString("Mobile_mobile");
                String Operator=rs.getString("Operator");
                String amount=rs.getString("Amount");
                String status=rs.getString("Status");
                String method=rs.getString("Payment_method");
                String time=rs.getString("Time");
                out.println("<tr>");
                out.println("<td>");
                out.println(phone);
                out.println("</td>");
                out.println("<td>");
                out.println(Operator);
                out.println("</td>");
                out.println("<td>");
                out.println(amount);
                out.println("</td>");
                out.println("<td>");
                out.println(status);
                out.println("</td>");
                out.println("<td>");
                out.println(method);
                out.println("</td>");
                out.println("<td>");
                out.println(time);
                out.println("</td>");
                out.println("</tr>");
            }
        %>
        </table>
        
        <div class="button_container">
            <button class="btn"><span> <a href="http://localhost:8080/SE_PROJECT/home1.jsp">Back</a> </span></button>
        </div>
    </body>
</html>
