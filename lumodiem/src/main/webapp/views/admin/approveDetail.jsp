<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
<title>승인 대기 클래스</title>
</head>
<body>
<%@ include file="/views/include/nav.jsp" %>
<div id="colorlib-main">
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row d-flex">
				<div class="col-xl-8 py-5 px-md-5">
					<div class="row pt-md-4">
	 
	 <!-- ====== 대기 클래스 상세 정보 ====== -->				
	<div class="klass_detail"
		style="
	  max-width: 100%; 
	  margin: 0 auto; 
	  border: 1px solid #ddd; 
	  border-radius: 10px; 
	  padding: 20px; 
	  box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
	">
		<!-- 게시글 타이틀 -->
		<h3 style="text-align: center; margin-bottom: 20px;">승인 대기 클래스</h3>
		
		<!-- 승인 / 반려 버튼 (조건부) -->
		<c:choose >
		
			<c:when test="${klass.accountNo eq account.accountNo or account.accountGrade eq 'A' }">
				<div style="text-align: right; margin-bottom: 10px;">
					<c:choose>
						<c:when test="${klass.approveCode eq 'S' }">
							<button type="button" id="updateBtn" name="updateBtn"
									style="background: #D1B5E0; color: white; border: none; 
							        padding: 8px 12px; border-radius: 5px; cursor: pointer;">
								승인
							</button>
							<button type="button" id="rejectBtn" name="rejectBtn"
									style="background: #FF6058; color: white; border: none; 
							      	padding: 8px 12px; border-radius: 5px; cursor: pointer;">
								반려
							</button>
						</c:when>
						<c:when test="${klass.approveCode eq 'A' }">
							<button type='button' id="deleteBtn" name="deleteBtn"
									style="background: #FF6058; color: white; border: none;	 
							      	padding: 8px 12px; border-radius: 5px; cursor: pointer;">
								삭제
							</button>
					</c:when>
					
					</c:choose>
				</div>
			</c:when>
		
		</c:choose>
		
		
		<input type="hidden" value="${klass.klassNo}" name="klass_no">
		
		<ul style="list-style: none; padding: 0;">
			<li style="text-align: center; margin-bottom: 20px;">
				<!-- 사진 있는 경우/ 없는 경우 상단 사진. -->
				<c:choose>
					<c:when test="${not empty klassAttach}">
						<c:forEach var="list" varStatus="vs" items="${klassAttach }">
							<img alt="사진" src="<%=request.getContextPath()%>/klassFilePath?attach_no=${list.attachNo}" 
							style="max-width: 100%; max-height: 100%;" >
							<!--  </a> -->
						</c:forEach>
					</c:when>
					<c:otherwise>
						<img alt="썸네일" src="/views/mainpage/thumbnail.jpg" style="height: 244px; width:244px;">
						<!-- </a> -->
					</c:otherwise>
				</c:choose>
            </li>
			<li>
				<!-- 클래스 글 정보 -->
				<table style="width: 100%; border-collapse: collapse; ">
					<tr style="border-bottom: 1px solid #ddd;">
						<th style="font-weight: bold; padding: 8px;">클래스명</th>
						<td style="padding: 8px;">${klass.klassName}</td>
					</tr>
					<tr style="border-bottom: 1px solid #ddd;">
						<th style="font-weight: bold; padding: 8px;">주최자</th>
						<td style="padding: 8px;">${klass.accountNickname}</td>
					</tr>
					<tr style="border-bottom: 1px solid #ddd;">
						<th style="font-weight: bold; padding: 8px;">일정</th>
						<td style="padding: 8px;">
							<c:forEach var="li" items="${klassDate }" varStatus="vs">
							${fn:substring(li.klassStart,0,10)}<br>
							</c:forEach>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #ddd;">
					<th style="font-weight: bold; padding: 8px;">시간</th>
						<td style="padding: 8px;">
							<c:forEach var="li" items="${klassDate }" varStatus="vs">
							${fn:substring(li.klassStart,11,19)}<br>
							</c:forEach>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #ddd;">
						<th style="font-weight: bold; padding: 8px;">최대(예약가능)</th>
						<td style="padding: 8px;">
							<c:forEach var="li" items="${klassDate }" varStatus="vs">
							${klass.klassMax}명(${klass.klassMax - li.klassCount}명)<br>
							</c:forEach>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #ddd;">
						<th style="font-weight: bold; padding: 8px;">주소</th>
						<td style="padding: 8px;">${klass.klassAddress }</td>
					</tr>
					<tr style="border-bottom: 1px solid #ddd;">
						<th style="font-weight: bold; padding: 8px;">수업료</th>
						<td style="padding: 8px;">${klass.klassPrice }원</td>
					</tr>
					<tr style="border-bottom: 1px solid #ddd;">
						<th style="font-weight: bold; padding: 8px;">작성일</th>
						<td style="padding: 8px;">${klass.klassRegDate}</td>
					</tr>
				
				</table>		
			</li>
			<li>
				<br>
				<!-- 클래스 내용 -->
				<div>
					${klass.klassTxt}
				</div>
			</li>
		</ul>
	</div> <!-- klass_detail -->
		
	
							</div><!-- row pt-md-4 끝 -->	
						</div><!-- col-xl-8 끝 -->
				</div><!-- row 끝 -->
			</div><!-- container 끝 -->
	</section>
</div><!-- colorlib-main 끝 -->			
<script type="text/javascript">
	$('#updateBtn').click(function(){
		const klassNo = ${klass.klassNo}; 
		const check = confirm("승인하시겠습니까?");
		if(check == true){
			const approveCode = 'A';
			$.ajax({
				url : "approveUpdate?klass_no=${klass.klassNo }",
				type : "post",
				data : {"klass_no" : klassNo,
						"approve_code" :approveCode
						},
				dataType : "JSON",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data){
					alert(data.res_msg);
					if(data.res_code == "200"){
						location.href="/arreoveList";
					} else{
						location.href="/arreoveList";
					}
				}
			});
		}
	});
	
	$('#rejectBtn').click(function(){
		const klassNo = ${klass.klassNo}; 
		const approveFb = prompt("반려사유");
		console.log(approveFb);
		const check = confirm("반려하시겠습니까?");
		if(check == true){
		const approveCode = 'D';
			$.ajax({
				url : "approveUpdate?klass_no=${klass.klassNo }",
				type : "post",
				data : {"klass_no" : klassNo,
						"approve_code" :approveCode,
						"approve_fb" : approveFb
						},
				dataType : "JSON",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data){
					alert(data.res_msg);
					if(data.res_code == "200"){
						location.href="/arreoveList";
					} else{
						location.href="/arreoveList";
					}
				}
			});
		}
	});
		
	$('#deleteBtn').click(function(){
		if(confirm("삭제하시겠습니까?")){
		const klassNo = ${klass.klassNo}; 
			$.ajax({
				url : "/deleteReportKlass?klass_no=${klass.klassNo }",
				type : "post",
				data : {"klass_no":klassNo},
				dataType : "JSON",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				
				success:function(data){
					alert(data.res_msg);
					
					if(data.res_code==200){
						location.href="/reportKlass";
					}else{
						location.href="/reportKlass";
					}
				}
			});
		}else{
			
		}
	});
		
</script>


</body>
</html>