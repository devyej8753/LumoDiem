<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>⭐리뷰 게시글 추가⭐</title>
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
	select,input[type="text"], button {
    border-radius: 6px;
    border: 1px solid var(--border-color);
    padding: 6px 10px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.2;
    transition: border-color 0.2s ease, box-shadow 0.2s ease,
                background-color 0.2s ease, transform 0.2s ease;
  }
  
	select,input[type="text"] {
    background-color: #fff;
    color: var(--text-color);
  }
   	select:focus,input[type="text"]:focus {
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
    justify-content: flex-end;
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
				
	<div>
		<form action="<c:url value='/insertReviewPageEnd'/>" method="post" name="create_review_form" enctype="multipart/form-data">	
			<fieldset>
				<legend style="text-align: center;">리뷰 작성</legend>
				<label style="width: 150px; text-align: center;">수강완료 클래스 : </label>
				<select name="res_no">
				<!-- 2. jsp 에서 홈화면 보내는 방법  -->
					<c:choose>
						<c:when test="${not empty klass}">
							<c:forEach var="k" items="${klass}" varStatus="vs">
								<option value="${k.resNo}">${k.klassName}</option>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<option value="0">수강한 클래스가 없습니다</option>
						</c:otherwise>
					</c:choose>
				</select> 
				<br>
				<label for="review_name" style="width: 150px; text-align: center;">게시글 제목 : </label>
				<input type="text" name="review_name" id="review_name" placeholder="제목을 입력하세요." style="width : 600px;"><br><br>
				
				<textarea name="review_txt" id="review_txt"  placeholder="내용을 입력하세요."></textarea><br>
				
				<input type="hidden" name="account_no" value="${account.accountNo}">
				
				<input type="file" name="res_file" accept=".png,.jpg,.jpeg"  style="display: none;"><br>
			</fieldset>
				<div class="inline-form-group">	
				<button type="button" id="insertBtn" style="border-radius: 6px;">작성하기</button>
				</div>		
			
		</form>	
	</div>		
<script>
	$(function(){
		const form = document.create_review_form;
		$('#insertBtn').click(function(){
			const check =  confirm("등록하시겠습니까?");
			
			if(!form.review_name.value){
				alert("게시글 제목을 입력하세요.");
				form.review_name.focus();
			}else if(!form.review_txt.value){
				alert("내용을 입력하세요.");
				form.review_txt.focus();
			}else if(form.res_no.value == '0'){
				alert("리뷰 작성 가능한 클래스가 없습니다.");
				form.res_no.focus();
			}else{
				if(check){
					
					const val = form.res_file.value;
					const idx = val.lastIndexOf('.');
					const type = val.substring(idx+1,val.length);
					if(val){
						if(type == 'jpg' || type == 'png' || type == 'jpeg'){
							let sendData = new FormData(form);
							$.ajax({
								url:'/insertReviewPageEnd',
								type:'post',
								enctype:"multipart/form-data",
								cache:false,
								async:false,
								contentType:false,
								processData:false,
								data:sendData,
								dataType:'json',
								success:function(data){
									alert(data.res_msg);
									if(data.res_code == "200"){
										location.href="/reviewBoard";
									} 
								}
							})
						}else{
							alert('이미지 파일만 선택할 수 있습니다.')
							form.res_file.value = '';
						}
						
					}else{
						let sendData = new FormData(form);
						$.ajax({
							url:'/insertReviewPageEnd',
							type:'post',
							enctype:"multipart/form-data",
							cache:false,
							async:false,
							contentType:false,
							processData:false,
							data:sendData,
							dataType:'json',
							success:function(data){
								alert(data.res_msg);
								if(data.res_code == "200"){
									location.href="/reviewBoard";
								} 
							}
						})
					}
				}
				
			}
		});
		$('#review_txt').summernote({
			  width: 800,           // 가로 크기
		      height: 400,          // 높이 설정
		      placeholder: '내용을 입력해주세요...',  // 플레이스홀더(기본 안내 문구)
		      focus: true,          // 초기 로딩 후 편집 영역에 커서 포커스
		      lang: 'ko-KR',        // 한국어 설정 (lang 파일 필요)
		      toolbar: [
		        // 툴바 그룹/버튼 구성
		        ['groupName', ['list of button']],
		        ['insert', ['picture']],
		        ['style', ['fontname']],
		        ['fontname', ['fontname']],
		        ['font', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
		        ['color', ['color', 'backcolor']],
		        ['para', ['ul', 'ol', 'paragraph']],
		        ['height', ['height']],
		        ['view', ['fullscreen', 'codeview', 'help']]
		      ]
			});
	});

</script>
				</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>