package com.lumodiem.board.adminboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.account.service.MypageService;
import com.lumodiem.board.adminboard.service.ReportService;
import com.lumodiem.board.adminboard.vo.ReportReview;

@WebServlet("/reportReview")
public class ReportReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReportReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("review_no");
		String temp2 = request.getParameter("report_review_no");
		String searchType = request.getParameter("search_type");
		String searchTxt = request.getParameter("search_txt");
		String accountNickname = request.getParameter("account_nickname");
		String reviewName = request.getParameter("review_name");
		String reviewTxt = request.getParameter("review_txt");
		
		int reviewNo = 0;
		int reportReviewNo=0;
		if(temp!=null) reviewNo=Integer.parseInt(temp);
		if(temp2!=null) reportReviewNo=Integer.parseInt(temp);
		ReportReview option = ReportReview.builder()
				.reportReviewNo(reportReviewNo)
				.reviewNo(reviewNo)
				.searchTxt(searchTxt)
				.searchType(searchType)
				.accountNickname(accountNickname)
				.reviewName(reviewName)
				.reviewTxt(reviewTxt)
				.build();
//		페이징 추가
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		int totalData = new ReportService().reportReviewListCount(option);
		option.setTotalData(totalData);
		request.setAttribute("paging", option);
//		페이징 추가
		
		
		
		
		
		
		
		List<ReportReview> resultList= new ReportService().selectReportReviewList(option);
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/reportReview.jsp");
		request.setAttribute("resultList", resultList);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
