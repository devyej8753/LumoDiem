package com.lumodiem.common.payment.vo;

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
public class PaymentDTO {
	private int resNo; // 예약 번호
	private String klassName; // 클래스명
	private int resPpl; // 예약 인원
	private int klassPrice; // 클래스 가격
}
