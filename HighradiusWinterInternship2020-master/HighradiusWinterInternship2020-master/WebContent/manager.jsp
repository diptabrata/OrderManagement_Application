<!DOCTYPE html>
<html lang="en">
<head>
  <title>OrderPage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script> <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
  <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" ></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/orderpage.css"> 
  <script type="text/javascript" src="js/index.js"></script>
 
</head>
<%
if (session.getAttribute("Level2") == null) {
    response.sendRedirect("/1707273");
    return;
}
%>
<body>
<!-- loading hrc_logo -->
<img src="images/hrc-logo.svg" alt="logo" style="height:45px; width:230px;"> 
<img src="images/abc-logo.png" alt="logo" style="height:45px; width:800px;">
<!-- nav bar -->
<nav class="navbar navbar-default">
    <div class="row">
    	<div class="container-fluid">
   			<div class="table-features" style="display: inline-block;">
    			<div id="outer">
    				<div class="inner"style="color: white;width:110px;"></div>
    				<div class="inner"style="color: white;width:110px;"></div>
	         		<form action="approve.jsp" method="post">
	        		<button class="btn btn-warning hola" id="button1" style="background-color:orange; color: white; width:110px; padding: 10px; margin-right:16px;">APPROVE</button>
	        		<input type="hidden" name="order_id" id="order_id" >
	        		<input type="hidden" name="order_amount" id="order_amount">
	         		</form>
	        		<form action="reject.jsp" method="post">
	        		<button class="btn btn-warning hola" id="button2" style="background-color:orange; color: white;width:110px; padding: 10px; margin-right:16px;">REJECT</button>
	        		<input type="hidden" name="order_ID" id="order_ID">
	        		<input type="hidden" name="order_Amount" id="order_Amount">
	        		</form>         
			    </div>
		  </div>
	  </div>
   </div>
</nav>
<!-- table  -->
<div>
   <table  id="myTable" class="table table-striped table-sm table-hover" cellspacing="0" width="100%" style="margin-top:20px;table-layout:fixed;">
   <thead >
      <tr>
        <th class="th-sm" style="width:50px;"> select </th>
        <th class="th-sm" >Order Date</th>
        <th class="th-sm" >Approved by</th>
        <th class="th-sm" >Order ID</th>
        <th class="th-sm" >Customer name</th>
        <th class="th-sm" >Company ID</th>
        <th class="th-sm" >Order Amount</th>
        <th class="th-sm" >Approval Status</th>
        <th class="th-sm" >Notes</th>
      </tr>
      </thead>
<%@page import="java.sql.*" %>
<%
//create a Statement from the connection
try
{
	Connection con = com.highradius.internship.DatabaseConnection.initializeDatabase();
	PreparedStatement ps=con.prepareStatement("select * from order_details where order_Amount< 50000 and order_Amount>10000");
	ResultSet rs= ps.executeQuery();
	int i=0;
	while(rs.next()){
		i=i+1;
%>
<tr >
    <td> <input id="chk" type="checkbox"  ></td>
	<td ><%=rs.getDate("order_Date") %></td>
	<td class="approvedBy_edit"><%=rs.getString("Approved_By") %></td>
	<td class="orderID_edit"><%=rs.getInt("order_ID") %></td>
	<td><%=rs.getString("Customer_Name") %></td>
	<td><%=rs.getInt("Customer_ID") %></td>
	<td class="orderAmount_edit"><%=rs.getInt("Order_Amount") %></td>
	<td ><%=rs.getString("Approval_Status") %></td>
	<td class="notes_edit"><%=rs.getString("notes") %></td>
</tr>
<%
}
con.close();
} catch (Exception ex) {
ex.printStackTrace();
}
%>
	</table>
</div>
<script type="text/javascript" src="js/additional.js"></script>
</body>
</html>
        