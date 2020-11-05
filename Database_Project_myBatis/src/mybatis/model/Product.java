package mybatis.model;

public class Product {
	private long productVarietyCode;
	private String isAvailable;
	private String name;
	private String imform;
	private String text;
	private int variety;
	
	
	public int getVariety() {
		return variety;
	}
	public void setVariety(int variety) {
		this.variety = variety;
	}
	private long price;
	private long quantity;
	
	
	public long getProductVarietyCode() {
		return productVarietyCode;
	}
	public void setProductVarietyCode(long productVarietyCode) {
		this.productVarietyCode = productVarietyCode;
	}
	public String getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImform() {
		return imform;
	}
	public void setImform(String imform) {
		this.imform = imform;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public long getQuantity() {
		return quantity;
	}
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

}
