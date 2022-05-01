package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts =
			new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P0002", "노란이미지", 1500);
		phone.setDescription("20시즌 한정 상품입니다.");
		phone.setCategory("이미지");
		phone.setManufacturer("adobe");
		phone.setUnitsInStock(100000);
		phone.setCondition("New");
		phone.setFilename("2021_5월_01PC1.png");
		
		Product notebook = new Product("P1235", "LG PC gram", 1500000);
		notebook.setDescription("13.3-inch, IPS LED Display, "
				+ "5rd Generation Intel Core Processors");
		notebook.setCategory("NoteBook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, Super Amoled display, "
				+ "Octa-Core Processors");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);			
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null
					&& product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}		
		return productById;
	}
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}

}
















