package com.lumodiem.board.hostboard.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.lumodiem.account.vo.Account;
import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassDate;
import com.lumodiem.board.memberboard.vo.Reservation;

@WebServlet("/klassReservation")
public class KlassReservationServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 우리 어플리케이션 전용 REST_API_KEY
	private static final String KAKAO_API_KEY = "DEV304A343721CE2DA5F9531A21BCB556C7C6F06";
	// 테스트 CID(이렇게 써야 카카오에서 테스트 정보인지 확인 가능)
    private static final String CID = "TC0ONETIME";
       
    public KlassReservationServelt() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LocalDateTime ldt = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		int klassDateNo = Integer.parseInt(request.getParameter("klass_date_no"));
		int resPpl = Integer.parseInt(request.getParameter("res_ppl"));
		int klassNo = Integer.parseInt(request.getParameter("klass_no"));
		int accountNo = 0;
		int klassDate = 0;
		List<Reservation> res = null;
		KlassDate option = KlassDate.builder().klassDateNo(klassDateNo).klassNo(klassNo).build();
		KlassDate kd = new HostBoardService().klassCountByKlassMax(option);
		Account ac = null;
		HttpSession session = request.getSession();
		if(session != null && session.getAttribute("account") != null) {
			ac = (Account)session.getAttribute("account");
			accountNo = ac.getAccountNo();
		}

		// 예약테이블 account_no 랑 klass_date 테이블에서 account_no 랑 비교해서 같으면 예약X
		
		Reservation reservation = Reservation.builder()
				.klassDateNo(klassDateNo)
				.resPpl(resPpl)
				.accountNo(accountNo)
				.build();
		int count = 0;
		LocalDateTime klassTimeStart =  LocalDateTime.parse(kd.getKlassStart(),dtf);
		res = new HostBoardService().resSelect(reservation);
		if(klassTimeStart.isAfter(ldt)) {
			if((kd.getKlassMax()-kd.getKlassCount()) >= resPpl) {
				if(!res.isEmpty()) {
					for(int i = 0; i < res.size(); i++) {
						if (res.get(i).getKlassDateNo() == kd.getKlassDateNo()) {
							count++;
						}
					}
				}
			}
			if(count == 0) {
				klassDate = new HostBoardService().reserveKlass(reservation);
			} else {
//				count 1인 경우 이미 같은 시간대 예약 했음.
				}
				
			}
			
		
		JSONObject obj = new JSONObject();
		if(klassDate > 0) {
			Klass klassPayment = new HostBoardService().selectKlassOne(klassNo);
			Reservation resPayment = new HostBoardService().selectReservationOne(klassDate);
			session.setAttribute("res_no", resPayment.getResNo());
			
//		카카오로 보내는 url
			URL url = new URL("https://open-api.kakaopay.com/online/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "SECRET_KEY " + KAKAO_API_KEY);
			
			conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			conn.setDoOutput(true);
			
			
			
			String orderId = String.valueOf(resPayment.getResNo());
			Integer quantity = Integer.valueOf(resPayment.getResPpl());
			Integer total_amount = Integer.valueOf((resPayment.getResPpl() * klassPayment.getKlassPrice()));
			Integer tax_free_amount = Integer.valueOf(0);
// 		요청 데이터 설정
			JSONObject jsonParams = new JSONObject();
			jsonParams.put("cid", CID);
			jsonParams.put("partner_order_id", orderId);
			session.setAttribute("partner_order_id", orderId);
			jsonParams.put("partner_user_id", ac.getAccountId());
			session.setAttribute("partner_user_id", ac.getAccountId());
			jsonParams.put("item_name", klassPayment.getKlassName());
			jsonParams.put("quantity", quantity);
			jsonParams.put("total_amount", total_amount);
			jsonParams.put("tax_free_amount", tax_free_amount);
			jsonParams.put("approval_url", "http://localhost:8090/pay/success");
			jsonParams.put("cancel_url", "http://localhost:8090/pay/cancel");
			jsonParams.put("fail_url", "http://localhost:8090/pay/fail");
			
			
			
			System.out.println("카카오페이 요청 시작...");
			System.out.println("Authorization 헤더: KakaoAK " + KAKAO_API_KEY);
			System.out.println("요청 URL: " + url);
			System.out.println("JSON 데이터 : " + jsonParams.toJSONString());
			
			try (OutputStream os = conn.getOutputStream()) {
				os.write(jsonParams.toJSONString().getBytes("UTF-8"));
				os.flush();
			}
			
//		
			int responseCode = conn.getResponseCode();
			System.out.println("카카오페이 응답 코드: " + responseCode);
			
			if (responseCode != 200) {
				BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				StringBuilder errorResponse = new StringBuilder();
				String errorLine;
				while ((errorLine = errorReader.readLine()) != null) {
					errorResponse.append(errorLine);
				}
				errorReader.close();
				
				System.err.println("카카오페이 요청 실패 응답: " + errorResponse.toString());
				throw new RuntimeException("카카오페이 요청 실패! 응답 확인 필요.");
			}
//
			
			
//      응답 받는 곳
			StringBuilder sb = new StringBuilder();
			try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line);
				}
			}
			// JSON 응답 확인
			System.out.println("카카오페이 응답 데이터: " + sb.toString());
			
			
			
			JSONParser parser = new JSONParser();
			JSONObject paymentResponse = null;
			
			try {
				paymentResponse = (JSONObject) parser.parse(sb.toString().trim());
			} catch (ParseException e) {
				System.err.println("JSON 파싱 오류: 응답 데이터를 확인하세요.");
				e.printStackTrace();
				throw new RuntimeException("카카오페이 응답 JSON 파싱 실패", e);
			}
			
			
			// 결제 요청 후, 응답에서 TID 가져오기
			// TID를 세션에 저장
			// TID란 카카오 페이에서 받은 응답이다.
			// TID가 있다? -> 결제 요청을 했다.
			// 세션 || DB 저장 방법 중 세션 저장 방법을 선택했음.
			// 성공시 변동하는 값인 TID 필요!
			// TID 저장
			String tid = (String) paymentResponse.get("tid");
			if (tid != null) {
				session.setAttribute("tid", tid);
			} else {
				throw new RuntimeException("카카오페이 결제 요청 실패: TID를 받을 수 없음.");
			}
			System.out.println("ready tid : " + tid);
			
			
			
			
			
			
			
			
			
			
			
			obj.put("paymentResponse", paymentResponse);
			obj.put("res_code","200");
			obj.put("res_msg", "결제를 진행합니다!");
		}else {
			obj.put("res_code","500");
			obj.put("res_msg", "예약시도중 문제가 발생하였습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}