package com.highradius.internship;
import java.io.IOException;
import javax.servlet.http.*; 
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class dummyServlet
 */
@WebServlet("/dummyServlet")
public class DummyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private Connection dbConnection; 
    public DummyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    String un = request.getParameter("username");
        String pw = request.getParameter("password");
        
// Connect to my sql
        try {
        	HttpSession session = request.getSession();
            Class.forName("com.mysql.cj.jdbc.Driver");
// loads driver
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/winter_internship", "root", "1234"); // gets a new connection
            PreparedStatement ps = c.prepareStatement("select username,password, user_level from user_details where username=? and password=?");    
            ps.setString(1, un);
            ps.setString(2, pw);     
            ResultSet rs = ps.executeQuery();          
          
            while (rs.next()) 
            { 
            	String level = rs.getString("user_level");
            	if(level.equals("Level 1"))
            	{           		
            		session.setAttribute("Level1", un); //gets session object     		
            		response.sendRedirect("orderpage.jsp");
            		session.setMaxInactiveInterval(900);//deletes the session after 900 seconds
            		return;
            	}
            	else if(level.equals("Level 2"))
            	{ 
            		session.setAttribute("Level2", un);   
            		response.sendRedirect("manager.jsp");
            		session.setMaxInactiveInterval(900);
            		return;
            	}
            	else if(level.equals("Level 3"))
            	{
            		session.setAttribute("Level3", un);  
            		response.sendRedirect("senior.jsp");
            		session.setMaxInactiveInterval(900);
            		return;
            	}
            
            } 
                        response.sendRedirect("error.html");
            return;
      } catch (ClassNotFoundException | SQLException e) {
           e.printStackTrace();
      }
	
	
	}
	
	
    } 
        


