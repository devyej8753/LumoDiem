package com.lumodiem.board.memberboard.vo;

import com.lumodiem.common.vo.Paging;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// Lombok
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Review extends Paging {

	private int reviewNo; // 리뷰번호
	private int accountNo; // 회원번호
	private int resNo; // 예약번호
	private String reviewTxt;
	private String reviewName;
	private String accountNickname;
	private String reviewRegDate;
	private String reviewModDate;
	private String orderType;
	private int attachNo;
	private String klassName;
	private String payTime;
	private String payStatus;
	private int payPrice;
	private String attachPath;
	private int reviewLikeCount;
	private String searchTxt;
	private String searchType;
	private String klassNo;
}

