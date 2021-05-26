package com.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.bean.LoginBean;
import com.app.dao.LoginDao;


public class LoginServlet extends HttpServlet {
	 
	 public LoginServlet() 
	    {
	    }
	 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	    {
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        LoginBean loginBean = new LoginBean();
	        loginBean.setEmail(email); 
	        loginBean.setPassword(password);
	        LoginDao loginDao = new LoginDao(); 
	        String userValidate = loginDao.authenticateUser(loginBean); 
	        if(userValidate.equals("SUCCESS")) 
	         {
	             request.setAttribute("email", email); 
	             request.getRequestDispatcher("/Notebooks.jsp").forward(request, response);
	         }
	         else
	         {
	             request.setAttribute("errMessage", userValidate); 
	             request.getRequestDispatcher("/Login.jsp").forward(request, response);
	         }
	    }
}