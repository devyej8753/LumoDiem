<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
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

  input[type="date"], input[type="time"], input[type="number"], input[type="text"], button {
    border-radius: 6px;
    border: 1px solid var(--border-color);
    padding: 6px 10px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.2;
    transition: border-color 0.2s ease, box-shadow 0.2s ease,
                background-color 0.2s ease, transform 0.2s ease;
  }
  
  input[type="date"], input[type="time"], input[type="number"], input[type="text"] {
    background-color: #fff;
    color: var(--text-color);
  }
  input[type="date"]:focus, input[type="time"]:focus, input[type="number"]:focus, input[type="text"]:focus {
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
								<div class="row pt-md-4">
<div class="klass_update">

	<form action="" name="update_klass_form">
		<fieldset>
			<legend style="text-align: center;">게시글 수정</legend><br><br>
			<input type="hidden" value="${klass.klassNo}" name="klass_no">
			<input type="text" value="${account.accountNo}" style="display: none" name="account_no">
					
			<label for="klass_name" style="width: 150px; text-align: center;">클래스명 : </label>
			<input type="text" name="klass_name" id="klass_name" required value="${klass.klassName}" style="width: 600px;"><br>
			
			<label for="account_nickname" style="width: 150px; text-align: center;">주최자명 :</label>
			<input type="text" readonly value="${account.accountNickname}" name="account_nickname" id="account_nickname" style="width: 600px;"><br>
			
			<label for="klass_address" style="width: 150px; text-align: center;">주소 : </label>
			<input type="text" readonly value="${account.accountAddress}" name="klass_address" id="klass_address" style="width: 600px;"><br>
			
			<label for="klass_date" style="width: 150px; text-align: center;">날짜 : </label>
			<input type=date name="klass_date" id="klass_date" required value="${fn:substring(klassDate[0].klassStart , 0, 10 )}" style="width: 600px;"><br>
			
			<label for="klass_start" style="width: 150px; text-align: center;">시작 : </label>
			<input type="time" name="klass_start" id="klass_start" required value="${fn:substring(klassDate[0].klassStart , 11, 16 )}" style="width: 600px;"><br>
			
			<label for="klass_end" style="width: 150px; text-align: center;">종료 : </label>
			<input type="time" name="klass_end" id="klass_end" required value="${fn:substring(klassDate[0].klassEnd , 11, 16 )}" style="width: 600px;"><br>
			
			<label for="klass_max" style="width: 150px; text-align: center;">최대 참가인원 : </label>
			<input type="number" name="klass_max" id="klass_max" 
			required placeholder="숫자만 입력해주세요." value="${klass.klassMax}" style="width: 600px;"><br>
			
			<label for="klass_price" style="width: 150px; text-align: center;">수강료 : </label>
			<input type="number" required name="klass_price" id="klass_price" 
			placeholder="숫자만 입력해주세요." value="${klass.klassPrice}" style="width: 600px;"><br><br>
			
			<textarea name="klass_txt" id="klass_txt" required style="width: 600px;">${klass.klassTxt}</textarea>
			
			 <input type="file" name="klass_file" accept=".png,.jpg,.jpeg" style="display: none;">
			
		
		</fieldset>
		<div class="inline-form-group">
				<button type="button" id="updateBtn" style="border-radius: 6px;">수정하기</button>
		</div>
	</form>

</div>	
<script>
	$(function(){
		const form = document.update_klass_form;
		const klassNo = '${klass.klassNo}';
		$('#updateBtn').click(function(){
			const check = confirm("수정하시겠습니까?");
			if(check){
				const val = form.klass_file.value;
				const idx = val.lastIndexOf('.');
				const type = val.substring(idx+1,val.length);
				if(val){
					if(type == 'jpg' || type == 'png' || type== 'jpeg'){
						let sendData = new FormData(form);
						$.ajax({
							url : "/klassBoardUpdateEnd",
							type : "post",
							enctype : "multipart/form-data",
							cache : false,
							async : false,
							contentType:false,
							processData:false,
							data:sendData,
							dataType : "JSON",
							success : function(data){
								alert(data.res_msg);
								if(data.res_code == "200"){
									location.href='/klassDetail?klass_no='+klassNo;
								}
							}
						});
					}else{
						alert('이미지 파일만 선택할 수 있습니다.')
						form.klass_file.value = '';
					}
				}else{
					let sendData = new FormData(form);
					$.ajax({
						url : "/klassBoardUpdateEnd",
						type : "post",
						enctype : "multipart/form-data",
						cache : false,
						async : false,
						contentType:false,
						processData:false,
						data:sendData,
						dataType : "JSON",
						success : function(data){
							alert(data.res_msg);
							if(data.res_code == "200"){
								location.href='/klassDetail?klass_no='+klassNo;
							} 
						} 
					});
				}
			}
		});
		
	    $('#klass_txt').summernote({
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
					</div>
				</section>
			</div>
	
</body>
</html>