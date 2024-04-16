<%-- 
    Document   : FinalPage
    Created on : 15-Mar-2020, 16:34:26
    Author     : Bitu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
        <meta charset="UTF-8">
        <title></title>
    </head>
    
    <style>
        body {
        background-image: url('6.jfif');      
    }
    </style>
    <body>
        Your Recharge is Successfully done
        <a href="home1.jsp">Click here</a> to go to home page
    </body>
</html>
