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
public class ReviewMapping {

	private int mappingNo; // 첨부파일 매핑 번호
	private int attachNo; // 첨부파일 번호
	private int reviewNo; // 리뷰 번호
	
}
