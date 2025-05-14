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
import com.lumodiem.board.adminboard.vo.ReportKlass;
import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassDate;

@WebServlet("/approveDetail")
public class ApproveDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApproveDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String temp = request.getParameter("klass_no");
		String approveCode = request.getParameter("approve_code");
		int klassNo = 0;
		if(temp!=null) klassNo=Integer.parseInt(request.getParameter("klass_no"));
		
		ReportKlass klass = ReportKlass.builder()
				.klassNo(klassNo)
				.approveCode(approveCode)
				.build();
		
		
		klass = new ReportService().selectReportKlassOne(klass);
		List<KlassDate> klassDate = new HostBoardService().selectKlassDate(klassNo);
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/approveDetail.jsp");
		request.setAttribute("klass", klass);
		request.setAttribute("klassDate", klassDate);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
