<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron" style="background-color: rgb(255,192,203);">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>	
	</div>
	<div class="container">
		<a id="cate" href="./products_New.jsp" class="btn btn-secondary" role="button">신규 제품</a>
		<a id="cate" href="./products_Old.jsp" class="btn btn-secondary" role="button">중고 제품</a>
		<a id="cate" href="./products_Refurbished.jsp" class="btn btn-secondary" role="button">재생 제품</a>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM product WHERE p_condition = '" +"Old"+"'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
			%>
			<div class="col-md-4">
				<img src="C:/upload/<%=rs.getString("p_fileName") %>" style="width:100%">
				<h3><%= rs.getString("p_name") %></h3>
				<p><%= rs.getString("p_description")%></p>
				<p><%= rs.getString("p_UnitPrice")%>원</p>
				<p> <a href="./product.jsp?id=<%=rs.getString("p_id")%>"
					class="btn btn-secondary" role="button"> 상세 정보&raquo;</a>
			</div>
			<%
				}
				
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
	<jsp:include page="footer.jsp" />	
</body>
</html>