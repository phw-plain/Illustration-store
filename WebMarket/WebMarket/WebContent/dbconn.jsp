<%@ page import="java.sql.*" %>

<%
	Connection conn = null; 

	try {
		String url = "jdbc:mysql://localhost:3306/marketdb?serverTimezone=Asia/Seoul&useSSL=false";
		String user = "root";
		String password = "9752";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
	} catch(SQLException ex) {
		out.println("데이터베이스 연결이 실패 했습니다<br>");
		out.println("SQLException : " + ex.getMessage());
	}
%>