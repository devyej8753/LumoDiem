<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.lumodiem.board.memberboard.vo.*"  %>
<%Review review = (Review)request.getAttribute("review"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
<link rel="stylesheet" href="<c:url value='/views/css/reviewComment.css'/>"> 
<title>클래스 조회</title>

<style>
.inline-form-group {
    display: flex;
    align-items: center;
    gap: 8px;
    margin: 8px 0; 
    justify-content: flex-end; 
    padding-right: 30px; 
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
					<div class="row pt-md-4">
			
			
<div class="review" 
	style="
		max-width: 100%; 
        margin: 0 auto; 
        border: 1px solid #ddd; 
        border-radius: 10px; 
        padding: 20px; 
        box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
       ">
	<h3 style="text-align: center; margin-bottom: 20px;">리뷰 상세 정보</h3>
    
    <!-- 수정/삭제 버튼 (조건부) -->
    <c:choose>
        <c:when test="${review.accountNo eq account.accountNo or account.accountGrade eq 'A'}">
            <div style="text-align: right; margin-bottom: 10px;">
                    <a href="/updateReviewPage?review_no=${review.reviewNo}" style="text-decoration: none;">
		                <button type="button" id="updateBtn" name="updateBtn" 
		                style="background: #D1B5E0; color: white; border: none; 
                               padding: 8px 12px; border-radius: 5px; cursor: pointer;">
		                    수정
		                </button>
                    </a>
                <button type="button" id="deleteBtn" name="deleteBtn" 
                 style="background: #FF6058; color: white; border: none; 
                             padding: 8px 12px; border-radius: 5px; cursor: pointer;">
                    삭제
                </button>
            </div>
        </c:when>
    </c:choose>
    
    
    <ul style="list-style: none; padding: 0;">
        <li style="text-align: center; margin-bottom: 20px;">
            <c:choose>
                <c:when test="${review.attachNo > 0}">
                    <img src="${request.getContextPath}/filePath?attach_no=${review.attachNo}" 
                    	style="max-width: 100%; max-height: 100%;">
                </c:when>
                <c:otherwise>
                    <img alt="사진" src="/views/mainpage/thumbnail.jpg" style="height: 244px; width:244px;">
                </c:otherwise>
            </c:choose>
        </li>
        <li>
            <table style="width: 100%; border-collapse: collapse;">
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="font-weight: bold; padding: 8px;">제목</td>
                    <td style="padding: 8px;">${review.reviewName}</td>
                </tr>
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="font-weight: bold; padding: 8px;">내용</td>
                    <td style="padding: 8px;">${review.reviewTxt}</td>
                </tr>
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="font-weight: bold; padding: 8px;">클래스명</td>
                    <td style="padding: 8px;">${review.klassName}</td>
                </tr>
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="font-weight: bold; padding: 8px;">작성자</td>
                    <td style="padding: 8px;">${review.accountNickname}</td>
                </tr>
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="font-weight: bold; padding: 8px;">등록일</td>
                    <td style="padding: 8px;">${review.reviewRegDate}</td>
                </tr>
                <tr style="border-bottom: 1px solid #ddd;">
                    <td style="font-weight: bold; padding: 8px;">수정일</td>
                    <td style="padding: 8px;">${review.reviewModDate}</td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding: 10px;">
                        <c:choose>
                            <c:when test="${myLikeCount eq 0}">
                                <div class="icon">
                                    <span class="icon-heart-o" id="unlikeToLike" style="color: #f44336; font-size: 20px;">${totalLikeCount}</span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="icon">
                                    <span class="icon-heart" id="likeToUnlike" style="color: #f44336; font-size: 20px;">${totalLikeCount}</span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
        </li>
    </ul>
</div> 

		<!-- 🚨 신고 버튼 -->
		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"
		    style="position: absolute; top: 10px; right: 10px; font-size: 14px; padding: 6px 8px; width: 40px; height: 40px; line-height: 1; border-radius: 50%; display: flex; align-items: center; justify-content: center;">
		    🚨
		</button>

		<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">리뷰 게시글 신고하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
   					 <input type="radio" name="reportReview" id="abuse" value="욕설">
   					 <label for="aduse">욕설</label><br>
   					 <input type="radio" name="reportReview" id="hateSpch" value="비하발언">
   					 <label for="hateSpch">비하발언</label><br>
   					 <input type="radio" name="reportReview" id="improperNickname" value="부적절한 닉네임">
   					 <label for="improperNickname">부적절한 닉네임</label><br>
   					 <input type="radio" name="reportReview" id="adv" value="광고">
   					 <label for="adv">광고</label>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn-primary">신고</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
	<!-- 리뷰 목록 -->	
	<div style="width: 100%; max-width: 100%; margin: 20px auto; 
                border: 1px solid #ddd; border-radius: 10px; padding: 10px;">
    <form>
        <table class="review_cmt_list"
                  style="
                    width: 100%;
                    border-collapse: separate;
                    border-spacing: 0 5px;
                    text-align: center;
                    border: 1px solid #ddd;">
            <thead style="border-bottom: 2px solid #aaa; background-color: #D1B5E0;">
               <tr style="border-bottom: 1px solid #ddd;">
                 <th style="width: 60px; padding: 8px;">No.</th>
                 <th style="width: 200px; padding: 8px;">내용</th>
                 <th style="width: 100px; padding: 8px;">닉네임</th>
                 <th style="width: 100px; padding: 8px;">수정/삭제</th>
               </tr>
            </thead>
            
            
            <tbody>
                <c:choose>
                    <c:when test="${not empty reviewCmt}">
                        <c:forEach var="list" items="${reviewCmt}" varStatus="vs">
                                <tr style="background-color: #E8DAEF; border-bottom: 1px solid #ddd;">
                                    <th style="padding: 8px;">${vs.count}</th> 
                                    <td style="padding: 8px;">
                                        <input type="hidden" class="review_cmt_no" value="${list.reviewCmtNo}">
                                        <textarea class="review_cmt_txt" readonly="readonly" style=" width: 100%; text-align: center; align-items: center; justify-content: center; background-color: #E8DAEF;  height: 80px; padding: 8px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px; resize: none;">${list.reviewCmtTxt}</textarea>
                                    	
                                    </td>
                                    <td>${list.accountNickname}</td>
                                    <c:choose>
                                        <c:when test="${list.accountNo eq account.accountNo}">
                                            <td style="padding: 8px;">
                                                <input class="a" type="button" value="수정" style="padding: 5px 10px; border: none; background-color: #D1B5E0; color: white; border-radius: 5px; cursor: pointer;"><br>
                                                <input type="button" class="delete_btn" value="삭제" style="padding: 5px 10px; border: none; background-color: #FF6058; color: white; border-radius: 5px; cursor: pointer;">
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                        	<td style="padding: 8px;"></td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr style="background-color: #E8DAEF; border-bottom: 1px solid #ddd;">
                            <td colspan="5" style="padding: 8px;">
                         	   작성된 댓글이 없습니다.
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </form>
</div>
	
		<div class="create_comment_form">
			<form name="create_comment_form" method="post"
				class="inline-form-group"
                style="justify-content: space-between; width: 100%;">
				<input type="text" value="${account.accountNo}" style="display: none" name="account_no">
				<input type="hidden" name="review_no" value="${review.reviewNo }">
				<textarea class="review_cmt_txt" name="review_cmt_txt" placeholder="내용을 입력하세요."></textarea>
				
				
			</form>
		</div>
		<br><br>
		<div class="inline-form-group">
				<button type="button" id="create_comment"
					style="
		            position: absolute; 
		            right: 10px; 
		            bottom: 10px;
		            padding: 6px 12px;
		            border-radius: 6px;
		            background-color: #D1B5E0;
		            color: #fff;
		            border: none;
		            cursor: pointer;
		            margin-right: 40px;
		            margin-top: 30px;">
					등록
				</button>
		</div>
	</div>
	<div>
	
	<script>
		$('.btn-primary').click(function(){
			const reviewNo = ${review.reviewNo};
			const accountNo = ${account.accountNo}
			let rp = $('.modal-body input[name="reportReview"]:checked').val();
			console.log(rp);
			console.log(reviewNo);
			console.log(accountNo);
			const rpCheck = confirm("신고하시겠습니까?");
			if(rpCheck){
				$.ajax({
					url : "/reviewReport",
					type : "post",
					data : {"review_no" : reviewNo
							,"account" : accountNo
							,"report_review_txt" : rp},
					datatype : "json",
					success : function(data){
						alert(data.res_msg);
						if(data.res_code == "200"){
							location.href="/reviewBoard";
						}else{
							location.href="/";
						}
					}
				});
			}
		})
	</script>
	<script>
		$('#deleteBtn').click(function(){
			const reviewNo = ${review.reviewNo};
			const attachNo = ${review.attachNo};
			const check = confirm("삭제하시겠습니까?");
			if(check){
				$.ajax({
					url : "/deleteReviewPage",
					type : "post",
					data : {"review_no" : reviewNo
							,"attach_no" : attachNo},
					dataType : "json",
					success : function(data){
						alert(data.res_msg);
						if(data.res_code == "200"){
							location.href="/reviewBoard";
						}else{
							location.href="/";
						}
					}
				});
			}
		})
	</script>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>



	<script>
		$(function(){
			let reviewNumber = "${review.reviewNo}";
			let unlikeToLike = "unlikeToLike";
			let likeToUnlike = "likeToUnlike";
			$(document).on('click', '#unlikeToLike', function(){
				$.ajax({
					url : "/reviewLikeChange",
					type : "post",
					data : {
						"review_no" : reviewNumber,
						"like" : unlikeToLike
					},
					dataType : 'json',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						if(data.res_code == "200"){
							alert('좋아요!');
							$('#unlikeToLike').text(data.newTotalLikeCount);
							$('#unlikeToLike').attr("id", "likeToUnlike").removeClass('icon-heart-o').addClass('icon-heart');
						} else{
							alert('오류. 홈페이지로 이동합니다.');
							location.href="/";
						}
					},
					error : function(){
						alert('ajax 실패1');
					}
				});
			});
			$(document).on('click', '#likeToUnlike', function(){
				$.ajax({
					url : "/reviewLikeChange",
					type : "post",
					data : {
						"review_no" : reviewNumber,
						"like" : likeToUnlike
						},
					dataType : 'json',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						if(data.res_code == "200"){
							alert('좋아요를 취소합니다.');
							$('#likeToUnlike').text(data.newTotalLikeCount);
							$('#likeToUnlike').attr("id", "unlikeToLike").removeClass('icon-heart').addClass('icon-heart-o');
						} else{
							alert('오류. 홈페이지로 이동합니다.');
							location.href="/";
						}
					},
					error : function(){
						alert('ajax 실패2');
					}
				});
			});
		})
		$(document).on('click', '.a', function () {
			    const row = $(this).closest('tr');
			    const textarea = row.find('.review_cmt_txt');
			
			    if (textarea.length) {
			        textarea.removeAttr("readonly"); 
			        textarea.focus(); 
			    }
			
			    $(this).removeClass('a');
			    $(this).addClass('b');
			    $(this).val("저장");
			    row.find('.delete_btn').show();
			    alert('수정하십시오');
			});
			

			 $(document).on('click', '.b', function (){
	            const row = $(this).closest('tr');
	            const reviewCmtNo = row.find('.review_cmt_no').val(); 
	            const reviewCmtTxt = row.find('.review_cmt_txt').val(); 
	    			$.ajax({
	    				url : "/updateReviewCommentEnd",
	    				type : "post",
	    				data : {"review_cmt_no":reviewCmtNo,
	    					"review_cmt_txt":reviewCmtTxt},
	    				dataType : "JSON",
	    				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    				success:function(data){
	    					alert(data.res_msg);
	    					
	    					if(data.res_code==200){
	    						location.reload();
	    					}else{
	    						location.reload();
	    					}
	    				}
	    			});
	        })
	        $(document).on('click','.delete_btn', function(){
	        	const row = $(this).closest('tr');
	        	const reviewCmtNo = row.find('.review_cmt_no').val(); 
				$.ajax({
					url : "/deleteReviewCommentEnd",
					type : "post",
					data : {"review_cmt_no":reviewCmtNo},
					dataType : "JSON",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					
					success:function(data){
						alert(data.res_msg);
						
						if(data.res_code==200){
							location.reload();
						}else{
							location.reload();
						}
				}
			});
		})
		 $(document).on('click','#create_comment',function(){
			 	const form = document.create_comment_form;
			 	console.log({
			        "review_cmt_txt": form.review_cmt_txt.value,
			        "review_no": form.review_no.value,
			        "account_no": form.account_no.value
			    });
				$.ajax({
					url : "/createCommentEnd",
					type : "post",
					data : {"review_cmt_txt":form.review_cmt_txt.value,
							"review_no":form.review_no.value,
							"account_no":form.account_no.value},
					dataType : "JSON",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					
					success:function(data){
						alert(data.res_msg);
						
						if(data.res_code==200){
							location.reload();
						}else{
							location.reload();
						}
				}
			});
		 })
		
		
		
	</script>
</body>
</html>