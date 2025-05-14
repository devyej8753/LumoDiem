package com.lumodiem.board.hostboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.KlassReport;

@WebServlet("/klassReport")
public class KlassReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassReportServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp1 = request.getParameter("klass_no");
		String temp2 = request.getParameter("account");
		int result = 0;
		int klassNo = 0;
		int accountNo = 0;
		
		if(temp1 != null) klassNo = Integer.parseInt(temp1);
		if(temp2 != null) accountNo = Integer.parseInt(temp2);
		String reportKlassTxt = request.getParameter("report_klass_txt");
		System.out.println("신고"+klassNo);
		KlassReport klassReport = KlassReport.builder()
								.accountNo(accountNo)
								.klassNo(klassNo)
								.reportKlassTxt(reportKlassTxt)
								.build();
		
		result = new HostBoardService().insertKlassReport(klassReport);
		
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
