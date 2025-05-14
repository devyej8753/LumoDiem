<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.lumodiem.board.adminboard.vo.*"%>
<%
ReportReview review = (ReportReview) request.getAttribute("review");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
<title>클래스 조회</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp"%>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<h3>리뷰 상세 정보</h3>
					<div class="review">
						<ul>
							<li><img
								src="${request.getContextPath}/filePath?attach_no=${review.attachNo}"
								style="width: 300px"> <input type="hidden"
								value="${review.reviewNo }" id="review_no" name="review_no">
							</li>
							<li>
								<table>
									<tr>
										<td>제목</td>
										<td>${review.reviewName}</td>
									</tr>
									<tr>
										<td>내용</td>
										<td>${review.reviewTxt}</td>
									</tr>
									<tr>
										<td>작성자</td>
										<td>${review.accountNickname}</td>
									</tr>
									<tr>
										<td>등록일</td>
										<td>${review.reviewRegDate}</td>
									</tr>
									<tr>
										<td>수정일</td>
										<td>${review.reviewModDate}</td>
									</tr>
								</table>
							</li>
						</ul>
					</div>
					<div>
						<button type="button" id="deletebtn" name="deletebtn">삭제</button>
					</div>


					<script type="text/javascript">
	 $('#deletebtn').click(function(){
			if(confirm("삭제하시겠습니까?")){
			 const reviewNo = `${review.reviewNo}`;
			 
			 console.log(reviewNo);
			 $.ajax({
				url : "/deleteReportReview?review_no=${review.reviewNo}",
				type : "post",
				data : {"review_no":reviewNo},
				dataType : "JSON",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				
				success:function(data){
					alert(data.res_msg);
					
					if(data.res_code==200){
						location.href="/reportReview";
					}else{
						location.href="/reportReview";
					}
				}
			}); 
			}
		}); 
	</script>


					<div class="col-xl-8 py-5 px-md-5"></div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>