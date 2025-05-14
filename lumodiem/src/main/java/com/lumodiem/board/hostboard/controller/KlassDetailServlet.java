package com.lumodiem.board.hostboard.controller;

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
import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassAttach;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.hostboard.vo.KlassLike;
import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewLike;

@WebServlet("/klassDetail")
public class KlassDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public KlassDetailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = request.getContextPath() + "/";
		int totalLikeCount = 0;
		int myLikeCount = 0;
		KlassLike klassLike = null;
		List<KlassDate> klassDate = null;
		List<KlassAttach> klassAttach = null;
		List<Review> review = null;

		if (session != null && session.getAttribute("account") != null) {
			int klassNo = Integer.parseInt(request.getParameter("klass_no"));

			Klass klass = new HostBoardService().selectKlassOne(klassNo);
			klassDate = new HostBoardService().selectKlassDate(klassNo);

			klassAttach = new HostBoardService().selectAttachList(klassNo);

			review = new HostBoardService().selectReviewByKlass(klassNo);

			Account account = (Account) session.getAttribute("account");
			totalLikeCount = new HostBoardService().countLikeByKlassNo(klassNo);
			klassLike = KlassLike.builder().accountNo(account.getAccountNo()).klassNo(klassNo).build();
			myLikeCount = new HostBoardService().countLikeByAccountNoKlassNo(klassLike);
			request.setAttribute("totalLikeCount", totalLikeCount);
			request.setAttribute("myLikeCount", myLikeCount);
			request.setAttribute("review", review);

			url = request.getContextPath() + "/views/klass/klassDetail.jsp";
			RequestDispatcher view = request.getRequestDispatcher(url);
			request.setAttribute("klass", klass);
			request.setAttribute("klassDate", klassDate);
			request.setAttribute("klassAttach", klassAttach);
			request.setAttribute("review", review);
			view.forward(request, response);

		} else {
			response.sendRedirect(url);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}