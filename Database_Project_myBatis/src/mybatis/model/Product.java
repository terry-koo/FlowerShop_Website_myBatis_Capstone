package mybatis.model;

public class Product {
	private long productVarietyCode;
	private String isAvailable;
	private long price;
	private String articleId;
	private String productId;
	
	
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
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
	
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}


}
