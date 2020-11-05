package mybatis.model;

import java.sql.Date;

public class CustomerInfo {
	private String customer_id;
	private int authority_code;
	private String name;
	private String email;
	private char gender;
	private Date birthday;
	private String address;
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public int getAuthority_code() {
		return authority_code;
	}
	public void setAuthority_code(int authority_code) {
		this.authority_code = authority_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		StringBuilder info = new StringBuilder();
		info.append("ID: "+customer_id+"\n");
		info.append("Authority_code: "+authority_code+"\n");
		info.append("Name: "+name+"\n");
		info.append("Email: "+email+"\n");
		info.append("Gender: "+gender+"\n");
		info.append("Birthday: "+birthday.toString()+"\n");
		info.append("Address: "+address+"\n");
		return info.toString();
		
	}
	
	public String toStringByHTML() {
		StringBuilder info = new StringBuilder();
		info.append("ID: "+customer_id+"<br>");
		info.append("Authority_code: "+authority_code+"<br>");
		info.append("Name: "+name+"<br>");
		info.append("Email: "+email+"<br>");
		info.append("Gender: "+gender+"<br>");
		info.append("Birthday: "+birthday.toString()+"<br>");
		info.append("Address: "+address+"<br>");
		return info.toString();
		
	}
	
}
