package com.app.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.util.DBConnection;

public class NoteBookServlet extends HttpServlet {
	 
    public NoteBookServlet() 
    {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
         Connection con = null;
        PreparedStatement statement = null;
       // ResultSet rs;
         
         String noteBookName = request.getParameter("noteBookName"); 
         try
         {
             con = DBConnection.createConnection(); 
             //String sql="update users set userName=?,mobilenumber=?,email=?,password=? where email=?";
             String sql="insert into notebooks(noteBookName) values(?)";
             statement = con.prepareStatement(sql); 
             //resultSet = statement.executeQuery("update users where set userName=?,mobilenumber=?,email=?,password=?"); 
             //  ResultSet rs;
             statement.setString(1,noteBookName);
             statement.executeUpdate();
             response.sendRedirect("Notebooks.jsp");
         }
         catch(SQLException e)
         {
                e.printStackTrace();
         }
    }


}
