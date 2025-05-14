package com.lumodiem.board.memberboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.memberboard.service.ReviewCommentService;
import com.lumodiem.board.memberboard.vo.ReviewCmt;


@WebServlet("/createCommentEnd")
public class CreateCommentEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateCommentEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp1 = request.getParameter("account_no");
		String temp2 = request.getParameter("review_no");
		String reviewCmtTxt = request.getParameter("review_cmt_txt");
		int accountNo = 0;
		int reviewNo = 0 ;
		if(temp1!=null) accountNo = Integer.parseInt(temp1);
		if(temp2!=null) reviewNo = Integer.parseInt(temp2);
		
		
		ReviewCmt cmt2 = ReviewCmt.builder()
				.accountNo(accountNo)
				.reviewNo(reviewNo)
				.reviewCmtTxt(reviewCmtTxt)
				.build();
		
		int result = new ReviewCommentService().insertReviewComment(cmt2);
		List<ReviewCmt> resultList = new ReviewCommentService().selectReviewComment(cmt2);
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "등록 오류");
		
		if(result>0) {
			obj.put("res_code", "200");
			obj.put("res_msg","등록 완료");
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(obj);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
