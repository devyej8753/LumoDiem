package com.lumodiem.board.memberboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.memberboard.service.ReviewCommentService;
import com.lumodiem.board.memberboard.vo.ReviewCmt;

@WebServlet("/deleteReviewCommentEnd")
public class DeleteReviewCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteReviewCommentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("review_cmt_no");
		int reviewCmtNo = 0;
		if(temp!=null) reviewCmtNo = Integer.parseInt(temp);
		ReviewCmt cmt = ReviewCmt.builder()
				.reviewCmtNo(reviewCmtNo)
				.build();
		int result = new ReviewCommentService().deleteReviewComment(cmt);
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "삭제 오류");
		
		if(result>0) {
			obj.put("res_code", "200");
			obj.put("res_msg","삭제 완료");
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(obj);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
