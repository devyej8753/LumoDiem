<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LumoDiem</title>

<!-- index.jsp 전용 CSS가 필요하다면 여기 추가 -->
<!-- Bootstrap 5, jQuery, Summernote는 nav.jsp에서 이미 로드됨 -->
<link rel="stylesheet" href="<c:url value='/css/style.css'/>">
<!-- <style>
    body {
        background-image: url('${pageContext.request.contextPath}/views/mainpage/mainpage01.jpg');
        background-size: cover;
        background-position: right;
        background-repeat: no-repeat;
    }

    @media (max-width: 768px) {
        body {
            background-size: contain;
        }
    }
</style> -->

</head>
<%-- <body style="background-image: url('${pageContext.request.contextPath}/views/mainpage/mainpage01.jpg')"> --%>
<!-- 홈 화면 배경 사진  -->
<body style="
    background-image: url('${pageContext.request.contextPath}/views/mainpage/mainpage01.jpg');
    background-size: 23%; /* 이미지를 작게 설정 */
    background-repeat: repeat;
">

	<%-- <c:url value="/views/include/nav.jsp" var="nav"/>
	<c:import url="${nav}"/> --%>
	<!-- c태그 이상시 아래의 include 태그 활성화 -->
	<%-- <%@ include file="/views/include/nav.jsp" %> --%>
				
				<!-- 이거 가져다 쓰세요 -->
						<!-- 
<div id="colorlib-main">
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row d-flex">
				<div class="col-xl-8 py-5 px-md-5">
					<div class="row pt-md-4">
					
					<a>내용 쓰기</a>
					
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
					 -->
			
			
			<!-- 메인 -->
			<div id="colorlib-main">
				<section class="ftco-section ftco-no-pt ftco-no-pb">
					<div class="container">
						<div class="row d-flex">
							<div class="col-xl-8 py-5 px-md-5">
								<div class="row pt-md-4">
								
									<!-- ctrl + c v -->
								
								
									<!-- (게시판 작성할때 한 줄이라고 생각 하면 됨!) -->
									<%-- <div class="col-md-12 ">
										<div class="blog-entry ftco-animate d-md-flex">
											<a href="single.html" class="img img-2" style="background-image: url();"><img alt="뚱이" src=""></a>
											<div class="text text-2 pl-md-4">
												<h3 class="mb-2"><a href="single.html">${test}</a></h3>
												<div class="meta-wrap">
													<p class="meta">
														<span><i class="icon-calendar mr-2"></i>날짜 넣기</span>
														<span><a href="single.html"><i class="icon-folder-o mr-2"></i>좋아요 아이콘 넣기</a></span>
														<span><i class="icon-comment2 mr-2"></i>댓글 수 : 5</span>
													</p>
												</div>
												<p class="mb-4">간단한 내용 의미 없게 길게 써보기 시작한다 가나다라마바사 A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
												<p><a href="#" class="btn-custom">더 보기.. (a태그 속성에 url 써주자)<span class="ion-ios-arrow-forward"></span></a></p>
											</div>
										</div>
									</div> --%>
									<!-- 한 줄 끝! -->
									
									
									<!-- (게시판 작성할때 한 줄이라고 생각 하면 됨!) -->
									<!-- <div class="col-md-12">
										<div class="blog-entry ftco-animate d-md-flex">
											<a href="single.html" class="img img-2" style="background-image: url();"><img alt="뚱이" src=""></a>
											<div class="text text-2 pl-md-4">
												<h3 class="mb-2"><a href="single.html">제목 겸 a태그</a></h3>
												<div class="meta-wrap">
													<p class="meta">
														<span><i class="icon-calendar mr-2"></i>날짜 넣기</span>
														<span><a href="single.html"><i class="icon-folder-o mr-2"></i>좋아요 아이콘 넣기</a></span>
														<span><i class="icon-comment2 mr-2"></i>댓글 수 : 5</span>
													</p>
												</div>
												<p class="mb-4">간단한 내용</p>
												<p><a href="#" class="btn-custom">더 보기.. (a태그 속성에 url 써주자)<span class="ion-ios-arrow-forward"></span></a></p>
											</div>
										</div>
									</div>
									한 줄 끝!
									
									<div>
										<label for="test123">sdf : </label><input type="text" id="test123">
									</div> -->
									
									
								</div>
							</div>
						</div>
					</div>
				</section>
				
				
				
				
			</div>
			<!-- 메인 내용 끝 -->
	<!-- 페이지 완성 -->

	
	

	
	  <!-- nav.jsp include (마지막에) -->
	<%-- 이거 왜 아래 있어야 적용되는거야.. --%>
<%@ include file="/views/include/nav.jsp" %>

</body>
</html>