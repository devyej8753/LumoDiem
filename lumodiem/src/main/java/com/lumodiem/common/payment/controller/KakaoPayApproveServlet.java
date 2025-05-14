package com.lumodiem.common.payment.controller;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.lumodiem.account.vo.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@WebServlet("/pay/approve")
public class KakaoPayApproveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KakaoPayApproveServlet() {
        super();
    }
//    	KAKAO_API_KEY, 
	    private static final String KAKAO_API_KEY = "DEV304A343721CE2DA5F9531A21BCB556C7C6F06"; // 카카오 REST API 키
	    private static final String CID = "TC0ONETIME"; // 테스트용 CID
	    private static final String APPROVE_URL = "https://open-api.kakaopay.com/online/v1/payment/approve";

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String tid = (String)session.getAttribute("tid");
		String partnerOrderId = (String)session.getAttribute("partner_order_id");
        String partnerUserId = (String)session.getAttribute("partner_user_id");
        String pgToken = request.getParameter("pg_token");
        System.out.println("tid :" + tid);
        System.out.println("partnerOrderId :" + partnerOrderId);
        System.out.println("partnerUserId :" + partnerUserId);
        System.out.println("pgToken :" + pgToken);
        if (tid == null || partnerOrderId == null || partnerUserId == null || pgToken == null) {
        	System.out.println("4가지 항목 중 하나라도 null인 경우!");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "결제 승인에 필요한 정보가 없습니다.");
            return;
        }
        
//      결제 승인 요청하는 Connection
        URL url = new URL(APPROVE_URL);
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "SECRET_KEY " + KAKAO_API_KEY);

        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);
		
//      JSON에 요청 데이터를 넣기
        JSONObject jsonParams = new JSONObject();
        jsonParams.put("cid", CID);
        jsonParams.put("tid", tid);
        jsonParams.put("partner_order_id", partnerOrderId);
        jsonParams.put("partner_user_id", partnerUserId);
        jsonParams.put("pg_token", pgToken);
        
//        System.out.println("카카오페이 승인 요청 JSON 데이터: " + jsonParams.toJSONString());
        
//      JSON 데이터 전송
        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonParams.toJSONString().getBytes("UTF-8"));
            os.flush();
        }
        
        
        
//      JSON 응답 받기
        StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
        }

//        System.out.println("카카오페이 승인 응답 데이터: " + sb.toString());

        JSONParser parser = new JSONParser();
        JSONObject approveResponse = null;

        try {
            approveResponse = (JSONObject)parser.parse(sb.toString().trim());
        } catch (ParseException e) {
            System.err.println("JSON 파싱 오류: 응답 데이터를 확인하세요.");
            e.printStackTrace();
            throw new RuntimeException("카카오페이 응답 JSON 파싱 실패", e);
        }
        JSONObject obj = new JSONObject();
        obj.put("res_code", "500");
        obj.put("res_msg", "오류 발생");
        if (approveResponse != null) {
            obj.put("res_code", "200");
            obj.put("res_msg", "정상 결제");
            obj.put("approveResponse", approveResponse); 
        }

//      응답 데이터 반환
        response.setContentType("application/json");
        response.getWriter().print(obj);
        
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
