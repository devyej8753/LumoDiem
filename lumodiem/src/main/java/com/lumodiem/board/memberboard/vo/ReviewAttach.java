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
public class ReviewAttach {

	private int attachNo; // 첨부파일 번호
	private String attachOri; // 기존파일명
	private String attachNew; // 변경 파일명
	private String attachPath; // 경로
}
