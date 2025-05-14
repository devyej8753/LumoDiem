<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 실패</title>
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
						<div class="mypage-box" style="text-align: center;">
						    <h3 class="text-center mb-4">회원 정보 수정 실패</h3>
						    <p>회원 정보 수정에 실패했습니다.</p>
						
						    <div class="d-flex justify-content-between">
								<a href='<c:url value="/mypageUpdateDelete?val=update"/>' class="btn btn-outline-primary">회원 정보 수정하러 가기</a><br>
								<a href='<c:url value="/"/>' class="btn btn-outline-danger">홈페이지</a>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	
	
	
	
</body>
</html>