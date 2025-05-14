<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
<link rel="stylesheet" href="<c:url value='/views/css/nav.css'/>">

<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/jquery-migrate-3.0.1.min.js'/>"></script>
<script src="<c:url value='/js/popper.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/jquery.easing.1.3.js'/>"></script>
<script src="<c:url value='/js/jquery.waypoints.min.js'/>"></script>
<script src="<c:url value='/js/jquery.stellar.min.js'/>"></script>
<script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
<script src="<c:url value='/js/jquery.magnific-popup.min.js'/>"></script>

<script src="https://unpkg.com/aos@next/dist/aos.js"></script>

<script src="<c:url value='/js/jquery.animateNumber.min.js'/>"></script>
<script src="<c:url value='/js/scrollax.min.js'/>"></script>
<script src="<c:url value='/js/main.js'/>"></script>
<script src="<c:url value='/views/jquery-3.7.1.js'/>"></script>






<!-- Bootstrap 5 CSS (CDN) -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">

<!-- Bootstrap 5 JS (CDN) -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js">
	
</script>

<!-- Summernote (BS5 버전) CSS/JS (로컬) -->
<link rel="stylesheet"
	href="<c:url value='/css/summernote/summernote-bs5.min.css'/>">
<script src="<c:url value='/css/summernote/summernote-bs5.min.js'/>">
	
</script>
<!-- Bootstrap 4 CSS (CDN) -->
<%-- <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

	<!-- Bootstrap 4 JS (CDN) -->
	<script type="text/javascript"
   		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js">
	</script>

	<!-- Summernote (BS4 버전) CSS/JS (로컬) -->
	<link rel="stylesheet"
      href="<c:url value='/css/summernote/summernote-bs4.min.css'/>">
	<script
 		src="<c:url value='/css/summernote/summernote-bs4.min.js'/>">
	</script> --%>

<!-- 부트스트랩 4 CSS -->
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	부트스트랩 4 JS
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
	섬머노트 CSS
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
	섬머노트 JS
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script> -->








</head>

<body>

	<div id="colorlib-page">
		<a class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>

		<aside id="colorlib-aside" role="complementary" class="js-fullheight">


			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="/">홈</a></li>
					<li><a href="/klassBoardList">클래스 게시판</a></li>
					<li><a href="/reviewBoard">리뷰 게시판</a></li>
					<c:choose>
						<c:when test="${empty account}">
							<li><a href="/accountCreateSelect">회원가입</a></li>
							<li><a href="/login">로그인</a></li>
							<li><a>게스트</a></li>
						</c:when>

						<c:when test="${account.accountGrade eq  'M'}">
							<li><a href="/memberMyPage">마이페이지</a></li>
							<li><a style="font-weight: bold;">${account.accountNickname}</a><a
								style="font-size: small;">(참여자)</a></li>
						</c:when>

						<c:when test="${account.accountGrade eq 'H' }">
							<li><a href="/hostMyPage">마이페이지</a></li>
							<li><a style="font-weight: bold;">${account.accountNickname}</a><a
								style="font-size: small;">(주최자)</a></li>
						</c:when>

						<c:when test="${account.accountGrade eq 'A' }">
							<li><a href="/adminPage">관리자 페이지</a></li>
							<li><a style="font-weight: bold;">관리자</a></li>
						</c:when>
					</c:choose>
					<c:if test="${not empty account}">
						<li><a href="/logout">로그아웃</a></li>
					</c:if>
				</ul>
			</nav>


			<!-- 왼쪽 네비게이션바 -->
			<div class="colorlib-footer">
				<h1 id="colorlib-logo" class="mb-4">
					<a href="https://namu.wiki/w/%EB%A1%9C%EC%BC%93%EB%8B%A8"
						style="background-color: #D1B5E0">Lumo Diem</a>
				</h1>

				<div class="mb-4">
					<h3>Subscribe for newsletter</h3>

					<form action="/" class="colorlib-subscribe-form">
						<div class="form-group d-flex">
							<input type="text" class="form-control"
								placeholder="Enter Email Address">
							<div class="icon">
								<span class="icon-paper-plane"></span>
							</div>
						</div>
					</form>

				</div>
				<p class="pfooter">
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					LumoDiem 원데이 클래스 <i class="icon-heart" aria-hidden="true"></i> by <a
						href="https://namu.wiki/w/%EB%A1%9C%EC%BC%93%EB%8B%A8"
						target="_blank">응애 로켓단</a>
				</p>
			</div>
		</aside>
	</div>












	<!-- 로더 -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>


	<script>
		document.addEventListener("DOMContentLoaded", function() {
			document.body.classList.add("loaded");
		});
	</script>
	<script type="module"
		src="https://unpkg.com/ionicons@latest/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@latest/dist/ionicons/ionicons.js"></script>

</body>
