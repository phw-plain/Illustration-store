<%@ page contentType="text/html; charset=utf-8" %>
<script src="https://kit.fontawesome.com/f4dacc2b8e.js" crossorigin="anonymous"></script>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./welcome.jsp"><i class="fas fa-home"></i></a>
		</div>		
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="./products.jsp">상품 목록</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./addProduct.jsp">상품 등록</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./editProduct.jsp?edit=update">상품 수정</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./editProduct.jsp?edit=delete">상품 삭제</a>
				</li>
			</ul>
		</div>
	</div>
</nav>