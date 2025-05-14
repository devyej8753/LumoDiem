package com.lumodiem.account.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lumodiem.account.service.AccountService;
import com.lumodiem.account.vo.Account;

@WebServlet(name="loginEndServlet", urlPatterns="/loginEnd")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("login_id");
		String pw = request.getParameter("login_pw");
		System.out.println(id + " : " + pw);
		
		Account temp = new Account();
		temp.setAccountId(id);
		temp.setAccountPw(pw);
		
		Account act = new AccountService().loginAccount(temp);
		
		if(act != null) {
			HttpSession session = request.getSession();
			if(session.isNew() || session.getAttribute("account") == null) {
				session.setAttribute("account", act);
				session.setMaxInactiveInterval(60*30);
			}
			System.out.println("로그인 성공");
			response.sendRedirect("/");
		} else {
			RequestDispatcher view = request.getRequestDispatcher(request.getContextPath() + "/views/account/loginFail.jsp");
			view.forward(request, response);
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
