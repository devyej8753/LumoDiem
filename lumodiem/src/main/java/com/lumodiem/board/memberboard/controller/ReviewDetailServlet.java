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
import com.lumodiem.board.memberboard.service.ReviewCommentService;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;
import com.lumodiem.board.memberboard.vo.ReviewCmt;
import com.lumodiem.board.memberboard.vo.ReviewLike;

@WebServlet("/reviewDetail")
public class ReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewDetailServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = request.getContextPath() + "/";
        int totalLikeCount = 0;
        int myLikeCount = 0;
        ReviewLike reviewLike = null;
        List<ReviewAttach> noImg = null;
        List<ReviewCmt> reviewCmt = null;
        Account account = null;
        if(session != null && session.getAttribute("account") != null) {
            account = (Account)session.getAttribute("account");
            int reviewNo = Integer.parseInt(request.getParameter("review_no"));
            
            Review review = null;
           
            noImg = new MemberBoardService().selectNoImgReview(reviewNo);

            // 이미지 여부 체크 방식 개선
            if(noImg == null || noImg.isEmpty()) {
                review = new MemberBoardService().selectReviewNo(reviewNo);
            } else {
                review = new MemberBoardService().selectReviewOne(reviewNo);
            }

            if (review == null) {
                response.sendRedirect(url); // 리뷰가 없으면 홈으로 이동
                return;
            }

            totalLikeCount = new MemberBoardService().countLikeByReviewNo(reviewNo);
            reviewLike = ReviewLike.builder().accountNo(account.getAccountNo()).reviewNo(reviewNo).build();
            myLikeCount = new MemberBoardService().countLikeByAccountNoReviewNo(reviewLike);

            // 리뷰 댓글 불러오기
            ReviewCmt option = ReviewCmt.builder().reviewNo(reviewNo).build();
            reviewCmt = new ReviewCommentService().selectReviewComment(option);
            
            
            // JSP 페이지로 데이터 전달
            RequestDispatcher view = request.getRequestDispatcher("/views/review/reviewDetail.jsp");
            request.setAttribute("totalLikeCount", totalLikeCount);
            request.setAttribute("myLikeCount", myLikeCount);
            request.setAttribute("review", review);
            request.setAttribute("reviewCmt", reviewCmt);
            System.out.println("테스트123");
            view.forward(request, response);
        } else {
            response.sendRedirect(url);
        }
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
