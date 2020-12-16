<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>FinTech B2B Order Management Application</title>
 <link rel="stylesheet" href="css/index.css">
 <style> 
 body{
               background-image: url("images/human-machine-hand-homepage.jpg");
               background-position: center;
               background-repeat: no-repeat;
               background-size: 100%;
     }</style>
</head>
<body>
<script>$(document).ready(function() {
	  $("input").click(function() {
		    $(this).css("width", "300px")
		  })
		})</script>
  <center>
  	<div id="logo"> 
  	    <img src="images/hrc-logo.svg" alt="logo" style="height:45px; width:230px;"> 

  	</div>	                     
        <form action="dummyServlet"  method="post">
             <h1 style="padding-left: 200px; color: grey; font-size: 50px;">Sign in</h1>
            <div class="floating" >
	            <label style="color: black; margin-left: 220px;">Username</label><br>
	            <input type="text" name="username"  style="margin-left: 300px;  background-color: #e0ffff; border-color: transparent transparent coral transparent; border-radius: 7px;"><br>
	            <label style="color: black; margin-left: 220px; ">Password</label><br>
	            <input type="password" name="password"  style="margin-left: 300px;  background-color: #e0ffff; border-color: transparent transparent coral transparent; border-radius: 7px;">
	            <br><br>
                <button id="bt-sub" type="submit" class="btn btn-secondary"  style=""  onclick="click();">Sign in</button> 
          
        </form>
       
  </center>
 </div> 
</body>
</html>