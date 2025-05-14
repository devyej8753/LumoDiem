package com.lumodiem.board.hostboard.vo;

import java.util.List;

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
public class Klass extends Paging {
	private  int klassNo;
	private int accountNo;
	private String klassName;
	private String klassAddress;
	private int klassPrice;
	private int klassMax;
	private String klassStatus;
	private String klassTxt;
	private String accountNickname;
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
	private int klassLikeCount;
	private List<KlassDate> dateList;
	private String approveFb;
}
