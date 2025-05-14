package com.lumodiem.board.hostboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;
import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.account.vo.Account;
import com.lumodiem.board.hostboard.dao.HostBoardDao;
import com.lumodiem.board.hostboard.vo.Chat;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassAttach;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.hostboard.vo.KlassLike;
import com.lumodiem.board.hostboard.vo.KlassMapping;
import com.lumodiem.board.hostboard.vo.KlassReport;
import com.lumodiem.board.memberboard.dao.MemberBoardDao;
import com.lumodiem.board.memberboard.vo.Reservation;
import com.lumodiem.board.memberboard.vo.Review;

public class HostBoardService {
	
	public int deleteKlassOne(int klassNo) {
		SqlSession session = getSqlSession();
		int klassResult = new HostBoardDao().deleteKlassOne(session,klassNo);
		commitRollback(klassResult,session);
		session.close();
		return klassResult;
	}
	
	public int deleteKlassAndAttach(int klassNo, int attachNo) {
		SqlSession session = getSqlSession();
		int result = 0;
		int klassResult = new HostBoardDao().deleteKlass(session, klassNo);
		int attachResult = new HostBoardDao().deleteAttachOneByKlass(session, attachNo);		
		if(klassResult > 0 && attachResult > 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}

	// 기존 파일 O 새로운 파일 X , 클래스 정보만 update insert 하는 메소드
	public int updateImgToNoImg(Klass option,KlassDate klassDate,KlassAttach atc) {
		SqlSession session = getSqlSession();
		int result = 0;
		// 기존 파일 delete만 하고 클래스 정보만 update 하기 , date는 delete->insert
		// 클래스 정보 업데이트
		int updateResult = new HostBoardDao().updateKlass(session, option);
		// 클래스 예약일 delete -> insert
		int deleteDateResult = new HostBoardDao().deleteDateOne(session,option);
		int insertDateResult = new HostBoardDao().insertKlassDate(session,klassDate);
		// 저장되어있는 사진 지우기
		int deleteAttachResult = new HostBoardDao().deleteAttachOne(session,atc);
		// mapping 은 attach가 지워지면 지워지도록 되어있어서 따로 delete 안해줘도 된다.
		
		if(updateResult > 0 && deleteDateResult > 0 
				&& insertDateResult > 0 && deleteAttachResult > 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
	// 기존파일O 새로운파일 O *****테스트 성공*****
	public int updateImgToImg(Klass option,KlassDate klassDate,KlassAttach a,KlassMapping m,KlassAttach atc) {
		SqlSession session = getSqlSession();
		int result = 0;
		// 수정하면서 꼭 사용해야 할 메소드 3개 
		int updateResult = new HostBoardDao().updateKlass(session, option);
		// klassNo 값의 klass_date 를 delete 후 insert 
		int deleteDateResult = new HostBoardDao().deleteDateOne(session,option);
		int insertDateResult = new HostBoardDao().insertKlassDate(session,klassDate);
		
		// 이전 사진 지우기 메소드
		int deleteAttachResult = new HostBoardDao().deleteAttachOne(session,atc);
		
		// 사진 넣기 메소드 2개 
		int insertAttachResult = new HostBoardDao().insertKlassAttach(session,a);
		m.setAttachNo(insertAttachResult);
		// 추후 attach_no delete되면 mappin_no까지 같이 지워지는 작업 진행 되면 안써도 될 메소드임.
		int insertMapResult = new HostBoardDao().insertKlassMapping(session, m);
		
		if(updateResult > 0 && deleteDateResult >0 && insertDateResult > 0 
				&& deleteAttachResult > 0 && insertAttachResult > 0 && insertMapResult > 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
		
	}
	
	// 기존 파일 X 새로운 파일 X 클래스 정보만 update,insert
	public int updateNoImgToNoImg(Klass option, KlassDate klassDate) {
		SqlSession session = getSqlSession();
		int result = 0;
		// 클래스 정보 업데이트
		int updateResult = new HostBoardDao().updateKlass(session, option);
		
		// 예약일 정보 delete -> insert
		int deleteDateResult = new HostBoardDao().deleteDateOne(session,option);
		int insertDateResult = new HostBoardDao().insertKlassDate(session,klassDate);
		
		if(updateResult > 0 && deleteDateResult > 0 && insertDateResult > 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
	// 기존 파일 X 새로운 파일 O -> 클래스 정보 update & 파일정보 insert *****테스트 성공!!!!!*****
	public int updateNoImgToImg(Klass option,KlassDate klassDate, KlassAttach a,KlassMapping m) {
		SqlSession session = getSqlSession();
		int result = 1;
		
		// 클래스 정보 update
		int updateResult = new HostBoardDao().updateKlass(session, option);
		// klassDate 를 delete-> insert
		int deleteDateResult = new HostBoardDao().deleteDateOne(session,option);
		int insertDateResult = new HostBoardDao().insertKlassDate(session,klassDate);
		
		// 파일 정보 insert / mappint&attach
		int insertAttachResult = new HostBoardDao().insertKlassAttach(session,a);
		m.setAttachNo(insertAttachResult);
		int insertMapResult = new HostBoardDao().insertKlassMapping(session, m);
		
		if(updateResult > 0 && deleteDateResult > 0 && insertDateResult > 0 
				&& insertAttachResult > 0 && insertMapResult > 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}

	public KlassAttach selectAttachOne(int attachNo) {
		SqlSession session = getSqlSession();
		KlassAttach a = new HostBoardDao().selectAttachOne(session,attachNo);
		session.close();
		return a;
	}
	
	public List<KlassDate> selectDateList(int klassNo){
		SqlSession session = getSqlSession();
		List<KlassDate> dateList = new HostBoardDao().selectDateList(session,klassNo);
		return dateList;
	}
	
	public List<KlassDate> selectKlassDate(int klassNo) {
		SqlSession session = getSqlSession();
		List<KlassDate> klassDate = new HostBoardDao().selectKlassDate(session,klassNo);
		return klassDate;
	}
	
	public Account selectAccountOne(int klassNo) {
		SqlSession session = getSqlSession();
		Account account = new HostBoardDao().selectAccountOne(session,klassNo);
		session.close();
		return account;
	}
	
	public Klass selectKlassOne(int klassNo) {
		SqlSession session = getSqlSession();
		Klass klass = new HostBoardDao().selectKlassOne(session,klassNo);
		session.close();
		return klass;
	}
	
	public List<Klass> searchImgBoardList(Klass option){
		SqlSession session = getSqlSession();
		List<Klass> searchList = new HostBoardDao().searchImgBoardList(session,option);
		session.close();
		return searchList;
	}
	
	public List<Klass> searchBoardList(Klass option){
		SqlSession session = getSqlSession();
		List<Klass> searchList = new HostBoardDao().searchBoardList(session,option);
		session.close();
		return searchList;
	}
	
	public List<Review> selectReviewByKlass(int klassNo){
		SqlSession session = getSqlSession();
		List<Review> review = new HostBoardDao().selectReviewByKlass(session,klassNo);
		return review;
	}
	
	public List<KlassAttach> selectAttachList(int klassNo) {
		SqlSession session = getSqlSession();
		List<KlassAttach> klassAttach = new HostBoardDao().selectAttachList(session,klassNo);
		return klassAttach;
	}
	
	public int insertKlassDate(KlassDate klassDate) {
		SqlSession session = getSqlSession();
		int dateResult = new HostBoardDao().insertKlassDate(session,klassDate);
		if(dateResult > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return dateResult;
	}
	
	public int insertBoardWithoutImg(Klass option, KlassDate klassDate) {
		// 이미지 없이 등록하는 클래스 게시글
		SqlSession session = getSqlSession();
		int result =0;
		int klassNo = new HostBoardDao().insertBoard(session, option); 
		klassDate.setKlassNo(klassNo);
		int klassDateNo = new HostBoardDao().insertKlassDate(session, klassDate);
		
		if(klassNo > 0 && klassDateNo > 0) {
			result = 1;
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
	public int insertBoardWithImg(Klass option, KlassDate klassDate,KlassAttach a, KlassMapping m) {
		// 이미지랑 같이 등록하는 클래스 게시글
		SqlSession session = getSqlSession();
		int result = 0;
		int klassNo = new HostBoardDao().insertBoard(session, option); 
		klassDate.setKlassNo(klassNo);
		int klassDateNo = new HostBoardDao().insertKlassDate(session, klassDate);
		
		int attachNo = new HostBoardDao().insertKlassAttach(session,a);
		
		m.setKlassNo(option.getKlassNo());
		m.setAttachNo(a.getAttachNo());
		
		int mappingNo = new HostBoardDao().insertKlassMapping(session,m);
		
		if(klassNo > 0 && klassDateNo > 0 && attachNo > 0 && mappingNo > 0) {
			result = 1;
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	public KlassAttach selectAttachOneByKlassNo(int klassNo) {
		SqlSession session = getSqlSession();
		KlassAttach result = new HostBoardDao().selectAttachOneByKlassNo(session,klassNo);
		return result;
	}

	public int reserveKlass(Reservation reservation) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().reserveKlassRes(session,reservation);
		commitRollback(result, session);
		session.close();
		return result;
	}

	public int countLikeByKlassNo(int klassNo) {
		SqlSession session = getSqlSession();
		int count = new HostBoardDao().countLikeByKlassNo(session,klassNo);
		session.close();
		return count;
	}

	public int countLikeByAccountNoKlassNo(KlassLike klassLike) {
		SqlSession session = getSqlSession();
		int count = new HostBoardDao().countLikeByAccountNoKlassNo(session,klassLike);
		session.close();
		return count;
	}

	public int klassUnlikeToLike(KlassLike klassLike) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().klassUnlikeToLike(session,klassLike);
		commitRollback(result, session);
		session.close();
		return result;
	}

	public int klassLikeToUnlike(KlassLike klassLike) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().klassLikeToUnlike(session,klassLike);
		commitRollback(result, session);
		session.close();
		return result;
	}
//	클래스의 채팅 내역 입력
	public int updateKlassChat(Chat chat) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().updateKlassChat(session, chat);
		commitRollback(result, session);
		session.close();
		return result;
	}

	public Chat selectKlassChatByKlassNo(Chat chat) {
		SqlSession session = getSqlSession();
		Chat returnChat = new HostBoardDao().selectKlassChatByKlassNo(session, chat);
		return returnChat;
	}

	public KlassDate klassCountByKlassMax(KlassDate option) {
		SqlSession session = getSqlSession();
		KlassDate kd = new HostBoardDao().klassCountByKlassMax(session,option);
		session.close();
		return kd;
	}

	public List<Reservation> resSelect(Reservation reservation) {
		SqlSession session = getSqlSession();
		List<Reservation> result = new HostBoardDao().resSelect(session,reservation);
		session.close();
		return result;
	}
	
	// 클래스 신고
	public int insertKlassReport(KlassReport klassReport) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().insertKlassReport(session,klassReport);
		commitRollback(session,result);
		session.close();
		return result;
	}

	public Reservation selectResNo(int resNo) {
		SqlSession session = getSqlSession();
		Reservation reservation = new HostBoardDao().selectResNo(session,resNo);
		session.close();
		return reservation;
	}

	public int cnclReservation(int resNo) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().cnclReservation(session,resNo);
		commitRollback(session, result);
		session.close();
		return result;
	}
	
//	결제 성공시 C -> R 변경
	public int updateReservationOneCtoR(int resNo) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().updateReservationOneCtoR(session,resNo);
		commitRollback(result, session);
		return result;
	}
//	예약 번호로 예약 정보 조회
	public Reservation selectReservationOne(int resNo) {
		SqlSession session = getSqlSession();
		Reservation reservaion = new HostBoardDao().selectReservationOne(session,resNo);
		session.close();
		return reservaion;
	}

	public int selectKlassCount(Klass option) {
		SqlSession session = getSqlSession();
		int result = new HostBoardDao().selectKlassCount(session, option);
		session.close();
		return result;
	}
	
}
