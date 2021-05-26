package com.app.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.*;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.bean.UserDataBean;
import com.app.util.DBConnection;

public class UserDetailServlet extends HttpServlet {
	 
    public UserDetailServlet() 
    {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
        Connection con = null;
        PreparedStatement statement = null;
        // ResultSet rs;
         
         String userName = request.getParameter("userName"); 
         String mobilenumber = request.getParameter("mobilenumber");
         String email = request.getParameter("email");
         String password=request.getParameter("password");
         
         //  String url = "jdbc:mysql://localhost:3306/notifierapp"; 
	     // String username = "root"; 
	     // String pass = "Hema@7999"; 

         try
         {
            // Class.forName("com.mysql.cj.jdbc.Driver"); 
        	// con = DriverManager.getConnection(url, username, pass); 
             con = DBConnection.createConnection(); 
             String sql="update users set userName=?,mobilenumber=?,email=?,password=? where email=?";
             statement = con.prepareStatement(sql); 
             //resultSet = statement.executeQuery("update users where set userName=?,mobilenumber=?,email=?,password=?"); 
            // ResultSet rs;
             
             statement.setString(1,userName);
             statement.setString(2,mobilenumber);
             statement.setString(3,email);
             statement.setString(4,password);
             statement.setString(5,email);
             statement.executeUpdate();
             response.sendRedirect("Login.jsp");
         }
         catch(SQLException e)
         {
                e.printStackTrace();
         }
        	 
        	
        	 
         }  
}