import mybatis.model.Product;
import mybatis.repository.session.SessionRepository;

public class TestProduct {
public static void main(String[] args) {
	
	
	int variety = 1; 
	String name = "zzzz";
	int price = 11;
	int quantity = 22;
	String available = "T";
	String imform = "imform";
	String text = "text";



	Product product = new Product();
	product.setVariety(variety);
	product.setIsAvailable(available);
	product.setName(name);
	product.setImform(imform);
	product.setText(text);
	product.setPrice(price);
	//////

	SessionRepository a = new SessionRepository();
	a.insertProduct(product);

	
}
}
