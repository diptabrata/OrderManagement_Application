<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<%
int order_id=Integer.parseInt(request.getParameter("order_id"));
int order_amount=Integer.parseInt(request.getParameter("order_amount"));
    System.out.print("\n[Performing UPDATE] ... \n");
    try
    {  
         //load the driver
       Class.forName("com.mysql.cj.jdbc.Driver");
         //create connection object
         Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/winter_internship", "root", "1234");
         // create the prepared statement object
         PreparedStatement ps = c.prepareStatement("update order_details set Approved_By=?, Approval_Status=?, notes=? where Order_ID = ?");  
         if (order_amount >10000 && order_amount <50000)
         {
         ps.setString(1,"Laura Smith");    
         ps.setString(2,"Approved");
         ps.setString(3,"Order Approved by Laura Smith");
         ps.setInt(4,order_id); 
      // for returning back to dashboard
         int i = ps.executeUpdate();  
          if(i>0) {
          response.sendRedirect("manager.jsp");
           return;
         }
         }
         else if (order_amount>50000)
         {
             ps.setString(1,"Matthew Vance");    
             ps.setString(2,"Approved");
             ps.setString(3,"Order Approved by Matthew Vance"); 
             ps.setInt(4,order_id); 
          // for returning back to dashboard
             int j = ps.executeUpdate();  
              if(j>0) {
              response.sendRedirect("senior.jsp");
               return;
           }
         }
    }
    catch (ClassNotFoundException | SQLException e) {
        ((Throwable) e).printStackTrace();
  }
    out.close();
%>