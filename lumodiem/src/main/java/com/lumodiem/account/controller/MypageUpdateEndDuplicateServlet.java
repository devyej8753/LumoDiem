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

@WebServlet("/mypageUpdateEndDuplicate")
public class MypageUpdateEndDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageUpdateEndDuplicateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		Account result = null;
		Account act = null;
		if (session != null && session.getAttribute("account") != null) {
			account = (Account)session.getAttribute("account");
			String nickname = request.getParameter("account_nickname");
			String phone = request.getParameter("account_phone");
			
			if(nickname != null || phone != null) {
				act = Account.builder()
						.accountNo(account.getAccountNo())
						.accountNickname(nickname)
						.accountPhone(phone)
						.build();
				result = new AccountService().mypageUpdateDuplicateCheck(act);
			}
			
			JSONObject obj = new JSONObject();
			
			obj.put("res_code", "500");
			obj.put("res_msg", "이미 사용중인 ");
			
			if (result == null) {
				obj.put("res_code", "200");
				obj.put("res_msg", "사용 가능한 ");
			}
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(obj);
		} else {
			response.sendRedirect("/");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
