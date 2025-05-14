package com.lumodiem.board.hostboard.vo;

import java.time.format.DateTimeFormatter;

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

public class KlassDate {
	private int klassDateNo;
	private int klassNo;
	private String klassStart;
	private String klassEnd;
	private int klassCount;
	private int klassMax;
	private int resNo;
}
