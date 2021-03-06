package com.app.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.app.bean.LoginBean;
import com.app.util.DBConnection;


public class LoginDao {
    public String authenticateUser(LoginBean loginBean)
    {
        String email = loginBean.getEmail(); 
        String password = loginBean.getPassword();

        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String emailDB = "";
        String passwordDB = "";

        try
        {
            con = DBConnection.createConnection(); 
            statement = con.createStatement(); 
            resultSet = statement.executeQuery("select Email,password from users"); 

            while(resultSet.next()) 
            {
             emailDB = resultSet.getString("email"); 
             passwordDB = resultSet.getString("password");

              if(email.equals(emailDB) && password.equals(passwordDB))
              {
                 return "SUCCESS"; 
              }
            }
        }
            catch(SQLException e)
            {
               e.printStackTrace();
            }
            return "Invalid user credentials !!"; 
    }
}