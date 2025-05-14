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

public class KlassReport {
	private int reportKlassNo;
	private int klassNo;
	private int accountNo;
	private String reportKlassTxt;

}
