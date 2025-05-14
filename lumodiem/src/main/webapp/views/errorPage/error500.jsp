<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 에러 발생</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
	body,html{height : 100%;}
	.img-fluid{height: 500px }
</style>
</head>
<body class="d-flex justify-content-center align-items-center">
	<div class="col-md-12 text-center">
		
			<a href="<c:url value='/'/>">
			<img src="<c:url value='/views/errorImgFolder/error500.jpg'/>" alt="500 Error Image" class="img-fluid">
			</a>
		
		<h1>500</h1>
		<h2>Page Servers Error</h2>
		<p>죄송합니다. 서버 내부 오류가 발생하였습니다.</p>
		<h2>🐥 병아리를 클릭하면 초기화면으로 돌아갑니다. 🐥</h2>
		
	</div>
</body>
</html>