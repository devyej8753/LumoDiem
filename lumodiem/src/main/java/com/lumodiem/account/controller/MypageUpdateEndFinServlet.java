package com.lumodiem.account.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.lumodiem.account.service.AccountService;
import com.lumodiem.account.vo.Account;

@WebServlet(urlPatterns = "/mypageUpdateEndFin", name="mypageUpdateEndFinServlet")
public class MypageUpdateEndFinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageUpdateEndFinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		if(session != null && session.getAttribute("account") != null) {
			account = (Account)session.getAttribute("account");
			String pw = request.getParameter("account_pw");
			String nickname = request.getParameter("account_nickname");
			String phone = request.getParameter("account_phone");
			String address1 = request.getParameter("postcode");
			String address2 = request.getParameter("address");
			String address3 = request.getParameter("detailAddress");
			String address = address1 + address2 + address3; 
			String email = request.getParameter("account_email");
			
			Account act = Account.builder()
					.accountNo(account.getAccountNo())
					.accountPw(pw)
					.accountNickname(nickname)
					.accountPhone(phone)
					.accountAddress(address)
					.accountEmail(email)
					.build();
			
			int result = new AccountService().mypageUpdateEndFin(act);
			
			JSONObject obj = new JSONObject();
			
			obj.put("res_code", "500");
			obj.put("res_msg", "회원정보 수정중 오류가 발생하였습니다.");
			
			if(result > 0) {
				obj.put("res_code", "200");
				obj.put("res_msg", "정상적으로 회원정보 수정이 완료 되었습니다.");
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
