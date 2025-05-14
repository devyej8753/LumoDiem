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

@WebServlet(urlPatterns = "/resetPwSetPwEnd", name = "resetPwSetPwEndServlet")
public class ResetPwSetPwEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResetPwSetPwEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		int result = 0;
		
		if(session != null && session.getAttribute("account") != null) {
			response.sendRedirect("/");
		} else {
			Account accountResetPw = (Account)session.getAttribute("accountResetPw");
			String account_pw = request.getParameter("account_pw");
			
			
			if(accountResetPw != null) {
				account = Account.builder()
				.accountId(accountResetPw.getAccountId())
				.accountSsn(accountResetPw.getAccountSsn())
				.accountPw(account_pw)
				.build();
			} else {
				response.sendRedirect(request.getContextPath()+"/views/account/searchIdFail.jsp");
			}
			
			result = new AccountService().resetPw(account);
			if(result > 0) {
				RequestDispatcher view = request.getRequestDispatcher(request.getContextPath()+"/views/account/resetPwSetPwEndSuccess.jsp");
				view.forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath()+"/views/account/searchIdFail.jsp");
			}
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
