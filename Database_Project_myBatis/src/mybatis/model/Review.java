package mybatis.model;

import java.sql.Date;

public class Review {
	private String review_id;
	private String customer_id;
	private String article_id;
	private String is_registered;
	private String content;
	private char stars;
	private Date registration_date;
	
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public String getIs_registered() {
		return is_registered;
	}
	public void setIs_registered(String is_registered) {
		this.is_registered = is_registered;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public char getStars() {
		return stars;
	}
	public void setStars(char stars) {
		this.stars = stars;
	}
	public Date getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(Date registration_date) {
		this.registration_date = registration_date;
	}
}
