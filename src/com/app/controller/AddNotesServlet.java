package com.app.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.bean.LoginBean;
import com.app.util.DBConnection;

public class AddNotesServlet extends HttpServlet {
	 
    public AddNotesServlet() 
    {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
     /*  HttpSession session=request.getSession(true);
	    String userName=request.getParameter("userName");		
		LoginBean obj=new LoginBean();
		obj.setUserName(userName);
		session.setAttribute("userName", userName); */
    	
        Connection con = null;
        PreparedStatement statement = null;    
         String notename = request.getParameter("notename"); 
         String startDate = request.getParameter("startDate");
         String endDate = request.getParameter("endDate");
         String remainderDate =request.getParameter("remainderDate");
         String notestatus =request.getParameter("notestatus");
         String description =request.getParameter("description");
         try
         {
             con = DBConnection.createConnection(); 
             String sql="insert into notedesc(notename,startDate,endDate,remainderDate,notestatus,description) values(?,?,?,?,?,?)";
             statement = con.prepareStatement(sql); 
             statement.setString(1,notename);
             statement.setString(2,startDate);
             statement.setString(3,endDate);
             statement.setString(4,remainderDate);
             statement.setString(5,notestatus);
             statement.setString(6,description);
             statement.executeUpdate();
             response.sendRedirect("NoteDescription.jsp");
         }
         catch(SQLException e)
         {
             e.printStackTrace();
         }	
        	 
         }  
}