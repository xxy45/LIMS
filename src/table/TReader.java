package table;

import java.util.Date;

public class TReader {
	private String id,password,name,major,remarks,phone;
	private Date date;
	private boolean sex;
	private int borrow;
	
	public String getId() {	return id;	}
	public String getPassword() { return password;}
	public String getName() {return name;}
	public String getMajor() {return major;}
	public String getRemarks() {return remarks;}
	public String getPhone(){return phone;}
	public boolean getSex() {return sex;}
	public Date getDate() {return date;}
	public int getBorrow() {return borrow;}
	
	public void setId(String id) {this.id = id;	}
	public void setPassword(String password) {this.password = password;	}
	public void setName(String name) {this.name = name;	}
	public void setMajor(String major) {this.major = major;	}
	public void setRemarks(String remarks) {this.remarks = remarks;	}
	public void setPhone(String phone) {this.phone = phone;}
	public void setSex(boolean sex) {this.sex = sex;}
	public void setDate(Date date) {this.date =date;}
	public void setBorrow(int borrow) {this.borrow = borrow;}
	
	
	
}
