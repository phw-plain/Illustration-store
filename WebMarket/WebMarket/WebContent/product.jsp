<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
	
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron" style="background-color: rgb(255,192,203);">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>	
	</div>
	<%
		String id = request.getParameter("id");
	%>
	<div class="container">
		<div class="row">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM product WHERE p_id = '" + id+"'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
			%>
			<div class="col-md-5">
				<img src="C:/upload/<%=rs.getString("p_fileName") %>" style="width:100%">
			</div>	
			<div class="col-md-6">
				<h3><%= rs.getString("p_name") %></h3>
				<p><%= rs.getString("p_description")%></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger">
				<%=rs.getString("p_id")%></span>
				<p><b>제조사</b> : <%=rs.getString("p_manufacturer")%>
				<p><b>분류</b> : <%=rs.getString("p_category")%>
				<p><b>재고 수</b> : <%=rs.getString("p_unitsInStock")%>
				<h4><%= rs.getString("p_UnitPrice")%>원</h4>	
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()">상품주문&raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary">
					상품목록 &raquo;</a>
				</form>
			</div>		
			<%
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			%>	
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>	
</body>
</html>