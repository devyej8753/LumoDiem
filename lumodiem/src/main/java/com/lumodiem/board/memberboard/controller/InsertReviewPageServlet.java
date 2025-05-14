package com.lumodiem.board.memberboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lumodiem.account.vo.Account;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.Reservation;

@WebServlet("/insertReviewPage")
public class InsertReviewPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertReviewPageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account ac = null;
		HttpSession session = request.getSession();
		if(session != null && session.getAttribute("account") != null) {
		ac = (Account)session.getAttribute("account");
		int accountNo = ac.getAccountNo();
		List<Klass> klass = new MemberBoardService().attendedKlass(accountNo);
		request.setAttribute("klass", klass);
		}
		RequestDispatcher view = request.getRequestDispatcher("/views/review/insertReview.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
