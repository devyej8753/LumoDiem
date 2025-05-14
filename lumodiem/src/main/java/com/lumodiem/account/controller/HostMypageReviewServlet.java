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

@WebServlet("/hostMypageReview")
public class HostMypageReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HostMypageReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		String urlPath = "/";
		
		Klass option = null;
		List<Klass> approveList = null;
		List<Review> reviewList = null;
		
		if(session != null && session.getAttribute("account") != null) {
			account = (Account)session.getAttribute("account");
			int accountNo = account.getAccountNo();
			option = Klass.builder().accountNo(accountNo).approveCode("A").build();
			
			if(option != null) {
				
//				페이징 추가
				String nowPage = request.getParameter("nowPage");
				if(nowPage != null) {
					option.setNowPage(Integer.parseInt(nowPage));
				}
				
				int totalData = new MypageService().klassListCount(option);
				option.setTotalData(totalData);
				request.setAttribute("paging", option);
//				페이징 추가
				
				approveList = new MypageService().selectApproveListByAccountNo(option);
				reviewList = new MypageService().selectReviewListByHostAccountNo(option);
				request.setAttribute("approveList", approveList);
				request.setAttribute("reviewList", reviewList);
				
				urlPath = "/views/mypage/hostmypagereview.jsp";
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
