package com.lumodiem.account.dao;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.account.vo.Account;

public class AccountDao {

	public int accountCreateOne(SqlSession session, Account act) {
		int result = session.insert("accountMapper.accountInsert", act);
		return result;
	}

	public Account loginAccount(SqlSession session, Account act) {
		Account account = session.selectOne("accountMapper.loginSelect", act);
		return account;
	}

	public Account accountDuplicateCheck(SqlSession session, Account act) {
		Account account = session.selectOne("accountMapper.accountDuplicateCheck", act);
		return account;
	}

	public Account searchIdNameByTwoInfo(SqlSession session, Account act) {
		Account account = session.selectOne("accountMapper.searchIdNameByTwoInfo", act);
		return account;
	}

	public int resetPw(SqlSession session, Account act) {
		int result = session.update("accountMapper.resetPw", act);
		return result;
	}

	public Account mypageUpdateDuplicateCheck(SqlSession session, Account act) {
		Account account = session.selectOne("accountMapper.mypageUpdateDuplicateCheck", act);
		return account;
	}

	public int mypageUpdateEndFin(SqlSession session, Account act) {
		int result = session.update("accountMapper.mypageUpdateEndFin", act);
		return result;
	}



}
