package com.lumodiem.board.hostboard.vo;

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

public class KlassLike {
	
	private int klassLikeNo; // 클래스 좋아요 번호
	private int accountNo; // 회원 번호
	private int klassNo; // 클래스 번호
	private String klassName; // 클래스 제목

}
