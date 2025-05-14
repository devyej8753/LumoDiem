<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ page import="java.util.List" %>
<%@ page import="com.lumodiem.board.memberboard.vo.ReviewCmt" %>
<% List<ReviewCmt> list = (List<ReviewCmt>)request.getAttribute("resultList"); %>
<script src="<c:url value='/views/jquery-3.7.1.js'/>"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 댓글</title>
</head>
<body>
	<form action="<c:url value='/createCommentEnd'/>" method="post">
		<input type="hidden" name="account_no" value="2">
		<input type="hidden" name="review_no" value="1">
		<input type="text" name="review_cmt_txt" placeholder="내용을 입력하세요.">
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
	
	<form method="post">
			<div class="comment_list">
				<table border = "1">
					<thead>
						<tr>
							<th>번호</th>
							<th>회원</th>
							<th>리뷰 번호</th>
							<th>리뷰 댓글 내용</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach var="r" items="${resultList }" varStatus="vs">
							<tr>
								<td>${r.reviewCmtNo }</td>
								<td>${r.accountNo }</td>
								<td>${r.reviewNo }</td>
								<td>${r.reviewCmtTxt }</td>
								<td><button type='button' data-comment-no="${r.reviewCmtNo }">버튼</button>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
 	<script>
 		 
 		$('.comment_list tbody button').click(function(){
 			const commentNo = $(this).data('comment-no');
			location.href='/selectReviewComment?reviewCommentClicked='+commentNo;
 		});
 		
 	</script>
</body>
</html>