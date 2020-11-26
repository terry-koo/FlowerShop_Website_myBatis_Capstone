package mybatis.model;

import java.sql.Date;

public class OrderInfoForAdmin {
	private String order_id;
	private String customer_id;
	private char is_delivered;
	private char is_approved;
	private char in_cart;
	private char in_order;
	private int price;
	private int quantity;
	private String request_comment;
	private Date order_date;
	private String recipient_name;
	private String recipient_address;
	private String recipient_phone;
	private String product_variety_name;
	private String title;
	private String type_name;
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public char getIs_delivered() {
		return is_delivered;
	}
	public void setIs_delivered(char is_delivered) {
		this.is_delivered = is_delivered;
	}
	public char getIs_approved() {
		return is_approved;
	}
	public void setIs_approved(char is_approved) {
		this.is_approved = is_approved;
	}
	public char getIn_cart() {
		return in_cart;
	}
	public void setIn_cart(char in_cart) {
		this.in_cart = in_cart;
	}
	public char getIn_order() {
		return in_order;
	}
	public void setIn_order(char in_order) {
		this.in_order = in_order;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getRequest_comment() {
		return request_comment;
	}
	public void setRequest_comment(String request_comment) {
		this.request_comment = request_comment;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getRecipient_name() {
		return recipient_name;
	}
	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}
	public String getRecipient_address() {
		return recipient_address;
	}
	public void setRecipient_address(String recipient_address) {
		this.recipient_address = recipient_address;
	}
	public String getRecipient_phone() {
		return recipient_phone;
	}
	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}
	public String getProduct_variety_name() {
		return product_variety_name;
	}
	public void setProduct_variety_name(String product_variety_name) {
		this.product_variety_name = product_variety_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	
	
}
