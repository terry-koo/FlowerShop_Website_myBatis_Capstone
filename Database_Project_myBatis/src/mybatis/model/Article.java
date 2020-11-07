package mybatis.model;

import java.util.Date;

public class Article {
	private String articleId;
	private String customerId;
	private String title;
	private String content;
	private String isLinkedToProduct;
	private String isRegistered;
	private Date registrationDate;
	
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getisLinkedToProduct() {
		return isLinkedToProduct;
	}
	public void setisLinkedToProduct(String isLinkedToProduct) {
		this.isLinkedToProduct = isLinkedToProduct;
	}
	public String getIsRegistered() {
		return isRegistered;
	}
	public void setIsRegistered(String isRegistered) {
		this.isRegistered = isRegistered;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	
	
}
