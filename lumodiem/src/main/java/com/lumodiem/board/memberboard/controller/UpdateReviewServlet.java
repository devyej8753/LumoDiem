package com.lumodiem.board.memberboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.Review;

@WebServlet("/updateReviewPage")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("review_no");
		System.out.println(temp);
		int reviewNo = 0;
		if(temp != null) reviewNo = Integer.parseInt(temp);
		System.out.println(reviewNo);
		Review review = new MemberBoardService().ReviewOne(reviewNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/review/updateReview.jsp");
		request.setAttribute("review", review);
		System.out.println(review);
		view.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

