package com.lumodiem.board.hostboard.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.lumodiem.account.vo.Account;
import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Chat;

@WebServlet("/klassChat")
public class KlassChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public KlassChatServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int result = 0;
		String chatTxt = null;
		String temp1 = null;
		String temp2 = null;
		int klassAccountNo = 0;
		int klassNo = 0;
		Chat chat = new Chat();
		Chat returnChat = new Chat();
		List<String> chatList = null;
		Account account = null;
		if (session != null && session.getAttribute("account") != null) {
			account = (Account) session.getAttribute("account");
			chatTxt = request.getParameter("chatTxt");
			temp1 = request.getParameter("klassAccountNo");
			temp2 = request.getParameter("klassNo");
			if (chatTxt != null && "".equals(chatTxt) == false && chatTxt.contains("(Host)") == false
					&& chatTxt.contains("(Member)") == false) {
				if (temp1 != null && temp2 != null) {
					klassAccountNo = Integer.parseInt(temp1);
					klassNo = Integer.parseInt(temp2);
					if (klassAccountNo == account.getAccountNo()) {
//						클래스 주최자 = 로그인한 사용자가 같은 경우
						chatTxt = "(Host)" + account.getAccountNickname() + " : " + chatTxt + "\n";
					} else {
//						그 외
						chatTxt = "(Member)" + account.getAccountNickname() + " : " + chatTxt + "\n";
					}
					chat = Chat.builder().klassNo(klassNo).chatTxt(chatTxt)
							.accountNickname(account.getAccountNickname()).build();
					result = new HostBoardService().updateKlassChat(chat);
					returnChat = new HostBoardService().selectKlassChatByKlassNo(chat);
					if (returnChat != null) {
						chatList = Arrays.asList(returnChat.getChatTxt().split("\n"));
					}
				}

			} else if (chatTxt == null || "".equals(chatTxt)) {
				if (temp2 != null) {
					klassNo = Integer.parseInt(temp2);
					chat = Chat.builder().klassNo(klassNo).chatTxt(chatTxt)
							.accountNickname(account.getAccountNickname()).build();
					returnChat = new HostBoardService().selectKlassChatByKlassNo(chat);
					if (returnChat != null) {
						chatList = Arrays.asList(returnChat.getChatTxt().split("\n"));
					}
				}
			}

			JSONObject obj = new JSONObject();

			obj.put("res_code", "500");
			obj.put("res_msg", "비정상 작동");
			if (chatList != null) {
				obj.put("res_code", "200");
				obj.put("res_msg", "정상 작동");
				obj.put("chatList", chatList);
			}
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(obj);
		} else {

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
