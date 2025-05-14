package com.lumodiem.board.memberboard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;
import com.lumodiem.board.memberboard.vo.ReviewMapping;

@WebServlet("/deleteReviewPage")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public DeleteReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("review_no"));
		
		int attachNo = 0;
		String temp = request.getParameter("attach_no");
		if(temp != null) attachNo = Integer.parseInt(temp);
		
		int result = 0;
		if(attachNo > 0) {
			result = new MemberBoardService().deleteReview(reviewNo, attachNo);
		}else {
			result = new MemberBoardService().deleteReview(reviewNo);
		}
		
		JSONObject obj = new JSONObject();
		if(result > 0) {
			obj.put("res_code","200");
			obj.put("res_msg", "정상적으로 게시글 삭제");
		}else {
			obj.put("res_code","500");
			obj.put("res_msg", "게시글 삭제 중 오류가 발생");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
