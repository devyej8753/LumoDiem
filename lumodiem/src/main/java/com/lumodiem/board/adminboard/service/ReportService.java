package com.lumodiem.board.adminboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;
import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.account.dao.MypageDao;
import com.lumodiem.board.adminboard.dao.ReportDao;
import com.lumodiem.board.adminboard.vo.ReportKlass;
import com.lumodiem.board.adminboard.vo.ReportReview;
import com.lumodiem.board.adminboard.vo.ReportReviewCmt;
import com.lumodiem.board.hostboard.vo.Klass;

public class ReportService {
	ReportDao dao = new ReportDao();

	public int deleteReportReviewCmt(int reviewCmtNo) {
		SqlSession session = getSqlSession();
		int result = dao.deleteReportReviewCmt(reviewCmtNo, session);
		commitRollback(session, result);
		session.close();
		return result;
	}

	public List<ReportReviewCmt> selectReportReviewCmtList(ReportReviewCmt option) {
		SqlSession session = getSqlSession();
		List<ReportReviewCmt> resultList = dao.selectReportReviewCmtList(option, session);
		session.close();
		return resultList;
	}

	public int deleteReportReview(int reviewNo) {
		SqlSession session = getSqlSession();
		int result = dao.deleteReportReview(reviewNo, session);
		commitRollback(session, result);
		session.close();
		return result;
	}

	public ReportReview selectReportReviewOne(ReportReview option) {
		SqlSession session = getSqlSession();
		option = dao.selectReportReviewOne(option, session);
		session.close();
		return option;
	}

	public List<ReportReview> selectReportReviewList(ReportReview option) {
		SqlSession session = getSqlSession();
		List<ReportReview> resultList = dao.selectReportReviewList(option, session);
		session.close();
		return resultList;
	}

	public int deleteReportKlass(int klassNo) {
		SqlSession session = getSqlSession();
		int result = dao.deleteReportKlass(klassNo, session);
		commitRollback(session, result);
		session.close();
		return result;
	}

	public ReportKlass selectReportKlassOne(ReportKlass klass) {
		SqlSession session = getSqlSession();
		klass = dao.selectReportKlassOne(klass, session);
		session.close();
		return klass;
	}

	public List<ReportKlass> selectReportKlassList(Klass option) {
		SqlSession session = getSqlSession();
		List<ReportKlass> resultList = dao.selectReportKlassList(option, session);
		session.close();
		return resultList;
	}

	public int reportKlassListCount(Klass option) {
		SqlSession session = getSqlSession();
		int result = new ReportDao().klassListCount(session, option);
		session.close();
		return result;
	}

	public int reportReviewListCount(ReportReview option) {
		SqlSession session = getSqlSession();
		int result = new ReportDao().reportReviewListCount(session, option);
		session.close();
		return result;
	}

}
