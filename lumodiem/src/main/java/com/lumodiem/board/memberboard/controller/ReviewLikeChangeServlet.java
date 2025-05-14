package com.lumodiem.board.memberboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.lumodiem.account.vo.Account;
import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.ReviewLike;

@WebServlet("/reviewLikeChange")
public class ReviewLikeChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewLikeChangeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String like = null;
		int reviewNo = 0;
		Account account = null;
		ReviewLike reviewLike = null;
		int newTotalLikeCount = 0;
		int result = 0;
		if(session != null && session.getAttribute("account") != null) {
			account = (Account)session.getAttribute("account");
			like = request.getParameter("like");
			String temp = request.getParameter("review_no");
			if(temp != null) {
				reviewNo = Integer.parseInt(temp);
				reviewLike = ReviewLike.builder().accountNo(account.getAccountNo()).reviewNo(reviewNo).build();
				if("unlikeToLike".equals(like)) {
					result = new MemberBoardService().reviewUnlikeToLike(reviewLike);
				} else if("likeToUnlike".equals(like)) {
					result = new MemberBoardService().reviewLikeToUnlike(reviewLike);
				}
				newTotalLikeCount = new MemberBoardService().countLikeByReviewNo(reviewNo);
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
