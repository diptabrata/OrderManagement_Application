<!DOCTYPE html>
<html lang="en">
<head><title>OrderPage</title>
  <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"><script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"><script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" ></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/orderpage.css">
  <script type="text/javascript" src="js/index.js"></script>
</head>
<body>
<%
if (session.getAttribute("Level1") == null) {
    response.sendRedirect("/1707273"); 
    return;
}
%>
<!-- loading hrc_logo -->
<img src="images/hrc-logo.svg" alt="logo" style="height:45px; "> 
<img src="images/abc-logo.png" alt="logo" style="height:45px; width:800px;">
<!-- nav bar -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">      
         <div class="btn-group">
        	<button onclick="document.getElementById('id01').style.display='block'" class="btn btn-warning" style="margin:5px; width:100px; height:40px; background-color:orange;">ADD</button>
         	<button id="editbutton" onclick="document.getElementById('id02').style.display='block'"  class="btn btn-warning" style=" margin:5px; width:100px; height:40px; background-color:orange;">EDIT</button> 
         </div>                    
  <!-- modal configuration for edit button -->
         <div id="id02" class="modal">
   			 <form class="modal-content animate" action="edit.jsp" method="post">
   				  <div class="container">
   					    <h1 style="text-decoration: underline; text-decoration-color:orange; ">EDIT ORDER</h1>
          						<label for="Order_ID"><b>Order ID</b></label>
                                 	<input type="text" name="order_id" placeholder="Enter Order ID" id="order_id" style="background-color:#DCDCDC;" readonly>
                                <label for="Order_Amount"><b>Order Amount</b></label>
      								<input type="text" placeholder="Enter Order Amount" name="Order_Amount" id="Order_Amount" required>
                                <label for="Notes"><b>Notes</b></label>
      								<input type="text" placeholder="Enter notes" name="notes" id="notes" required>
                                <label for="Approved_By"><b>Approved By</b></label>
                                     <input type="text" placeholder="Enter Approved by" name="Approved_By" id="Approved_By"   style="background-color:#DCDCDC;" readonly>
                                <center> 
                           <button type="submit"  style=" width:100px; height:60px; background-color:orange;">EDIT</button>
                               </center>
                   </div>
                   <div class="container" >
      					<button type="button"  onclick="document.getElementById('id02').style.display='none'" class="cancelbtn_edit">&#10006;</button>
                   </div>
            </form>
         </div> 
  <!-- modal configuration for add button -->  
    <div id="id01" class="modal">
  		<form class="modal-content animate" action="action.jsp" method="post">
  		    <div class="container">
    		     <h1 style="text-decoration: underline; text-decoration-color:orange; ">ADD ORDER</h1>
    			       <label for="Order_ID"><b>Order ID</b></label>
					        <input type="text" placeholder="Enter Order ID" name="order_id"  required>
				       <label for="Order_Date"><b>Order Date</b></label>
     					 	<input type="text" placeholder="Enter Order Date" name="order_date" required>
              		   <label for="Customer_Name"><b>Customer Name</b></label>
      						<input type="text" placeholder="Enter Customer Name" name="Customer_Name" required>
                       <label for="Customer_Number"><b>Customer Number</b></label>
      						<input type="text" placeholder="Enter Customer number" name="Customer_ID" required>         
     			       <label for="Order_Amount"><b>Order Amount</b></label>
     						 <input type="text" placeholder="Enter Order Amount" name="Order_Amount" required>
                      <label for="Notes"><b>Notes</b></label>
  						    <input type="text" placeholder="Enter notes" name="notes" required>
                 <center><button type="submit" style=" width:100px; height:60px; background-color:orange;">ADD</button></center>
             </div>
		      <div class="container" >
		      <button type="button"  onclick="document.getElementById('id01').style.display='none'" class="cancelbtn_add">&#10006;</button>
		      </div>
 		 </form>
	</div>     
  </ul>
</div>
<!-- table  -->
<div>
  <table  id="myTable" class="table table-sm table-striped table-hover" style="table-layout:fixed;">
 <thead >
      <tr>
        <th class="th-sm" style="width:50px;"> Select </th>
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
	PreparedStatement ps=con.prepareStatement("select * from order_details");
	ResultSet rs= ps.executeQuery();
	int i=0;
	while(rs.next()){
		i=i+1;
%>
<tr>
    <td> <input id="chk" type="checkbox" class="checkb" ></td>
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
   <script type="text/javascript" src="js/add.js"></script>
</body>
</html>
        
        
