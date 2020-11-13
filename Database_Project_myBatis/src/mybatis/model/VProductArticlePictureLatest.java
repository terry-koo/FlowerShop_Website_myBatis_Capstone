package mybatis.model;

import java.util.Date;

public class VProductArticlePictureLatest {
		private long product_variety_code; 
		private String is_available;
		private String product_id;
		private long price;
		private String article_id; 
		private String customer_id; 
		private String title;
		private String content; 
		private String is_linked_to_product; 
		private String is_registered;
		private Date registration_date; 
		
		public long getProduct_variety_code() {
			return product_variety_code;
		}
		public void setProduct_variety_code(long product_variety_code) {
			this.product_variety_code = product_variety_code;
		}
		public String getIs_available() {
			return is_available;
		}
		public void setIs_available(String is_available) {
			this.is_available = is_available;
		}
		public String getProduct_id() {
			return product_id;
		}
		public void setProduct_id(String product_id) {
			this.product_id = product_id;
		}
		public long getPrice() {
			return price;
		}
		public void setPrice(long price) {
			this.price = price;
		}
		public String getArticle_id() {
			return article_id;
		}
		public void setArticle_id(String article_id) {
			this.article_id = article_id;
		}
		public String getCustomer_id() {
			return customer_id;
		}
		public void setCustomer_id(String customer_id) {
			this.customer_id = customer_id;
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
		public String getIs_linked_to_product() {
			return is_linked_to_product;
		}
		public void setIs_linked_to_product(String is_linked_to_product) {
			this.is_linked_to_product = is_linked_to_product;
		}
		public String getIs_registered() {
			return is_registered;
		}
		public void setIs_registered(String is_registered) {
			this.is_registered = is_registered;
		}
		public Date getRegistration_date() {
			return registration_date;
		}
		public void setRegistration_date(Date registration_date) {
			this.registration_date = registration_date;
		}
		public String getPicture_id() {
			return picture_id;
		}
		public void setPicture_id(String picture_id) {
			this.picture_id = picture_id;
		}
		public String getPicture() {
			return picture;
		}
		public void setPicture(String picture) {
			this.picture = picture;
		}
		private String picture_id; 
		private String picture;
}
