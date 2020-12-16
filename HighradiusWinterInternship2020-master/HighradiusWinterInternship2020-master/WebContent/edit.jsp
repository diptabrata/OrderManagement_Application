<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<%
int order_id=Integer.parseInt(request.getParameter("order_id"));
int Order_Amount=Integer.parseInt(request.getParameter("Order_Amount"));
String notes=request.getParameter("notes");
String Approved_By=request.getParameter("Approved_By");
String Approval_Status=request.getParameter("Approval_Status");


    System.out.print("\n[Performing UPDATE] ... \n");
    try
    {  
         //load the driver
       Class.forName("com.mysql.cj.jdbc.Driver");
         //create connection object
         Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/winter_internship", "root", "1234");
         // create the prepared statement object
         PreparedStatement ps = c.prepareStatement("update order_details set Order_Amount=?, Notes=?, Approved_By=?, Approval_Status=? where Order_ID = ?");  
         
         ps.setInt(1,Order_Amount);  
         ps.setString(2,notes); 
         if (Order_Amount<10000){
         ps.setString(3,"David Lee");
         ps.setString(4,"Approved");
         }
         else if (Order_Amount>10000 && Order_Amount<50000)
         {
        	 ps.setString(3,"Laura Smith");
        	 ps.setString(4,"Awaiting Approval");
         }
         else if (Order_Amount>50000)
         {
        	 ps.setString(3,"Matthew Vance");
        	 ps.setString(4,"Awaiting Approval");
         }
         ps.setInt(5,order_id); 
      
        // for returning back to dashboard
         int i = ps.executeUpdate();  
         
         if(i>0) {
          response.sendRedirect("orderpage.jsp");
           return;
         }
    }
    catch (ClassNotFoundException | SQLException e) {
        ((Throwable) e).printStackTrace();
    }
    out.close();


%>