package com.lumodiem.board.adminboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.adminboard.service.ReportService;
import com.lumodiem.board.adminboard.vo.ReportReview;
import com.lumodiem.board.memberboard.vo.Review;

@WebServlet("/reportReviewDetail")
public class ReportReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReportReviewDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("report_review_no");
		String temp2 = request.getParameter("review_no");
		int reportReviewNo =0;
		int reviewNo=0;
		if(temp!=null)reportReviewNo=Integer.parseInt(temp);
		if(temp2!=null)reviewNo=Integer.parseInt(temp2);
		
		ReportReview option = ReportReview.builder()
				.reportReviewNo(reportReviewNo)
				.reviewNo(reviewNo)
				.build();

		option  = new ReportService().selectReportReviewOne(option);

		RequestDispatcher view = request.getRequestDispatcher("/views/admin/reportReviewDetail.jsp");
		request.setAttribute("review", option);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
