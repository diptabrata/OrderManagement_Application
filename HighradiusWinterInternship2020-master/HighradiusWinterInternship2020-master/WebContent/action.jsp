<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
int order_id=Integer.parseInt(request.getParameter("order_id"));
String order_date=request.getParameter("order_date");
String Customer_Name=request.getParameter("Customer_Name");
int Customer_ID=Integer.parseInt(request.getParameter("Customer_ID"));
int Order_Amount=Integer.parseInt(request.getParameter("Order_Amount"));
String notes=request.getParameter("notes");
String Approved_By=request.getParameter("Approved_By");
String Approval_Status=request.getParameter("Approval_Status");

//String username=request.getParameter("un");

System.out.print("\n[Performing ADD] ... \n");

try
{
	if (Order_Amount < 10000)
	{
		Approved_By= "David Lee";
		Approval_Status="Approved";
	}
	else if (Order_Amount > 10000 && Order_Amount <50000)
	{
		Approved_By="";
		Approval_Status="Awaiting Approval";
	}
	else if (Order_Amount > 50000)
	{
		Approved_By="NULL";
		Approval_Status="Awaiting Approval";
	}
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/winter_internship", "root", "1234");
	Statement st=conn.createStatement();
	int i=st.executeUpdate("insert into order_details(order_id,order_date,Customer_Name,Customer_ID,Order_Amount,Approved_By,Approval_Status,notes)value('"+order_id+"','"+order_date+"','"+Customer_Name+"','"+Customer_ID+"','"+Order_Amount+"','"+Approved_By+"','"+Approval_Status+"','"+notes+"')");
	out.println("Data is successfully inserted!");

    if(i>0) {
     response.sendRedirect("orderpage.jsp");
      return;

   
    }
	
	
	}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>


</body>
</html>