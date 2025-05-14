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
public class ReviewLike {

	private int reviewLikeNo; // 리뷰 좋아요 번호
	private int accountNo; // 회원 번호
	private int reviewNo; // 리뷰 번호
	private String reviewName; // 리뷰 제목
	
}
