package com.lumodiem.board.adminboard.service;

import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;
import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.board.adminboard.dao.ApproveDao;
import com.lumodiem.board.adminboard.dao.ReportDao;
import com.lumodiem.board.adminboard.vo.Approve;
import com.lumodiem.board.hostboard.vo.Klass;

public class ApproveSerview {
	ApproveDao dao = new ApproveDao();

	public int updateApprove(Approve approve) {
		SqlSession session = getSqlSession();
		int result = dao.updateApprove(approve, session);
		commitRollback(session, result);
		session.close();
		return result;
	}

	public List<Klass> selectApproveList(Klass option) {
		SqlSession session = getSqlSession();
		List<Klass> resultList = dao.selectApproveList(option, session);
		session.close();
		return resultList;
	}

	public int approveListCount(Klass option) {
		SqlSession session = getSqlSession();
		int result = dao.approveListCount(session, option);
		session.close();
		return result;
	}
}
