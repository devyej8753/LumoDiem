package com.lumodiem.board.adminboard.vo;



import com.lumodiem.common.vo.Paging;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class ReportKlass extends Paging {
	
	private int reportKlassNo;
	private int klassNo;
	private int accountNo;
	private String reportKlassTxt;
	// 클래스 신고 내역 참조용
	private String klassName;
	private String accountNickname;
	private String klassTxt;
	

	private String klassAddress;
	private int klassPrice;
	private int klassMax;
	private String klassStatus;

	private String klassRegDate;
	private String klassModDate;
	private String searchType;
	private String searchTxt;
	private String approveCode;
	private String orderType;
	private int resNo;
	private int klassDateNo;
	private String klassStart;
	private String klassEnd;
	private int attachNo;
	private String klassOfDate;
	
}
