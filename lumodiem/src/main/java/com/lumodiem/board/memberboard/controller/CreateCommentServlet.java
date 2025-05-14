package com.lumodiem.board.memberboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.memberboard.service.ReviewCommentService;
import com.lumodiem.board.memberboard.vo.ReviewCmt;

@WebServlet("/createComment")
public class CreateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateCommentServlet() {
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
		
		List<ReviewCmt> resultList = new ReviewCommentService().selectReviewComment(cmt2);
		RequestDispatcher view = request.getRequestDispatcher("/views/comment/createComment.jsp");
		request.setAttribute("resultList", resultList);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
