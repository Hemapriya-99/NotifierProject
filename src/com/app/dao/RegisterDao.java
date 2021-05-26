package com.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.app.bean.RegisterBean;
import com.app.util.DBConnection;



public class RegisterDao {
	public String registerUser(RegisterBean registerBean)
    {
		String userName = registerBean.getUserName();
		String mobilenumber = registerBean.getMobilenumber();
        String email = registerBean.getEmail();
        String password = registerBean.getPassword();
        
        Connection con = null;
        PreparedStatement preparedStatement = null;         
        try
        {
            con = DBConnection.createConnection();
            String query = "insert into users(userName,mobilenumber,Email,password) values (?,?,?,?)"; 
            preparedStatement = con.prepareStatement(query); 
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, mobilenumber);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, password);
            
            int i= preparedStatement.executeUpdate();
            
            if (i!=0)  
            return "SUCCESS"; 
        }
        catch(SQLException e)
        {
           e.printStackTrace();
        }       
        return "Oops.. Something went wrong there..!"; 
    }

}
