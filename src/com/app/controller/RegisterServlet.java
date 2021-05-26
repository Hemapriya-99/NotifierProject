package com.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.bean.RegisterBean;
import com.app.dao.RegisterDao;


@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	 
	
    public RegisterServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userName = request.getParameter("username");
    	String mobilenumber = request.getParameter("mobilenumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        RegisterBean registerBean = new RegisterBean();
      
        registerBean.setUserName(userName);
        registerBean.setMobilenumber(mobilenumber);
        registerBean.setEmail(email);
        registerBean.setPassword(password); 
        
        RegisterDao registerDao = new RegisterDao();
        
     
        String userRegistered = registerDao.registerUser(registerBean);
        
        if(userRegistered.equals("SUCCESS"))   
        {
           request.getRequestDispatcher("/Notebooks.jsp").forward(request, response);
        }
        else   
        {
           request.setAttribute("errMessage", userRegistered);
           request.getRequestDispatcher("/Register.jsp").forward(request, response);
        }
    }
}