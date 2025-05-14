<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
		                    <div class="mypage-box" style="max-width: 500px; margin: 0 auto;">
		                        <form action="/loginEnd" method="post">
		                            <h3 class="text-primary text-center mb-4">로그인</h3>
		                            
            							<c:choose>
										<c:when test="${not empty searchIdLogin }">
											<label for="login_id">아이디 :</label><input name="login_id" id="login_id" type="text" value="${searchIdLogin }" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
										</c:when>
										<c:otherwise>
											<label for="login_id">아이디 :</label><input name="login_id" id="login_id" type="text"" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
										</c:otherwise>
									</c:choose>
		                            
		                            
		
		
		
		
		
		                            <label for="login_pw">비밀번호 :</label>
		                            <div style="position: relative; margin-bottom: 10px;">
		                                <input name="login_pw" id="login_pw" type="password" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
		                                <span class="dis" style="vertical-align: middle;"><ion-icon id="openEye" class="eye" name="eye-off-outline" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
		                                </ion-icon></span>
		                            </div>
		
		                            <div class="d-flex justify-content-between mt-4">
		                                <button type="submit" class="btn btn-outline-primary" style="width: 48%;">로그인하기</button>
		                                <a href="/" class="btn btn-outline-danger" style="width: 48%;">홈으로 돌아가기</a>
		                            </div>
		                        </form>
		                        <div class="mt-3 text-center">
		                            <a href="/searchId">아이디 찾기</a>
		                            <span> | </span>
		                            <a href="/resetPw">비밀번호 재설정</a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>
		</div>
			
			
					 
	
	
	<script>
		/* 비밀번호 보이고 안 보이고 */
	    $(function(){
	        $('.eye').click(function(){
	            let pwtype = $('#login_pw').attr('type');
	            if(pwtype == 'text'){
	                $('#login_pw').attr('type', 'password');
	                $('#openEye').attr('name', 'eye-off-outline');
	            } else{
	                $('#login_pw').attr('type', 'text');
	                $('#openEye').attr('name', 'eye-outline');
	            }
	            $('#closeEye').toggleClass('dis');
	            $('#openEye').toggleClass('dis');
	        });
	    })
	
	</script>
	
	
	
	
</body>
</html>