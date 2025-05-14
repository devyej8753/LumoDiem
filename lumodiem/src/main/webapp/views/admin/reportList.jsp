<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 목록</title>
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
	background-color: #F1948A !important; 
	color: #fff !important; 
	border: none; 
}

a.btn-outline-primary {
	background-color: #D1B5E0 !important; 
	color: #D1B5E0 !important;
	border: none;
}

.mypage-box {
	border-radius: 10px;
	padding: 20px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); 
}
.btn-outline-primary {
    color: #000000 !important;
    border: solid thin !important;
    border-color: #D1B5E0 !important;
}
.btn-outline-primary:hover {
    background-color: #D1B5E0 !important;
    color: #fff !important;
    border: none !important;
}
.btn-outline-danger {
    color: #000000 !important;
    border: solid thin !important;
    border-color: #D1B5E0 !important;
}
.btn-outline-danger:hover {
    background-color: #D1B5E0 !important;
    color: #fff !important;
    border: none !important;
}

</style>

</head>
<body>
<%@ include file="/views/include/nav.jsp" %>	
	
		<div id="colorlib-main">	
			<section class="ftco-section ftco-no-pt ftco-no-pb">
				<div class="container">
					<div class="row d-flex">
					    <div class="col-xl-8 py-5 px-md-5">	
						<div class="mypage-box" style="width: 500px">
								<h3 class="text-primary text-center mb-4">신고 목록</h3>
								<form action="/accountCreateMove" method="post">
									<div class="d-flex justify-content-between">
										<button type="button" class="btn btn-outline-primary" id="reportKlassBtn" 
											style="width: 30%;">신고된 클래스</button>
										<button type="button" class="btn btn-outline-danger" id="reportReviewBtn" 
											style="width: 30%;">신고된 리뷰</button>
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
			$('#reportKlassBtn').click(function(){
				location.href = "/reportKlass";
			});
			$('#reportReviewBtn').click(function(){
				location.href = "/reportReview";
			});
			$('#reportReviewCmtBtn').click(function(){
				location.href = "/reportReviewCmt";
			});
		})
	</script>
	
</body>
</html>