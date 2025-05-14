package com.lumodiem.board.memberboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.account.vo.Account;
import com.lumodiem.board.adminboard.vo.ReportReview;
import com.lumodiem.board.memberboard.service.MemberBoardService;

@WebServlet("/reviewReport")
public class ReviewReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewReportServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp1 = request.getParameter("review_no");
		String temp2 = request.getParameter("account");
		int result = 0;
		int reviewNo = 0;
		int accountNo = 0;
		if(temp1 != null) reviewNo = Integer.parseInt(temp1);
		if(temp2 != null) accountNo = Integer.parseInt(temp2);
		String reportReviewTxt = request.getParameter("report_review_txt");
		System.out.println(accountNo);
		ReportReview rev = ReportReview.builder().accountNo(accountNo).reviewNo(reviewNo).reportReviewTxt(reportReviewTxt).build();
		result = new MemberBoardService().insertReportReview(rev);
		
		
		JSONObject obj = new JSONObject();
		if(result > 0) {
			obj.put("res_code", "200");
			obj.put("res_msg", "정상적으로 신고가 완료되었습니다.");
		}else {
			obj.put("res_code", "500");
			obj.put("res_msg", "게시글 신고중 오류가 발생하였습니다.");
			
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
