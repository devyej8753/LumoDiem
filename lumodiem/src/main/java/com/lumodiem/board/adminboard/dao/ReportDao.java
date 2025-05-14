package com.lumodiem.board.adminboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.adminboard.vo.ReportKlass;
import com.lumodiem.board.adminboard.vo.ReportReview;
import com.lumodiem.board.adminboard.vo.ReportReviewCmt;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.memberboard.vo.Review;

public class ReportDao {
	
	public int deleteReportReviewCmt(int reviewCmtNo, SqlSession session) {
		return session.insert("reportMapper.deleteReportReviewCmt",reviewCmtNo);
	}
	
	public List<ReportReviewCmt> selectReportReviewCmtList(ReportReviewCmt option, SqlSession session){
		return session.selectList("reportMapper.selectReportReviewCmt",option);
	}
	
	
	public int deleteReportReview(int reviewNo, SqlSession session) {
		return session.insert("reportMapper.deleteReportReview",reviewNo);
	}
	
	
	public ReportReview selectReportReviewOne(ReportReview option, SqlSession session) {
		return session.selectOne("reportMapper.reportReviewOne",option);
	}

	public List<ReportReview> selectReportReviewList(ReportReview option,SqlSession session){
		return session.selectList("reportMapper.selectReportReview",option);
		
	}
	
	public int deleteReportKlass(int klassNo, SqlSession session) {
		return session.delete("reportMapper.deleteReportKlass",klassNo);
	}
	
	public ReportKlass selectReportKlassOne(ReportKlass klass,SqlSession session) {
		return session.selectOne("reportMapper.reportKlassOne",klass);
	}
	
	public List<ReportKlass> selectReportKlassList (Klass option,SqlSession session){
		return session.selectList("reportMapper.selectReportKlass",option);
	}

	public int klassListCount(SqlSession session, Klass option) {
		return session.selectOne("reportMapper.klassListCount",option);
	}

	public int reportReviewListCount(SqlSession session, ReportReview option) {
		return session.selectOne("reportMapper.reportReviewListCount",option);
	}
}
