<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>
<%@ page import="com.lumodiem.board.hostboard.vo.Klass" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 게시판</title>
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
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
  /* 버튼 호버 */
  button:hover {
    background-color: var(--base-600);
  }
  /* 버튼 클릭(액티브) */
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
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">	
						<div class="row pt-md-4">



<!-- 페이지 제목  -->
<h3 style="text-align: center; margin-bottom: 20px;">승인 대기 클래스 목록</h3>
	
<div style="text-align: center; margin-top: 20px;">	
	<!-- 정렬하기 + 작성하기 (한 줄 정렬) -->
	<form action="/arreoveList" id="arrangeKlass" name="arrangeKlass"
		class="inline-form-group"
        style="justify-content: space-between; width: 100%;">
		<select name="order_type" id="order_type">
			<option value="x">정렬하기</option>
			<option value="a">최신순</option>
			<option value="b">오래된순</option>
		</select>
	</form>
</div>	
	<!-- 대기중인 클래스 목록 -->
<div class="approve_list" style="width: 100%; max-width: 100%; margin: 20px auto; 
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
					<th style="width: 60px; padding: 8px; text-align: center;">No.</th>
					<th style="width: 300px; padding: 8px; text-align: center;">클래스명</th>			
					<th style="width: 100px; padding: 8px; text-align: center;">닉네임</th>			
				</tr>
			</thead>
			<tbody>
				<c:choose>	
					<c:when test="${not empty resultList }">
						<c:forEach var="list" varStatus="vs" items="${resultList }">
							<tr data-klass-no="${list.klassNo }" style="background-color: #E8DAEF; border-bottom: 1px solid #ddd;">
								<td style="padding: 8px;">${vs.count}</td>
								<td style="padding: 8px;">${list.klassName}</td>
								<td style="padding: 8px;">${list.accountNickname}</td>
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
							<c:url var="testUrl" value="/arreoveList">
								<c:param name="nowPage" value="${paging.pageBarStart - 1}"/>
							</c:url>
							<a style="color: #724AA9;" href="${testUrl}">&laquo;</a>
						</c:if>
						
						
						<c:forEach var="i" begin="${paging.pageBarStart }" end="${paging.pageBarEnd }" varStatus="vs">
							<a class="pagingNumber" style="color: #724AA9;" href="/arreoveList=${i}">${i}</a>
						</c:forEach>
						
						
						<c:if test="${paging.next }">
							<a style="color: #724AA9;" href="/arreoveList?nowPage=${paging.pageBarEnd + 1}">&raquo;</a>
						</c:if>
								
					</c:if>
					<c:if test="${empty paging }">123</c:if>
			</form>
			<!-- 페이징 끝 -->	
				
<!-- 검색 (한 줄 정렬) -->
<div style="text-align: center; margin-top: 20px;">		
	<form action="/arreoveList" id="searchApproveList" method="post"
			class="inline-form-group"
            style="display: inline-flex;">
		<select name="search_type" id="search_type">
			<option value="0">선택</option>			
			<option value="1">클래스명</option>			
			<option value="2">닉네임</option>			
			<option value="3">내용</option>			
		</select>
		<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
		<button name="searchBtn" id="searchBtn" style="border-radius: 6px;">검색</button>
	</form>	
</div>
	
	
					</div> <!-- .row pt-md-4 -->
				</div> <!-- .col-xl-8 -->
			</div> <!-- .row d-flex -->
		</div> <!-- .container -->
	</section>	
</div> <!-- #colorlib-main -->
<script>
		const orderType = document.getElementById('order_type');
		orderType.onchange = function(){
			document.getElementById('arrangeKlass').submit();
		}
	$('.approve_list tbody tr').click(function(){
		const klassNo = $(this).data('klass-no');
		location.href='/approveDetail?klass_no='+klassNo;
	})

</script>

<%@ include file="/views/include/nav.jsp" %>
</body>
</html>