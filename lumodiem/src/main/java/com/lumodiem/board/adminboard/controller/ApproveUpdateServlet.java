package com.lumodiem.board.adminboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.adminboard.service.ApproveSerview;
import com.lumodiem.board.adminboard.vo.Approve;

@WebServlet("/approveUpdate")
public class ApproveUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApproveUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("klass_no");
		String approveCode = request.getParameter("approve_code");
		String approveFb = request.getParameter("approve_fb");
		int klassNo=0;
		if(temp!=null) klassNo= Integer.parseInt(temp);
		Approve approve = Approve.builder()
				.klassNo(klassNo)
				.approveCode(approveCode)
				.approveFb(approveFb)
				.build();
		int result = new ApproveSerview().updateApprove(approve);
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "처리중 오류가 발생하였습니다.");
		if(result > 0) {
		obj.put("res_code", "200");
		obj.put("res_msg", "처리되었습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
