package com.app.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.util.DBConnection;

public class EditNotesServlet extends HttpServlet {
	 
    public EditNotesServlet() 
    {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
 
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
             String sql="update notedesc set notename=?,startDate=?,endDate=?,remainderDate=?,notestatus=?,description=? where notename=?";
             statement = con.prepareStatement(sql); 
             //resultSet = statement.executeQuery("update users where set userName=?,mobilenumber=?,email=?,password=?"); 
             ResultSet rs;
             
             statement.setString(1,notename);
             statement.setString(2,startDate);
             statement.setString(3,endDate);
             statement.setString(4,remainderDate);
             statement.setString(5,notestatus);
             statement.setString(6,description);
             statement.setString(7,notename);
             statement.executeUpdate();
             response.sendRedirect("NoteDescription.jsp");
         }
         catch(SQLException e)
         {
             e.printStackTrace();
         }
        	 
    }
}  
