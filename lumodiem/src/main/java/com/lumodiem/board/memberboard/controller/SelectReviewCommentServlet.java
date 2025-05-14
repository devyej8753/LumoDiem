package com.lumodiem.board.memberboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.memberboard.service.ReviewCommentService;
import com.lumodiem.board.memberboard.vo.ReviewCmt;

@WebServlet("/selectReviewComment")
public class SelectReviewCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectReviewCommentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("reviewCommentClicked");
		int reviewCmtNo = 0;
		if(temp!=null) reviewCmtNo = Integer.parseInt(temp);
		ReviewCmt cmt = new ReviewCommentService().selectReviewCommentDetail(reviewCmtNo);
		RequestDispatcher view = request.getRequestDispatcher("/views/comment/directSelectComment.jsp");
		request.setAttribute("cmt", cmt);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
