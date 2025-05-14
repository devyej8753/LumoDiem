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
public class Reservation {
	
	private int resNo;
	private int accountNo;
	private int klassDateNo;
	private String payTime;
	private String payStatus;
	private int payPrice;
	private int resPpl;
}
