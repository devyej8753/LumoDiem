package com.lumodiem.board.adminboard.vo;

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
public class Approve {
	
	private int approveNo;
	private int klassNo;
	private String approveCode;
	private String approveFb;
}
