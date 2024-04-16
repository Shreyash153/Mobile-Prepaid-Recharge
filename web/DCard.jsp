<%-- 
    Document   : DCard
    Created on : 14-Mar-2020, 13:28:22
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
        background-image: url('1.jpg');
    }
</style>
    <body>
        
        <form action="DCardPay" method="POST">
        <style>
            body { margin-top:20px; }
.panel-title {display: inline;font-weight: bold;}
.checkbox.pull-right { margin: 0; }
.pl-ziro { padding-center: 0px; }
        </style>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<br><br><br><br><br><br><br><br><br>


<div class="container" align="center">
    <div class="row">
        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div>
                    <%
                        if(session.getAttribute("debit")!=null)
                        {
                            out.println("Debit card number in not exists");
                        }
                    %>
                </div>
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Payment Details
                    </h3>
                </div>
                <div class="panel-body">
                    <form role="form">
                    <div class="form-group">
                        <label for="cardNumber">
                            CARD NUMBER</label>
                        <div class="input-group">
                            <input type="number" class="form-control" id="cardNumber" name="cardNumber" placeholder="Valid Card Number"
                                   required autofocus maxlength="16" minlength="16"/>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-7 col-md-7">
                            <div class="form-group">
                                <label for="expityMonth">
                                    EXPIRY DATE</label>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityMonth" name="expiryMonth" placeholder="MM" required maxlength="2"/>
                                </div>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityYear" name="expiryYear" placeholder="YY" required maxlength="2" minlength="2"/></div>
                            </div>
                        </div>
                        <div class="col-xs-5 col-md-5 pull-right">
                            <div class="form-group">
                                <label for="cvCode">
                                    CVV</label>
                                <input type="password" class="form-control" id="cvCode" placeholder="CVV" name="cvCode" minlength="3" maxlength="3" required />
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"><span class="badge pull-right"><span class="glyphicon glyphicon-INR"></span>₹<%out.println(session.getAttribute("amount"));%></span> Final Payment</a>
                </li>
            </ul>
            
            <br/>
            <input type="submit" class="btn btn-success btn-lg btn-block" role="button" value="Pay">
        </div>
    </div>

</div>
        </form>
    </body>
</html>
