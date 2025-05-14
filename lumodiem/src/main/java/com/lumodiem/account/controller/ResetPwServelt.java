package com.lumodiem.account.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/resetPw")
public class ResetPwServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResetPwServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session != null && session.getAttribute("account") != null) {
			response.sendRedirect("/");
		} else {
			String searchIdResetPw = request.getParameter("searchIdResetPw");
			RequestDispatcher view = request.getRequestDispatcher("/views/account/resetPw.jsp");
			if(searchIdResetPw != null) {
				request.setAttribute("searchIdResetPw", searchIdResetPw);
			}
			view.forward(request, response);
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
