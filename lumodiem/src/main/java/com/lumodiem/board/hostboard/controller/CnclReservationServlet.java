package com.lumodiem.board.hostboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.memberboard.vo.Reservation;

@WebServlet("/cnclReservation")
public class CnclReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CnclReservationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("res_no"));
		int resNo = Integer.parseInt(request.getParameter("res_no"));
		System.out.println(resNo);
		int result = 0;
		Reservation r= new Reservation();
		r.setResNo(resNo);
		result = new HostBoardService().cnclReservation(resNo);
		
		JSONObject obj = new JSONObject();
		if(result > 0) {
			obj.put("res_code","200");
			obj.put("res_msg", "정상적으로 예약취소 되었습니다");
		}else {
			obj.put("res_code","500");
			obj.put("res_msg", "예약취소 중 오류가 발생");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
