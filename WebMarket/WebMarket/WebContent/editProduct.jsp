<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="EUC-KR">
<title>��ǰ ����</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if(confirm("�ش� ��ǰ�� �����մϴ�!!") == true)
			location.href = "./deleteProduct.jsp?id=" + id;
		else 
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron" style="background-color: rgb(255,192,203);">
	<div class="container">
		<h1 class="display-3">��ǰ����</h1> 
	</div>
</div>
<div class="container">
	<div class="row" align="center">
		<%@ include file="dbconn.jsp" %>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
		%>
		<div class="col-md-4">
			<img src="c:/upload/<%= rs.getString("p_fileName")%>"
			style="width:100%">
			<h3><%= rs.getString("p_name") %></h3>
			<p><%= rs.getString("p_description") %></p>
			<p><%= rs.getString("p_UnitPrice") %>��</p>
			<p><%
				if(edit.equals("update")){
				%>
				<a href="./updateProduct.jsp?id=<%=rs.getString("p_id") %>"
				class="btn btn-success" role="button">���� &raquo;</a>
				<%
					} else if (edit.equals("delete")) {
				%>
				<a href="#" onclick="deleteConfirm('<%= rs.getString("p_id")%>')"
				class="btn btn-danger" role="button">���� &raquo;</a>
				<%
					}
				%>	
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
<jsp:include page="footer.jsp"/>
</body>
</html>