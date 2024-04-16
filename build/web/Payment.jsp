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
    <body>
        <form action="Payment" method="POST">
        <style>
            :root {
	--primary-c: #2196F3;
	--secondary-c: #B2D7F5;
	
	--white: #FDFBFB;
	
	--text: #082943;	
	--bg: var(--primary-c);
}


/* Basic Config
?????????????????????????????????????????????????? */
html, body {
	height: 100%;
	padding: 0;
	margin: 0;
}

body {
  background-color: var(--bg);
  display: flex;
  justify-content: center;
  align-items: center;
	font-family: 'Raleway', sans-serif;
	color: var(--text);
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

ul {
	list-style-type: none;
	padding-left: 50px;
	margin: 0;
}

li {
	display: block;
	position: relative;
	padding: 20px 0px;
}

h2 {
	margin: 10px 0;
	font-weight: 900;
}


/* Card
?????????????????????????????????????????????????? */
.card {
	display: flex;
	flex-direction: column;	
	background: var(--white);
	width: 350px;
	padding: 20px 25px;
	border-radius: 20px;
	box-shadow: 0 19px 38px rgba(0, 0, 0, 0.13);
}
.button {
  background-color: #008CBA;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

/* Radio Button
?????????????????????????????????????????????????? */
input[type=radio] {
	position: absolute;
	visibility: hidden;
}

label { 
	cursor: pointer; 
	font-weight: 400;
}

.check {
	width: 30px; height: 30px;
	position: absolute;
	border-radius: 50%;
	transition: transform .6s cubic-bezier(0.68, -0.55, 0.27, 1.55);
}

/* Reset */
input#one ~ .check { 
	transform: translate(-50px, -25px); 
	background: var(--secondary-c); 
}
input#two ~ .check { 
	transform: translate(-50px, -83px); 
	background: var(--primary-c);
	box-shadow: 0 6px 12px rgba(33, 150, 243, 0.35);
}

/* Radio Input #1 */
input#one:checked ~ .check { transform: translate(-50px, 33px); }

/* Radio Input #2  */
input#two:checked ~ .check { transform: translate(-50px, -25px); }
        </style>
        <div class="card">
            
	<h2>Select Options to Pay: </h2>
	
	<ul>
		<li>
			<input type="radio" name="pay" id="one" value="cards" checked />
			<label for="one">Credit/Debit Card</label>
			
			<div class="check"></div>
		</li>
		
		<li>
			<input type="radio" name="pay" id="two" value="netbanking" />
			<label for="two">Net Banking</label>
			
			<div class="check"></div>
		</li>
                
	</ul>
        <input type="submit" class="button" value="Pay Securely">
</div>
        </form>
    </body>
</html>
