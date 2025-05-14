package com.lumodiem.account.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.lumodiem.account.service.AccountService;
import com.lumodiem.account.vo.Account;

@WebServlet("/accountCreateDuplicate")
public class AccountCreateDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AccountCreateDuplicateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		Account act = null;
		if (session != null && session.getAttribute("account") != null) {
			response.sendRedirect("/");
		} else {
			String id = request.getParameter("account_id");
			String nickname = request.getParameter("account_nickname");
			String ssn = request.getParameter("account_ssn");
			String phone = request.getParameter("account_phone");
			
			if(id != null || nickname != null || ssn != null || phone != null) {
				act = Account.builder()
						.accountId(id)
						.accountNickname(nickname)
						.accountSsn(ssn)
						.accountPhone(phone)
						.build();
				account = new AccountService().accountDuplicateCheck(act);
			}
			
			JSONObject obj = new JSONObject();

			obj.put("res_code", "500");
			obj.put("res_msg", "이미 사용중인 ");

			if (account == null) {
				obj.put("res_code", "200");
				obj.put("res_msg", "사용 가능한 ");
			}
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(obj);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
