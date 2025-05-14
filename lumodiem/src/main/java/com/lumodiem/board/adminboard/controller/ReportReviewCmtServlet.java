package com.lumodiem.board.adminboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.adminboard.service.ReportService;
import com.lumodiem.board.adminboard.vo.ReportReviewCmt;

@WebServlet("/reportReviewCmt")
public class ReportReviewCmtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReportReviewCmtServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("report_review_cmt_no");
		String searchType = request.getParameter("search_type");
		String searchTxt = request.getParameter("search_txt");
		int reportReviewCmtNo = 0;
		if(temp!=null) reportReviewCmtNo = Integer.parseInt(temp);
		ReportReviewCmt option = ReportReviewCmt.builder()
				.reportReviewCmtNo(reportReviewCmtNo)
				.searchTxt(searchTxt)
				.searchType(searchType)
				.build();
		
		List<ReportReviewCmt> resultList= new ReportService().selectReportReviewCmtList(option);
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/reportReviewCmt.jsp");
		request.setAttribute("resultList", resultList);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
