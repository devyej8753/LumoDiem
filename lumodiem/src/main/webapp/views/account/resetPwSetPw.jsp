<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
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
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	
	
	
	<div id="colorlib-main">
	    <section class="ftco-section ftco-no-pt ftco-no-pb">
	        <div class="container">
	            <div class="row d-flex">
	                <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
	                    <div class="mypage-box" style="max-width: 500px; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);">
	                        <h3 class="text-primary text-center mb-4">비밀번호 재설정</h3>
	                        <form action="/resetPwSetPwEnd" id="resetPwEnd_form" name="resetPwEnd_form" method="post">
	                            <div style="margin-bottom: 10px;">
	                                <label for="account_pw">비밀번호 :</label>
	                                <div style="position: relative;">
	                                    <input name="account_pw" id="account_pw" type="password" required
	                                           style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
	                                    <ion-icon id="openEye" class="eye" name="eye-off-outline"
	                                              style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;"></ion-icon>
	                                </div>
	                            </div>
	                            <div style="margin-bottom: 10px;">
	                                <label for="account_pw_check">비밀번호 확인 :</label>
	                                <input name="account_pw_check" id="account_pw_check" type="password" required
	                                       style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
	                            </div>
	                            <div class="d-flex justify-content-between mt-4">
	                                <button type="button" id="submitBtn" class="btn btn-outline-primary" style="width: 48%;">비밀번호 재설정</button>
	                                <a href="/" class="btn btn-outline-danger" style="width: 48%;">홈으로 돌아가기</a>
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	</div>
	
	
	
	
	<script>
		$(function(){
			const form = document.resetPwEnd_form;
			
			/* 비밀번호 정규식 검사 */
			$('#account_pw').keyup(function(){
				let pwInput = form.account_pw.value;
				let pwReg =  /^[A-Za-z0-9!@#$%^&*()_+={}\[\]:;<>,.?/~`|-]{3,15}$/;
				if(pwReg.test(pwInput)){
					$('#account_pw').css('backgroundColor', '#98FB98');
				} else{
					$('#account_pw').css('backgroundColor', '#FF9999');
				}
			});	
			/* 비밀번호와 비밀번호 확인 일치 확인 */
			let pwBoolean = false;
			$('#account_pw_check').keyup(function(){
				let passValue = form.account_pw.value;
				let passCheckValue = form.account_pw_check.value;
				if(passValue == passCheckValue){
					$('#account_pw_check').css('backgroundColor', '#98FB98');
					pwBoolean = true;
				} else{
					$('#account_pw_check').css('backgroundColor', '#FF9999');
					pwBoolean = false;
				}
			});
			/* 비밀번호 다시 쳤을 때 비밀번호 확인과 일치 여부 확인 */
			$('#account_pw').keyup(function(){
				let passValue = form.account_pw.value;
				let passCheckValue = form.account_pw_check.value;
				if(passValue == passCheckValue && passValue != '' && passCheckValue != ''){
					$('#account_pw_check').css('backgroundColor', '#98FB98');
					pwBoolean = true;
				} else{
					$('#account_pw_check').css('backgroundColor', '#FF9999');
					pwBoolean = false;
				}
			});
			
			$('#submitBtn').click(function(){
				if(pwBoolean){
					form.submit();
				} else {
					alert('올바른 비밀번호를 입력해주세요.');
				}
			});
			
			/* 비밀번호 보이고 안 보이고 */
	        $(function(){
	            $('.eye').click(function(){
	                let pwtype = $('#account_pw').attr('type');
	                let pwchecktype = $('#account_pw_check').attr('type');
	                if(pwtype == 'text'){
	                    $('#account_pw').attr('type', 'password');
	                    $('#account_pw_check').attr('type', 'password');
	                    $('#openEye').attr('name', 'eye-off-outline');
	                } else{
	                    $('#account_pw').attr('type', 'text');
	                    $('#account_pw_check').attr('type', 'text');
	                    $('#openEye').attr('name', 'eye-outline');
	                }
	                $('#closeEye').toggleClass('dis');
	                $('#openEye').toggleClass('dis');
	            });
	        })
			
		})
	</script>
</body>
</html>