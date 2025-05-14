package com.lumodiem.board.memberboard.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//Lombok
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class ReviewCmt {

	private int reviewCmtNo; // 리뷰 댓글 번호
	private int accountNo; // 회원 번호
	private int reviewNo; // 리뷰 번호
	private String reviewCmtTxt; // 리뷰 댓글 내용
	private String accountNickname; 
	private String reviewName;
	
	
	
}
