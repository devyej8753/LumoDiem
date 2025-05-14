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

@WebServlet(name="accountCreateEndServlet", urlPatterns = "/accountCreateEnd")
public class AccountCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AccountCreateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session != null && session.getAttribute("account") != null) {
			response.sendRedirect("/");
		} else {
			String grade = request.getParameter("account_grade");
			String id = request.getParameter("account_id");
			String pw = request.getParameter("account_pw");
			String name = request.getParameter("account_name");
			String nickname = request.getParameter("account_nickname");
			String ssn = request.getParameter("account_ssn");
			String phone = request.getParameter("account_phone");
			String address1 = request.getParameter("postcode");
			String address2 = request.getParameter("address");
			String address3 = request.getParameter("detailAddress");
			String address = address1 + address2 + address3; 
			String email = request.getParameter("account_email");
			LocalDateTime ldt = LocalDateTime.now();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			
			Account act = Account.builder()
					.accountGrade(grade)
					.accountId(id)
					.accountPw(pw)
					.accountName(name)
					.accountNickname(nickname)
					.accountSsn(ssn)
					.accountPhone(phone)
					.accountAddress(address)
					.accountEmail(email)
					.accountRegDate(ldt.format(dtf))
					.build();
			
			int result = new AccountService().accountCreateOne(act);
			
			JSONObject obj = new JSONObject();
			
			obj.put("res_code", "500");
			obj.put("res_msg", "회원가입중 오류가 발생하였습니다.");
			
			if(result > 0) {
				obj.put("res_code", "200");
				obj.put("res_msg", "정상적으로 회원가입되었습니다.");
			}
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(obj);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
