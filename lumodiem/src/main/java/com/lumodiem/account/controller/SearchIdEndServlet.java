package com.lumodiem.account.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.lumodiem.account.service.AccountService;
import com.lumodiem.account.vo.Account;

@WebServlet("/searchIdEnd")
public class SearchIdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchIdEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		Account searchAccount = null;
		
		if(session != null && session.getAttribute("account") != null) {
			response.sendRedirect("/");
		} else {
			String accountName = request.getParameter("account_name");
			String accountSsn = request.getParameter("account_ssn");
			if(accountName != null && accountSsn != null) {
				account = Account.builder()
				.accountName(accountName)
				.accountSsn(accountSsn)
				.build();
				searchAccount = new AccountService().searchIdNameByTwoInfo(account);
			} else {
				response.sendRedirect("/");
			}
			
			
			
			if(searchAccount != null) {
				
				RequestDispatcher view = request.getRequestDispatcher(request.getContextPath()+"/views/account/searchIdSuccess.jsp");
				request.setAttribute("searchAccount", searchAccount);
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
