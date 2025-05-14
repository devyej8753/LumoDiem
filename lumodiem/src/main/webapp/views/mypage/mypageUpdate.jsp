<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
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
	<%@ include file="/views/include/nav.jsp"%>
	
<div id="colorlib-main">
    <section class="ftco-section ftco-no-pt ftco-no-pb">
        <div class="container">
            <div class="row d-flex">
                <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
                    <div class="mypage-box" style="max-width: 500px; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);">
                        <h3 class="text-primary text-center mb-4">회원 정보 수정</h3>
                        <form action="/mypageUpdateEnd" method="post">
                            <div style="margin-bottom: 10px;">
                                <label for="account_pw">비밀번호 :</label>
                                <div style="position: relative;">
                                    <input name="account_pw" id="account_pw" type="password"
                                           style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
                                    <ion-icon id="openEye" class="eye" name="eye-off-outline"
                                              style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;"></ion-icon>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between mt-4">
                                <button type="submit" class="btn btn-outline-primary" style="width: 48%;">다음</button>
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
		/* 비밀번호 보이고 안 보이고 */
	    $(function(){
	        $('.eye').click(function(){
	            let pwtype = $('#account_pw').attr('type');
	            if(pwtype == 'text'){
	                $('#account_pw').attr('type', 'password');
	                $('#openEye').attr('name', 'eye-off-outline');
	            } else{
	                $('#account_pw').attr('type', 'text');
	                $('#openEye').attr('name', 'eye-outline');
	            }
	            $('#closeEye').toggleClass('dis');
	            $('#openEye').toggleClass('dis');
	        });
	    })
	</script>
</body>
</html>