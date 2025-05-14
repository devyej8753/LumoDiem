<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ page import="java.util.List" %>
<%@ page import="com.lumodiem.board.adminboard.vo.ReportReview" %>
<%@ page import="com.lumodiem.board.memberboard.vo.Review" %>
<% List<ReportReview> list = (List<ReportReview>)request.getAttribute("resultList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Review</title>
<style>
  :root {
    --base-100: #F4ECF8;
    --base-200: #EBE0F2;
    --base-300: #E2D5ED;
    --base-400: #D8C9E7;
    --base-500: #D1B5E0; 
    --base-600: #BFA3CE;
    --base-700: #AD91BC;
    --base-800: #9B7FAA;
    --base-900: #8A6E99;

    --text-color: #333;
    --border-color: #CABED1;
  }

  * {
    box-sizing: border-box; 
  }
  body {
    margin: 0;
    padding: 0;
    background-color: var(--base-100);
    color: var(--text-color);
    font-family: 'Noto Sans KR', sans-serif; 
  }

  
  table {
    width: 100%;
    border-collapse: collapse; 
    margin: 16px 0;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    border: 1px solid var(--border-color);
  }
  thead {
    background-color: var(--base-400);
    color: var(--text-color);
  }
  thead th {
    padding: 12px;
    border-bottom: 1px solid var(--border-color);
    text-align: left;
  }
  tbody tr {
    border-bottom: 1px solid var(--border-color);
  }
  tbody td {
    padding: 12px;
  }
  tbody tr:nth-child(even) {
    background-color: var(--base-300);
  }

 
  select, input[type="text"], button {
    border-radius: 6px;
    border: 1px solid var(--border-color);
    padding: 6px 10px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.2;
    transition: border-color 0.2s ease, box-shadow 0.2s ease,
                background-color 0.2s ease, transform 0.2s ease;
  }

  select, input[type="text"] {
    background-color: #fff;
    color: var(--text-color);
  }
  select:focus, input[type="text"]:focus {
    outline: none;
    border-color: var(--base-500);
    box-shadow: 0 0 0 2px rgba(209,181,224,0.2);
  }

  button {
    background-color: var(--base-500);
    color: #fff;
    cursor: pointer;
  }
  button:hover {
    background-color: var(--base-600);
  }
  button:active {
    background-color: var(--base-700);
    transform: translateY(1px);
  }

	.inline-form-group {
    display: flex;
    align-items: center;
    gap: 8px; 
    margin: 8px 0; 
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
	<!-- 페이지 제목  -->
	<h3 style="text-align: center; margin-bottom: 20px;">신고된 리뷰 목록</h3>	

	
	<!-- 신고된 리뷰 목록 출력 부분 -->
	<div class="report_review_list" style="width: 100%; max-width: 100%; margin: 20px auto; 
                        border: 1px solid #ddd; border-radius: 10px; padding: 10px;">
	
		<form>
			<table class="report_klass_list" style="
                    width: 100%;
                    border-collapse: separate;
                    border-spacing: 0 5px;
                    text-align: center;
                    border: 1px solid #ddd;">
				<thead style="border-bottom: 2px solid #aaa; background-color: #D1B5E0;">
					<tr style="border-bottom: 1px solid #ddd; text-align: center;">
						<th style="width: 300px; padding: 8px; text-align: center;">리뷰명</th>			
						<th style="width: 100px; padding: 8px; text-align: center;">닉네임</th>		
						<th style="width: 60px; padding: 8px; text-align: center;">신고 사유</th>	
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty resultList }">
							<c:forEach var="list" varStatus="vs" items="${resultList }">
								<tr data-report-review-no="${list.reviewNo }" style="background-color: #E8DAEF; border-bottom: 1px solid #ddd;">
									<td style="padding: 8px;">${list.reviewName}</td>
									<td style="padding: 8px;">${list.accountNickname }</td>
									<td style="padding: 8px;">${list.reportReviewTxt }</td>
								</tr>
							</c:forEach>
						
						</c:when>
						<c:otherwise>
							<tr style="background-color: #E8DAEF; border-bottom: 1px solid #ddd;">
								<td colspan="3">해당되는 게시글이 존재하지 않습니다.</td>
							</tr>
						
						</c:otherwise>
					
					</c:choose>
				</tbody>
			</table>
		</form>
	</div>
	
			<!-- 페이징 시작 -->
			<form style="text-align: center;">
					<c:if test="${not empty paging}">
							
						<c:if test="${paging.prev}">
							<!-- c:url 사용해보자! -->
							<c:url var="testUrl" value="/reportReview">
								<c:param name="nowPage" value="${paging.pageBarStart - 1}"/>
							</c:url>
							<a style="color: #724AA9;" href="${testUrl}">&laquo;</a>
						</c:if>
						
						
						<c:forEach var="i" begin="${paging.pageBarStart }" end="${paging.pageBarEnd }" varStatus="vs">
							<a class="pagingNumber" style="color: #724AA9;" href="/reportReview?nowPage=${i}">${i}</a>
						</c:forEach>
						
						
						<c:if test="${paging.next }">
							<a style="color: #724AA9;" href="/reportReview?nowPage=${paging.pageBarEnd + 1}">&raquo;</a>
						</c:if>
								
					</c:if>
					<c:if test="${empty paging }">123</c:if>
			</form>
			<!-- 페이징 끝 -->	
			
<!-- 선택 / 검색하기 -->	
<div style="text-align: center; margin-top: 20px;">					
	<form action="<c:url value='/reportReview'/>" id="search_report_review" method="post"
			class="inline-form-group" style="display: inline-flex;">
		<select name="search_type" id="search_type">
			<option value="0">선택</option>			
			<option value="1">리뷰명</option>			
			<option value="2">닉네임</option>			
			<option value="3">신고사유</option>			
		</select>
		<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
		<button name="searchBtn" id="searchBtn" style="border-radius: 6px;">검색</button>
	</form>
</div>






	
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script>
	$('.report_review_list tbody tr').click(function(){
		const reportReviewNo = $(this).data('report-review-no');

		if(reportReviewNo != undefined){
			location.href = '/reviewDetail?review_no='+reportReviewNo;
		}else{
			location.reload();
		}
	});
		
 		 
 		
 		
 	</script>
</body>
</html>