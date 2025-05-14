<%@page import="com.lumodiem.board.memberboard.vo.ReviewCmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<script src="<c:url value='/views/jquery-3.7.1.js'/>"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>test</h1>
	<section>
		<div>
			<div class="update_comment_form">
				<form action='updateReviewCommentEnd' name="update_comment_form" method="post">
					<input type="hidden" name="review_cmt_no" value="${cmt.reviewCmtNo }">
					<input type="text" name="review_comment_txt" value="${cmt.reviewCmtTxt }">
					<input type="button" value="수정" onclick="updateComment();">	
					<input type="button" value="삭제" onclick="deleteComment();" >
				</form>
			</div>
			
		</div>
	</section>
	<script type="text/javascript">
		 const deleteComment = function(){
			const form = document.update_comment_form;
			$.ajax({
				url : "/deleteReviewCommentEnd",
				type : "post",
				data : {"review_cmt_no":form.review_cmt_no.value},
				dataType : "JSON",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				
				success:function(data){
					alert(data.res_msg);
					
					if(data.res_code==200){
						location.href="/";
					}
				}
			});
		} 
		const updateComment = function() {
			const form = document.update_comment_form;
			$.ajax({
				url : "/updateReviewCommentEnd",
				type : "post",
				data : {"review_cmt_no":form.review_cmt_no.value,
					"review_cmt_txt":form.review_comment_txt.value},
				dataType : "JSON",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success:function(data){
					alert(data.res_msg);
					
					if(data.res_code==200){
						location.href="/";
					}
				}
			});
		}
		
	</script>
</body>
</html>