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
public class KlassAttach {
//	2번 바구니
	private int attachNo; // 첨부파일 번호
	private String attachOri; // 기존파일명
	private String attachNew; // 변경 파일명
	private String attachPath; // 경로
	
}
