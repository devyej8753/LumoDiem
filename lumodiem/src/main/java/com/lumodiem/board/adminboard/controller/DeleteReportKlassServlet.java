package com.lumodiem.board.adminboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.adminboard.service.ReportService;
import com.lumodiem.board.adminboard.vo.ReportKlass;


@WebServlet("/deleteReportKlass")
public class DeleteReportKlassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteReportKlassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("klass_no");
		int klassNo = 0;
		if(temp!=null)klassNo = Integer.parseInt(temp);
		int result = new ReportService().deleteReportKlass(klassNo);
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "삭제 오류");
		if(result>0) {
			obj.put("res_code", "200");
			obj.put("res_msg","삭제 완료");
		}
		response.setContentType("applocation/json; charset=UTF-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
