package com.lumodiem.account.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//	Lombok을 사용한 기본, 매개변수 생성자. getter, setter. toString. Builder. 사용용이. 
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Account {
	private int accountNo;
	private String accountName;
	private String accountId;
	private String accountPw;
	private String accountNickname;
	private String accountSsn;
	private String accountAddress;
	private String accountPhone;
	private String accountEmail;
	private String accountGrade;
	private String accountRegDate;
}
