package com.lumodiem.account.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lumodiem.account.service.MypageService;
import com.lumodiem.account.vo.Account;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.memberboard.vo.Review;

@WebServlet("/mypageLikeReview")
public class MypageLikeReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageLikeReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		String urlPath = "/";
		
		Klass option = null;
		List<Review> reviewLikeList = null;
		
		if(session != null && session.getAttribute("account") != null) {
			account = (Account)session.getAttribute("account");
			int accountNo = account.getAccountNo();
			option = Klass.builder().accountNo(accountNo).build();
			
			if(option != null) {
//				페이징 추가
				String nowPage = request.getParameter("nowPage");
				if(nowPage != null) {
					option.setNowPage(Integer.parseInt(nowPage));
				}
				
				int totalData = new MypageService().reviewLikeListCount(option);
				option.setTotalData(totalData);
				request.setAttribute("paging", option);
//				페이징 추가
				reviewLikeList = new MypageService().selectReviewLikeByAccountNo(option);
				request.setAttribute("reviewLikeList", reviewLikeList);
				
				urlPath = request.getContextPath()+"/views/mypage/mypagelikereview.jsp";
				RequestDispatcher view = request.getRequestDispatcher(urlPath);
				view.forward(request, response);
			} else {
				response.sendRedirect("/");
			}
		} else {
			response.sendRedirect("/");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
