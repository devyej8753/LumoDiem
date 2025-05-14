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

@WebServlet("/resetPwSetPw")
public class ResetPwSetPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResetPwSetPwServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account accountSelect = null;
		Account accountResetPw = null;
		if(session != null && session.getAttribute("account") != null) {
			response.sendRedirect("/");
		} else {
			String accountId = request.getParameter("account_id");
			String accountSsn = request.getParameter("account_ssn");
			if(accountId == null || accountSsn == null) {
				response.sendRedirect(request.getContextPath()+"/views/account/searchIdFail.jsp");
			} else {
				
				accountSelect = Account.builder()
						.accountId(accountId)
						.accountSsn(accountSsn)
						.build();
				accountResetPw = new AccountService().searchIdNameByTwoInfo(accountSelect);
				RequestDispatcher view = request.getRequestDispatcher("/views/account/resetPwSetPw.jsp");
				if(accountResetPw != null) {
					if(accountResetPw.getAccountNo() > 0) {
							
							session.setAttribute("accountResetPw", accountResetPw);
							session.setMaxInactiveInterval(60*30);
							view.forward(request, response);
					} else {
						response.sendRedirect(request.getContextPath()+"/views/account/searchIdFail.jsp");
					}
				} else {
					response.sendRedirect(request.getContextPath()+"/views/account/searchIdFail.jsp");
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
