package com.lumodiem.board.hostboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.lumodiem.account.vo.Account;
import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.KlassLike;
import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.ReviewLike;

@WebServlet("/klassLikeChange")
public class KlassLikeChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassLikeChangeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String like = null;
		int klassNo = 0;
		Account account = null;
		KlassLike klassLike = null;
		int newTotalLikeCount = 0;
		int result = 0;
		if(session != null && session.getAttribute("account") != null) {
			account = (Account)session.getAttribute("account");
			like = request.getParameter("like");
			String temp = request.getParameter("klass_no");
			if(temp != null) {
				klassNo = Integer.parseInt(temp);
				klassLike = KlassLike.builder().accountNo(account.getAccountNo()).klassNo(klassNo).build();
				if("unlikeToLike".equals(like)) {
					result = new HostBoardService().klassUnlikeToLike(klassLike);
				} else if("likeToUnlike".equals(like)) {
					result = new HostBoardService().klassLikeToUnlike(klassLike);
				}
				newTotalLikeCount = new HostBoardService().countLikeByKlassNo(klassNo);
				request.setAttribute("newTotalLikeCount", newTotalLikeCount);
				JSONObject obj = new JSONObject();
				obj.put("res_code", "500");
				obj.put("res_msg", "처리중 오류가 발생했습니다.");
				obj.put("newTotalLikeCount", newTotalLikeCount);
				if(result > 0) {
					obj.put("res_code", "200");
					obj.put("res_msg", "기능이 정상 작동했습니다.");
				}
				response.setContentType("application/json; charset=utf-8");
				response.getWriter().print(obj);
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
