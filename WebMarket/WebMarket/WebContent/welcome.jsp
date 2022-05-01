<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%! 
		String greeting = "일러스트 판매 사이트";
		String tagline = "환영합니다!";
	%>
	<div class="jumbotron" style="background-color: rgb(255,192,203);">
		<div class="container">
			<h3 class="display-3"><%= greeting %></h3>
		</div>
	</div>
	<main role = "main">
		<div class="container">
			<div class="text-center">
				<h3> <%= tagline %></h3>
			</div>
			<hr>
		</div>
	</main>
	<%@ include file="footer.jsp" %>	
</body>  
</html>