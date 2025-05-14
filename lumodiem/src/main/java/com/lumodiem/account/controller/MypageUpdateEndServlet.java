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

@WebServlet(urlPatterns = "/mypageUpdateEnd", name = "mypageUpdateEndServlet")
public class MypageUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageUpdateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String urlPath = "/mypageUpdateEndFail";
		String accountPw = null;;
		Account accountCheck = null;
		
		if(session != null && session.getAttribute("account") != null) {
			Account account = (Account)session.getAttribute("account");
			accountPw = request.getParameter("account_pw");
			accountCheck = Account.builder()
					.accountId(account.getAccountId())
					.accountPw(accountPw)
					.build();
			Account result = new AccountService().loginAccount(accountCheck);
			if(result != null) {
				urlPath = request.getContextPath()+"/views/mypage/mypageUpdateEnd.jsp";
				RequestDispatcher view = request.getRequestDispatcher(urlPath);
				view.forward(request, response);
			} else {
				response.sendRedirect(urlPath);
			}
		} else {
			response.sendRedirect(urlPath);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
