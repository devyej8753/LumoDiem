<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	.mypage-box {
	    background-color: #FFFFFF;
	    border: 1px solid #ddd;
	    border-radius: 10px;
	    padding: 20px;
	    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); 
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
						<div class="mypage-box" style="max-width: 500px; margin: 0 auto;">
		            
			                <form name="create_member_form" action="">
			                	<h3 class="text-primary text-center mb-4">회원 가입</h3>
			                    <input name="account_grade" style="display: none" value=${select}><br>
			
			                    <label for="account_id">아이디 :</label>
			                    <div style="display: flex; margin-bottom: 10px;">
			                        <input placeholder="3~15자리의 영문자와 숫자 사용 가능합니다." name="account_id" id="account_id" type="text" 
			                               style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
			                        <button type="button" id="duplicate_id" class="btn btn-outline-primary" style="margin-left: 10px;">중복확인</button>
			                    </div>
			
			                    <label for="account_pw">비밀번호 :</label>
			                    <div style="position: relative; margin-bottom: 10px;">
			                        <input placeholder="3~15자리 문자, 숫자, 특수문자 사용 가능합니다." name="account_pw" id="account_pw" type="password" 
			                               style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
			                        <ion-icon id="openEye" class="eye" name="eye-off-outline" 
			                                  style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;"></ion-icon>
			                    </div>
			
			                    <label for="account_pw_check">비밀번호 확인 :</label>
			                    <input placeholder="비밀번호를 한번 더 입력해주세요." name="account_pw_check" id="account_pw_check" type="password"
			                           style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px; margin-bottom: 10px;">
			
			                    <label for="account_name">이름 :</label>
			                    <input placeholder="이름을 입력해주세요." name="account_name" id="account_name" type="text"
			                           style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px; margin-bottom: 10px;">
			
			                    <label for="account_nickname">닉네임 :</label>
			                    <div style="display: flex; margin-bottom: 10px;">
			                        <input placeholder="2~15자리 영문자, 한글, 숫자 사용 가능합니다." name="account_nickname" id="account_nickname" type="text"
			                               style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
			                        <button type="button" id="duplicate_nickname" class="btn btn-outline-primary" style="margin-left: 10px;">중복확인</button>
			                    </div>
			
			                    <label for="account_ssn">주민등록번호 :</label>
			                    <div style="display: flex; margin-bottom: 10px;">
			                        <input placeholder="하이픈(-)을 제외한 숫자를 입력해주세요." name="account_ssn" id="account_ssn" type="text"
			                               style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
			                        <button type="button" id="duplicate_ssn" class="btn btn-outline-primary" style="margin-left: 10px;">중복확인</button>
			                    </div>
			
			                    <label for="account_phone">전화번호 :</label>
			                    <div style="display: flex; margin-bottom: 10px;">
			                        <input placeholder="하이픈(-)을 제외한 숫자를 입력해주세요." name="account_phone" id="account_phone" type="text"
			                               style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
			                        <button type="button" id="duplicate_phone" class="btn btn-outline-primary" style="margin-left: 10px;">중복확인</button>
			                    </div>
			
			                    <label for="postcode">우편번호 :</label>
			                    <input type="text" name="postcode" id="postcode" placeholder="우편번호"
			                           style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px; margin-bottom: 10px;">
			                    <input type="button" name="findPostCode_btn" id="findPostCode_btn" value="우편번호 찾기" class="btn btn-outline-primary mb-2" style="width: 100%;">
			
			                    <label for="address">주소 :</label>
			                    <input type="text" name="address" id="address" placeholder="주소"
			                           style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px; margin-bottom: 10px;">
			                    <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"
			                           style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px; margin-bottom: 10px;">
			
			                    <label for="account_email">이메일 :</label>
			                    <input placeholder="이메일을 입력해주세요." name="account_email" id="account_email" type="email" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px; margin-bottom: 10px;">
			
			                    <div class="d-flex justify-content-between mt-4">
			                        <button type="button" id="submitBtn" class="btn btn-outline-primary" style="width: 48%;">가입하기</button>
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
			const form = document.create_member_form;
			
			$('#submitBtn').click(function(){
				if(!form.account_id.value){
					alert("아이디를 입력하세요.");
					form.account_id.focus();
				} else if(!form.account_pw.value){
					alert("비밀번호를 입력하세요.");
					form.account_pw.focus();
				} else if(!form.account_pw_check.value){
					alert("비밀번호 확인을 입력하세요.")
					form.account_pw_check.focus();
				} else if(form.account_pw.value != form.account_pw_check.value){
					alert("비밀번호가 일치하지 않습니다.")
					form.account_pw_check.focus();
				} else if(!form.account_name.value){
					alert("이름을 입력하세요.")
					form.account_name.focus();
				} else if(!form.account_nickname.value){
					alert("닉네임을 입력하세요.")
					form.account_nickname.focus();
				} else if(!form.account_ssn.value){
					alert("주민등록번호를 입력하세요.")
					form.account_ssn.focus();
				} else if(!form.account_phone.value){
					alert("전화번호을 입력하세요.")
					form.account_phone.focus();
				} else if(!form.address.value){
					alert("주소를 입력하세요.")
					form.address.focus();
				}  else if(!form.account_email.value){
					alert("이메일을 입력하세요.")
					form.account_email.focus();
				} else{
					$.ajax({
						url : "/accountCreateEnd",
						type : "post",
						data : {"account_grade" : form.account_grade.value,
								"account_id" : form.account_id.value,
								"account_pw" : form.account_pw.value,
								"account_name" : form.account_name.value,
								"account_nickname" : form.account_nickname.value,
								"account_ssn" : form.account_ssn.value,
								"account_phone" : form.account_phone.value,
								"postcode" : form.postcode.value,
								"address" : form.address.value,
								"detailAddress" : form.detailAddress.value,
								"account_email" : form.account_email.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							alert(data.res_msg);
							if(data.res_code == "200"){
								location.href="/";
							} else{
								location.href="/";
							}
						}
					});
				}
			});
			

			/* 아이디 정규식 검사 */
			let idBoolean = false;
			$('#account_id').keyup(function(){
				let idInput = form.account_id.value;
				let idReg = /^[a-zA-Z][a-zA-Z0-9]{2,14}$/;
				if(idReg.test(idInput)){
					$('#account_id').css('backgroundColor', '#98FB98');
					idBoolean = true;
				} else{
					$('#account_id').css('backgroundColor', '#FF9999');
					idBoolean = false;
				}
			});
			/* 아이디 중복 검사 */
			$('#duplicate_id').click(function(){
				if(idBoolean){
					$.ajax({
						url : "/accountCreateDuplicate",
						type : "post",
						data : {
								"account_id" : form.account_id.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							if(data.res_code == "200"){
								alert(data.res_msg + '아이디입니다.');
							} else{
								alert(data.res_msg + '아이디입니다.');
								$('#account_id').css('backgroundColor', '#FF9999');
							}
						}
					});
				} else{
					alert('올바른 아이디를 입력해주세요.');
					form.account_id.focus();
				}
			});
			
			/* 닉네임 정규식 검사 / 임시 : 영문자, 한글, 숫자 2~15자리 */
			let nicknameBoolean = false;
			$('#account_nickname').keyup(function(){
				let nicknameInput = form.account_nickname.value;
				let nicknameReg =  /^[a-zA-Z가-힣0-9]{2,15}$/;
				if(nicknameReg.test(nicknameInput)){
					$('#account_nickname').css('backgroundColor', '#98FB98');
					nicknameBoolean = true;
				} else{
					$('#account_nickname').css('backgroundColor', '#FF9999');
					nicknameBoolean = false;
				}
			});			
			/* 닉네임 중복 검사 */
			$('#duplicate_nickname').click(function(){
				if(nicknameBoolean){
					$.ajax({
						url : "/accountCreateDuplicate",
						type : "post",
						data : {
								"account_nickname" : form.account_nickname.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							if(data.res_code == "200"){
								alert(data.res_msg + '닉네임입니다.');
							} else{
								alert(data.res_msg + '닉네임입니다.');
								$('#account_nickname').css('backgroundColor', '#FF9999');
							}
						}
					});
				} else{
					alert('올바른 닉네임을 입력해주세요.');
					form.account_nickname.focus();
				}
			});
			
			
			/* 주민등록번호 정규식 검사 */
			let ssnBoolean = false;
			$('#account_ssn').keyup(function(){
				let ssnInput = form.account_ssn.value;
				let ssnReg = /^(?:[0-9]{2})((01|03|05|07|08|10|12)(0[1-9]|[12][0-9]|3[01])|(04|06|09|11)(0[1-9]|[12][0-9]|30)|(02)(0[1-9]|1[0-9]|2[0-8]|29))[1-4][0-9]{6}$/;
				if(ssnReg.test(ssnInput)){
					$('#account_ssn').css('backgroundColor', '#98FB98');
					ssnBoolean = true;
				} else{
					$('#account_ssn').css('backgroundColor', '#FF9999');
					ssnBoolean = false;
				}
			});	
			/* 주민등록번호 중복 검사 */
			$('#duplicate_ssn').click(function(){
				if(ssnBoolean){
					$.ajax({
						url : "/accountCreateDuplicate",
						type : "post",
						data : {
								"account_ssn" : form.account_ssn.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							if(data.res_code == "200"){
								alert(data.res_msg + '주민등록번호입니다.');
							} else{
								alert(data.res_msg + '주민등록번호입니다.');
								$('#account_ssn').css('backgroundColor', '#FF9999');
							}
						}
					});
				} else{
					alert('올바른 주민등록번호를 입력해주세요.');
					form.account_ssn.focus();
				}
			});
			
			
			
			
			
			/* 핸드폰번호 정규식 검사 */
			let phoneBoolean = false;
			$('#account_phone').keyup(function(){
				let phoneInput = form.account_phone.value;
				let phoneReg =  /^01[016789]\d{3,4}\d{4}$/;
				if(phoneReg.test(phoneInput)){
					$('#account_phone').css('backgroundColor', '#98FB98');
					phoneBoolean = true;
				} else{
					$('#account_phone').css('backgroundColor', '#FF9999');
					phoneBoolean = false;
				}
			});	
			/* 핸드폰번호 중복 검사 */	
			$('#duplicate_phone').click(function(){
				if(phoneBoolean){
					$.ajax({
						url : "/accountCreateDuplicate",
						type : "post",
						data : {
								"account_phone" : form.account_phone.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							if(data.res_code == "200"){
								alert(data.res_msg + '핸드폰 번호입니다.');
							} else{
								alert(data.res_msg + '핸드폰 번호입니다.');
								$('#account_phone').css('backgroundColor', '#FF9999');
							}
						}
					});
				} else{
					alert('올바른 핸드폰번호를 입력해주세요.');
					form.account_phone.focus();
				}
			});
			

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
			/* 비밀번호와 비밀번호 재입력 일치 확인 */
			$('#account_pw_check').keyup(function(){
				let passValue = form.account_pw.value;
				let passCheckValue = form.account_pw_check.value;
				if(passValue == passCheckValue){
					$('#account_pw_check').css('backgroundColor', '#98FB98');
				} else{
					$('#account_pw_check').css('backgroundColor', '#FF9999');
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
	        });
			
			/* 주소입력 API */
			$('#findPostCode_btn').click(function(){
			    new daum.Postcode({
			        oncomplete: function(data) {
			            var addr = data.roadAddress; // 도로명 주소
			            var extraAddr = ''; // 참고항목

			            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                extraAddr += data.bname;
			            }
			            if(data.buildingName !== '' && data.apartment === 'Y'){
			                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			            }
			            if(extraAddr !== ''){
			                extraAddr = ' (' + extraAddr + ')';
			            }

			            $('#postcode').val(data.zonecode);
			            $("#address").val(addr + extraAddr);
			            $("#detailAddress").focus();
			            $('#postcode').css('backgroundColor', '#98FB98');
			            $('#address').css('backgroundColor', '#98FB98');
			        }
			    }).open();
			});
				
				$('#postcode').keyup(function(){
					let postcode = $('#postcode').val();
					if(postcode){
						$('#postcode').css('backgroundColor', '#98FB98');
					} else{
						$('#postcode').css('backgroundColor', '#FFFFFF');
					}
				});
				$('#address').keyup(function(){
					let address = $('#address').val();
					if(address){
						$('#address').css('backgroundColor', '#98FB98');
					} else{
						$('#address').css('backgroundColor', '#FFFFFF');
					}
				});
				$('#detailAddress').keyup(function(){
					let detailAddress = $('#detailAddress').val();
					if(detailAddress){
						$('#detailAddress').css('backgroundColor', '#98FB98');
					} else{
						$('#detailAddress').css('backgroundColor', '#FFFFFF');
					}
				});
				$('#account_name').keyup(function(){
					let account_name = $('#account_name').val();
					if(account_name){
						$('#account_name').css('backgroundColor', '#98FB98');
					} else{
						$('#account_name').css('backgroundColor', '#FFFFFF');
					}
				});
				/* 이메일 정규식 검사 */
				let emailBoolean = false;
				$('#account_email').keyup(function(){
					let emailInput = form.account_email.value;
					let emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
					if(emailReg.test(emailInput)){
						$('#account_email').css('backgroundColor', '#98FB98');
						emailBoolean = true;
					} else{
						$('#account_email').css('backgroundColor', '#FF9999');
						emailBoolean = false;
					}
				});
			
			
			
		})
		
		
		
		
		
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</body>
</html>