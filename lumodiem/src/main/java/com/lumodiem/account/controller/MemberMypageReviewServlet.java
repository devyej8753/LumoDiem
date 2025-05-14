package com.lumodiem.account.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import com.lumodiem.account.vo.ReviewDTO;
import com.lumodiem.board.hostboard.vo.Klass;

@WebServlet("/memberMypageReview")
public class MemberMypageReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberMypageReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account account = null;
		String urlPath = "/";
		
		Klass option = null;
		List<Klass> klassList = null;
		List<Klass> beforeKlassList = null;
		List<ReviewDTO> reviewDTO = null;
		
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
				System.out.println("option : " + option);
				
				int totalData = new MypageService().reservationKlassListCount(option);
				option.setTotalData(totalData);
				request.setAttribute("paging", option);
//				페이징 추가
				
				
				
				klassList = new MypageService().selectReservationKlassListByAccountNo(option);
				reviewDTO = new MypageService().selectReviewKlassListByAccountNo(option);
				beforeKlassList = new ArrayList<Klass>();
				LocalDateTime now = LocalDateTime.now();
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				now.format(dtf);
				
				for(Klass klass : klassList) {
					if(klass.getKlassEnd() != null) {
						LocalDateTime temp = LocalDateTime.parse(klass.getKlassEnd(), dtf);
						System.out.println(temp);
						if(temp.isBefore(now)) {
							beforeKlassList.add(klass);
						} 
					} else {
					}
					
					
				}
				request.setAttribute("beforeKlassList", beforeKlassList);
				request.setAttribute("reviewDTO", reviewDTO);
//				for(int i = 0; i < beforeKlassList.size(); i++) {
//					System.out.println("beforeKlassList.getKlassDateNo : " + beforeKlassList.get(i).getKlassDateNo());
//				}
//				for(int i = 0; i < beforeKlassList.size(); i++) {
//					System.out.println("reviewDTO.getKlassDateNo : " + reviewDTO.get(i).getKlassDateNo());
//				}
				
				urlPath = request.getContextPath()+"/views/mypage/membermypagereview.jsp";
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