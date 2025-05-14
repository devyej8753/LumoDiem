package com.lumodiem.account.vo;

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
public class ReviewDTO {
	private String accountNickname;
	
	private int klassNo;
	private String klassName;
	
	private String klassDateNo;
	private String klassStart;
	private String klassEnd;
	
	private int reviewNo;
	private String reviewName;
	private String reviewTxt;
	
}
