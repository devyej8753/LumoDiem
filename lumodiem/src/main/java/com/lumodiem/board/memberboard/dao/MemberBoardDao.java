package com.lumodiem.board.memberboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.adminboard.vo.ReportReview;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;
import com.lumodiem.board.memberboard.vo.ReviewLike;
import com.lumodiem.board.memberboard.vo.ReviewMapping;

public class MemberBoardDao {

	public int insertReview(SqlSession session, Review r) {
		session.insert("reviewMapper.reviewInsert",r);
		return r.getReviewNo();
	}
	public int insertReviewAttach(SqlSession session, ReviewAttach a) {
		session.insert("reviewMapper.reviewAttachInsert",a);
		return a.getAttachNo(); 
	}
	public int insertReviewMapping(SqlSession session, ReviewMapping m) {
		int result = session.insert("reviewMapper.reviewMappingInsert",m);
		return result;
	}
	public List<Review> selectReviewList(SqlSession session,Review option){
		return session.selectList("reviewMapper.reviewList",option);
	}
	public Review selectReviewOne(SqlSession session, int reviewNo) {
		return session.selectOne("reviewMapper.reviewOne",reviewNo);
	}
	public Review ReviewOne(SqlSession session, int reviewNo) {
		return session.selectOne("reviewMapper.reviewNoimg",reviewNo);
	}
	public ReviewAttach selectAttachOne(SqlSession session, int attachNo) {
		return session.selectOne("reviewMapper.attachOne",attachNo);
	}
	public List<Klass> attendedKlass(SqlSession session, int accountNo){
		return session.selectList("reviewMapper.attendedKlass",accountNo);
	}
	public List<Klass> searchResNo(SqlSession session, int resNo){
		return session.selectList("reviewMapper.attendedKlass",resNo);
	}
	public List<Klass> searchKlassDateNo(SqlSession session, int klassDateNo){
		return session.selectList("reviewMapper.attendedKlass",klassDateNo);
	}
	public List<ReviewAttach> selectNoImgReview(SqlSession session, int reviewNo) {
		return session.selectList("reviewMapper.noImgReview",reviewNo);
	}
	public Review selectReviewNo(SqlSession session, int reviewNo) {
		return session.selectOne("reviewMapper.reviewNoimg",reviewNo);
	}
	public int deleteReview(SqlSession session, int reviewNo) {
		return session.delete("reviewMapper.deleteReview",reviewNo);
	}
	public int deleteAttach(SqlSession session, int attachNo) {
		return session.delete("reviewMapper.deleteAttach",attachNo);
	}
	public int deleteReviewOne(SqlSession session, int reviewNo) {
		return session.delete("reviewMapper.deleteReviewOne",reviewNo);
	}
	public int countLikeByReviewNo(SqlSession session, int reviewNo) {
		return session.selectOne("reviewMapper.countLikeByReviewNo", reviewNo);
	}
	public int countLikeByAccountNoReviewNo(SqlSession session, ReviewLike reviewLike) {
		return session.selectOne("reviewMapper.countLikeByAccountNoReviewNo", reviewLike);
	}
	public int reviewUnlikeToLike(SqlSession session, ReviewLike reviewLike) {
		return session.insert("reviewMapper.reviewUnlikeToLike",reviewLike);
	}
	public int reviewLikeToUnlike(SqlSession session, ReviewLike reviewLike) {
		return session.delete("reviewMapper.reviewLikeToUnlike",reviewLike);
	}
	public ReviewAttach selectAttachOneByReviewNo(SqlSession session, int reviewNo) {
		return session.selectOne("reviewMapper.noImgReview",reviewNo);
	}
	public int updateReview(SqlSession session, Review review) {
		int result = session.update("reviewMapper.reviewUpdate",review);
		return result;
	}
	public int deletebeforeImg(SqlSession session, ReviewAttach beforeImg) {
		return session.delete("reviewMapper.deletebeforeImg",beforeImg);
	}
	public int insertReportReview(SqlSession session, ReportReview rev) {
		return session.insert("reviewMapper.insertReportReview",rev);
	}
	public int selectReviewCount(SqlSession session, Review option) {
		return session.selectOne("reviewMapper.selectReviewCount", option);
	}
	
}
