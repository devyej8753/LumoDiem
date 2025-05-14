<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
<style>
    .list-group-item a {
        color: #000 !important; 
        text-decoration: none;
    }

    h3.text-primary {
        color: #000 !important; 
    }

    .list-group-item {
        border-bottom: 1px solid #ddd;
        display: flex;
        align-items: center; 
    }

    .list-group-item .badge {
        margin-left: auto; 
    }

    .clickable-row:hover {
	    background-color: #E8F7DC; 
	    cursor: pointer;         
	}
	.mypage-box {
	    background-color: #FFFFFF;
	    border: 1px solid #ddd;
	    border-radius: 10px;
	    padding: 20px;
	    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
	}
    a.btn-outline-danger {
	    background-color: #F0F2EF !important;  
	    color: #000000 !important;               
	    border: 1px solid #ccc !important;                 
	}
	.btn-outline-primary {
	    color: #ffffff !important;
	    border: solid thin !important;
	    border-color: #D1B5E0 !important;
	    background-color: #D1B5E0 !important;
	    
	}
	div a{
		color: #724AA9;
	}
	div a:hover{
		color: #724AA9;
	}

	
	    
</style>
<body>
	<%@ include file="/views/include/nav.jsp" %>


	
	
	
	<div id="colorlib-main">
	    <section class="ftco-section ftco-no-pt ftco-no-pb">
	        <div class="container">
	            <div class="row d-flex">
	                <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
	                    <div class="mypage-box" style="max-width: 500px; margin: 0 auto;">
	                        <h3 class="text-primary text-center mb-4">알림</h3>
	                        <p class="text-center" style="margin-bottom: 20px;">일치하는 회원 정보가 없습니다.<br>아이디와 비밀번호를 확인해주세요.</p>
	
	                        <div class="d-flex justify-content-between mt-4">
	                            <a href="/login" id="loginBtn" class="btn btn-outline-primary" style="width: 30%;">로그인</a>
	                            <a href="/searchId" id="searchIdBtn" class="btn btn-outline-primary" style="width: 30%;">아이디 찾기</a>
	                            <a href="/" class="btn btn-outline-danger" style="width: 30%;">홈페이지</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	</div>
	
	
	
	
	
	
</body>
</html>