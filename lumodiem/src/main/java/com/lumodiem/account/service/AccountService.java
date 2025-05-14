package com.lumodiem.account.service;

import com.lumodiem.account.dao.AccountDao;
import com.lumodiem.account.vo.Account;
import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;
import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;

import org.apache.ibatis.session.SqlSession;

public class AccountService {

	public int accountCreateOne(Account act) {
		SqlSession session = getSqlSession();
		int result = new AccountDao().accountCreateOne(session, act);
		commitRollback(session, result);
		session.close();
		return result;
	}

	public Account loginAccount(Account act) {
		SqlSession session = getSqlSession();
		Account account = new AccountDao().loginAccount(session, act);
		session.close();
		return account;
	}

	public Account accountDuplicateCheck(Account act) {
		SqlSession session = getSqlSession();
		Account account = new AccountDao().accountDuplicateCheck(session, act);
		session.close();
		return account;
	}

	public Account searchIdNameByTwoInfo(Account act) {
		SqlSession session = getSqlSession();
		Account account = new AccountDao().searchIdNameByTwoInfo(session, act);
		session.close();
		return account;
	}

	public int resetPw(Account act) {
		SqlSession session = getSqlSession();
		int result = new AccountDao().resetPw(session, act);
		commitRollback(session, result);
		session.close();
		return result;
	}

	public Account mypageUpdateDuplicateCheck(Account act) {
		SqlSession session = getSqlSession();
		Account account = new AccountDao().mypageUpdateDuplicateCheck(session, act);
		session.close();
		return account;
	}

	public int mypageUpdateEndFin(Account act) {
		SqlSession session = getSqlSession();
		int result = new AccountDao().mypageUpdateEndFin(session, act);
		commitRollback(session, result);
		session.close();
		return result;
	}



}
