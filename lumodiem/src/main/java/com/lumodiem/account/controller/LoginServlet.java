package com.lumodiem.account.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session != null && session.getAttribute("account") != null) {
			session.removeAttribute("account");
			session.removeAttribute("accountResetPw");
			session.invalidate();
			response.sendRedirect("/");
		} else {
			String searchIdLogin = request.getParameter("searchIdLogin");
			RequestDispatcher view = request.getRequestDispatcher("/views/account/login.jsp");
			if(searchIdLogin != null) {
				request.setAttribute("searchIdLogin", searchIdLogin);
			}
			
			view.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
