package com.lumodiem.account.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.account.vo.Account;
import com.lumodiem.account.vo.ReviewDTO;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.hostboard.vo.KlassLike;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewCmt;
import com.lumodiem.board.memberboard.vo.ReviewLike;

public class MypageDao {

	public List<Klass> selectApproveListByAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.klassListSearch", option);
	}

	public List<Review> selectReviewListByHostAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectReviewListByHostAccountNo", option);
	}

	public List<Klass> selectKlassLikeByAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectKlassLikeByAccountNo", option);
	}

	public List<Review> selectReviewLikeByAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectReviewLikeByAccountNo", option);
	}

	public List<ReviewCmt> selectReviewCmtListByAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectReviewCmtListByAccountNo", option);
	}

	public List<Klass> selectReservationKlassListByAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectReservationKlassListByAccountNo", option);
	}

	public List<KlassDate> selectReservationKlassDateListByAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectReservationKlassDateListByAccountNo", option);
	}

	public List<ReviewDTO> selectReviewKlassListByAccountNo(SqlSession session, Klass option) {
		return session.selectList("mypageMapper.selectReviewKlassListByAccountNo", option);
	}

	public int deleteAccount(SqlSession session, Account act) {
		return session.update("mypageMapper.deleteAccount", act);
	}

	public int klassListCount(SqlSession session, Klass option) {
		return session.selectOne("mypageMapper.klassListCount",option);
	}

	public int reservationKlassListCount(SqlSession session, Klass option) {
		return session.selectOne("mypageMapper.reservationKlassListCount",option);
	}

	public int klassLikeListCount(SqlSession session, Klass option) {
		return session.selectOne("mypageMapper.klassLikeListCount",option);
	}

	public int reviewLikeListCount(SqlSession session, Klass option) {
		return session.selectOne("mypageMapper.reviewLikeListCount",option);
	}

	public int reviewCmtListCount(SqlSession session, Klass option) {
		return session.selectOne("mypageMapper.reviewCmtListCount",option);
	}



}
