package mybatis.model;

import java.util.Date;

public class Basket {
	String title;
	String order_id;
	long type_code;
	String is_delivered; 
	String is_approved; 
	String in_cart;
	String in_order; 
	long price;
	long quantity;
	String product_id;
	
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getRecipient_name() {
		return recipient_name;
	}
	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}
	public String getRecipient_phone() {
		return recipient_phone;
	}
	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}
	public String getRecipient_address() {
		return recipient_address;
	}
	public void setRecipient_address(String recipient_address) {
		this.recipient_address = recipient_address;
	}
	String recipient_name;
	String recipient_phone;
	String recipient_address;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public long getType_code() {
		return type_code;
	}
	public void setType_code(long type_code) {
		this.type_code = type_code;
	}
	public String getIs_delivered() {
		return is_delivered;
	}
	public void setIs_delivered(String is_delivered) {
		this.is_delivered = is_delivered;
	}
	public String getIs_approved() {
		return is_approved;
	}
	public void setIs_approved(String is_approved) {
		this.is_approved = is_approved;
	}
	public String getIn_cart() {
		return in_cart;
	}
	public void setIn_cart(String in_cart) {
		this.in_cart = in_cart;
	}
	public String getIn_order() {
		return in_order;
	}
	public void setIn_order(String in_order) {
		this.in_order = in_order;
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
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

}
