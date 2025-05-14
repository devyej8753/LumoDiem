package com.lumodiem.common.payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lumodiem.board.hostboard.service.HostBoardService;

@WebServlet("/reservation/fail")
public class ReservationFailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReservationFailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        System.out.println("/reservation/fail");
		if(session != null && session.getAttribute("account") != null) {
			int resNo = (int)session.getAttribute("res_no");
			RequestDispatcher view = request.getRequestDispatcher("/klassBoardList");
			view.forward(request, response);
		} else {
			response.sendRedirect("/");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
 