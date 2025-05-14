<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주최자 마이페이지</title>
<style>
    .list-group-item a {
        color: #000;  
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
    
	table {
	    border: 1px solid #ddd !important;
	    border-spacing: 0 10px !important; 
	    border-collapse: separate !important; 
	}
	
	tr {
	    background-color: #E8DAEF;
	    border-bottom: 2px solid #aaa;
	}
	
	tr:last-child{
		background-color: #ffffff;
	}
	
	td:first-child {
	    text-align: left; 
	}
	
	td:last-child {
	    text-align: right; 
	}

    .clickable-row:hover {
	    background-color: #D1B5E0; 
	    cursor: pointer;         
	}
    .btn-outline-danger {
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
				        <div class="mypage-box" style="max-width: 100%; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); ">
				            <h3 class="text-primary text-center mb-4">마이페이지</h3>
							<ul class="list-group mb-4">
							    
							    
							    
								<li class="list-group-item">
								    <table style="width: 100%; border-collapse: collapse;">
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/hostMypageApproveKlass?approve_code=A'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">승인 완료 클래스</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/hostMypageApproveKlass?approve_code=S'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">승인 대기 클래스</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/hostMypageApproveKlass?approve_code=D'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">반려된 클래스</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/hostMypageReview'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">클래스 리뷰 조회</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/mypageLikeKlass'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">좋아요 클래스 조회</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/mypageLikeReview'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">좋아요 리뷰 조회</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/mypageCmt'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">작성 댓글 조회</td>
								            <td style="padding: 8px;">(+)</td>
								            
								       	<tr> 
									    	<td style=" padding: 8px; ">
										        <a href='<c:url value="/mypageUpdateDelete?val=update"/>' class="btn btn-outline-primary">
										            회원정보 수정
										        </a>
										    </td>
										    <td style="padding: 8px; ">
										        <a href='<c:url value="/mypageUpdateDelete?val=delete"/>' class="btn btn-outline-danger">
										            회원 탈퇴
										        </a>
										    </td>
										</tr>
							
								    </table>
								</li>

							</ul>
				        </div>
				    </div>
		    	</div>
		    </div>
	    </section>
    </div>
    
<script>
    document.querySelectorAll('.clickable-row').forEach(row => {
        row.addEventListener('click', function() {
            const url = row.getAttribute('data-url');
            if (url) {
                window.location.href = url;
            }
        });
    });
</script>




</body>
</html>