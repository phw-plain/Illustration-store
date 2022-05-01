<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="EUC-KR">
<title>��ǰ ����</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron" style="background-color: rgb(255,192,203);">
	<div class="container">
		<h1 class="display-3">��ǰ ����</h1> 
	</div>
</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String productId = request.getParameter("id");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if(rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="c:/upload/<%= rs.getString("p_fileName")%>" 
				alt="image" style="width:100%">
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp"
				class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">��ǰ �ڵ�</label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId"
							class="form-control" value="<%= rs.getString("p_id")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">��ǰ��</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name"
							class="form-control" value="<%= rs.getString("p_name")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">�� ����</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2" class="form-control">
								<%=rs.getString("p_description") %>
							</textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">������</label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer"
							class="form-control" value="<%= rs.getString("p_manufacturer")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">�з�</label>
						<div class="col-sm-3">
							<input type="text" name="category"
							class="form-control" value="<%= rs.getString("p_category")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">��� ��</label>
						<div class="col-sm-3">
							<input type="text" name="unitsInStock"
							class="form-control" value="<%= rs.getLong("p_unitsInStock")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">����</label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="New">�ű���ǰ
							<input type="radio" name="condition" value="Old">�߰���ǰ
							<input type="radio" name="condition" value="Refurbished">�����ǰ
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">�̹���</label>
						<div class="col-sm-5">
							<input type="file" name="productImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="���">
						</div>
					</div>
				</form>		
			</div>
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
<hr>
<jsp:include page="footer.jsp"/>
</body>
</html>