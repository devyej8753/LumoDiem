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
public class ReportReviewCmt {
	private int reportReviewCmtNo;
	private int accountNo;
	private int reviewCmtNo;
	private String reportReviewCmtTxt;
	 
	private String reviewName;
	private String reviewCmtTxt;
	private String accountNickname;
	private String searchType;
	private String searchTxt;
}
