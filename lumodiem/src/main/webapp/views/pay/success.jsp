<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공 페이지</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	<script>
	$(function() {
	    // url을 통해? pg_token 추출
	    function getPgTokenFromUrl() {
	    	// 현재 페이지의 URL에서 쿼리스트링(파라미터)을 가져와서 다룰 수 있도록 하는 기능
	    	// window.location.search는 현재 페이지의 URL에서 ? 뒤에 오는 "쿼리 문자열(query string)" 부분을 가져온다.
	    	// 요약하자면 ?를 포함한 뒤의 문자열을 가져온다는 뜻
	    	// 해당 쿼리스트링을 다룰 수 있는 객체인 urlPrams를 선언한 것.
	        const urlParams = new URLSearchParams(window.location.search);
	    	// pg_token이라는 키의 밸류를 반환한다.
	        return urlParams.get("pg_token");
	    }
		// 위에서 받아온 밸류를 pgToken이라는 변수에 담았음
	    const pgToken = getPgTokenFromUrl();
		// pgToken의 값이 있다면~
	    if(pgToken) {
	        $.ajax({
	            type: "POST",
	            url: "/pay/approve",
	            data: {
	            	'pg_token' : pgToken
	            	},
	            dataType: "json",
	            success: function(data) {
	                if (data.res_code === "200") {
	                    alert("결제가 완료 되었습니다.");
	                    location.href = "/reservation/success";
	                } else {
	                    alert("결제에 실패했습니다.");
	                    location.href = "/reservation/fail";
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error("결제 승인 요청 중 오류 발생:");
	                console.error("HTTP 상태 코드:", xhr.status);
	                console.error("응답 메시지:", xhr.responseText);
	                console.error("에러 메시지:", error);

	                alert("결제 승인 요청 중 오류 발생: " + xhr.responseText);
	                location.href = "/reservation/fail";
	            }

	        });
	    } else {
	        alert("pg_token을 찾을 수 없습니다. 관리자에게 문의하세요.");
	    }
	});


	</script>
</body>
</html>