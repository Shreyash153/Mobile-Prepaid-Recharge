<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    /*if(session.getAttribute("mobile")==null)
    {
        response.sendRedirect("index.jsp");
    }*/
%>
<html>
    <head>
        <title>Mobile Recharge</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
    </head>
    <body>
        <style>
            
            
            
            input::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
                color: #868e96;
                opacity: 10; /* Firefox */
            }

.ms-input-placeholder { /* Internet Explorer 10-11 */
  color: #fa4251;
}

.ms-input-placeholder { /* Microsoft Edge */
  color: #fa4251;
}
            
            
            
            
            
            
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
            
            



.text-line {
    background-color: transparent;
    color: #000;
    outline: none;
    outline-style: none;
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom: solid #28a745 1px;
    padding: 3px 10px;
    margin-left: 20%;
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
        margin-left: 30%;
        margin-top: 12%;
        }
     body {
        background-image: url('6.jfif');      
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
        <script>
    function setText7(obj){
    var val = obj.value;
    console.log(val);
    document.getElementById('textBox').value = val;
}
</script>
         <div class="navbar">
            
            <a href="ViewTransactions.jsp">View Transactions</a>
            <a href="logout" onclick="alert("You will be logged out!!")">Log Out</a>
        </div>
<form action="plans">
<table>
        <%
            String operator=(String)session.getAttribute("operator");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/meet","root","Shreyash@153");
            Statement stmt=con.createStatement();
            String sql="select * from plans where operator='"+operator+"'";
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next())
            {
                String discription=rs.getString("description");
                //String Operator=rs.getString("Operator");
                String amount=rs.getString("Amount");
                //String status=rs.getString("Status");
                //String method=rs.getString("Payment_method");
                //String time=rs.getString("Time");
                out.println("<tr>");
                out.println("<td>");
                out.println(discription);
                out.println("</td>");
                out.println("<td>");
                out.println("<input type='button' name='amount' value='"+amount+"' id='amount' onclick='setText7(this)'/>");
                out.println("</td>");
                out.println("</tr>");
            }
        %>
        
        
        </table>
        
        <div>
       <input type="text" class="text-line"  name="textBox" id="textBox" value="" />
        </div>
       <br/>
       <br/>
                <div class="button_container">
                        <button class="btn"><span>Pay</span></button>
                </div>
        
        </form>
        
        </body>
</html>