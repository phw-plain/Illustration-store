<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}

	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	ArrayList<Product> goodsList = dao.getAllProducts();
	// 전체 상품 리스트를 가져옴
	Product goods = new Product();
	for(int i = 0; i<goodsList.size(); i++){
		goods = goodsList.get(i);
		if(goods.getProductId().equals(id)){
			break; // 전체 상품 리스트와 장바구니에 담을 상품이 일치할 경우 멈춤
		}
	}
	
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	if(list == null){ // 장바구니 목록을 세션에 만든다.
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0;
	Product goodsQnt = new Product();
	for(int i = 0; i < list.size(); i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cnt++;// 주문 상품 개수 증가
			int orderQuantity = goodsQnt.getQuantity() + 1;
			// 주문 상품 시작이 1로 맞추기
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt == 0){
		goods.setQuantity(1);
		list.add(goods);
	} // 장바구니 안에 상품이 없는 상품일 경우 값을 1로 하여 추가
	
	response.sendRedirect("product.jsp?id="+id);
	// 원래 화면으로 복귀
	
%>