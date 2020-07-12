package beans;

import java.sql.*;

public class Sellerdata {
	private String sellerid;
	private String user;
	private String pass;
	private String email;
	private String contact;
	private String address;
	private String gstnumber;
	private String shopname;
	private String pincode;
	private ResultSet rst;
	public String getSellerId() {
		return sellerid;
	}
	public void setSellerId(String sellerid) {
		this.sellerid = sellerid;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGstnumber() {
		return gstnumber;
	}
	public void setGstnumber(String gstnumber) {
		this.gstnumber = gstnumber;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public void save() {
		Database db=new Database();
		db.runOtherQuery("insert into sellers(sellerid,user,pass,email,contact,address,gstnumber,shopname,pincode) values('"+sellerid+"','"+user+"','"+pass+"','"+email+"','"+contact+"','"+address+"','"+gstnumber+"','"+shopname+"','"+pincode+"')");
	}
	public void update() {
		Database db=new Database();
		db.runOtherQuery("update sellers set user='"+user+"',pass='"+pass+"',email='"+email+"',contact='"+contact+"',address='"+address+"',gstnumber='"+gstnumber+"',shopname='"+shopname+"',pincode='"+pincode+"' where sellerid='"+sellerid+"'");
	}
	public void delete() {
		Database db=new Database();
		db.runOtherQuery("delete from sellers where sellerid="+sellerid);
		//db.runOtherQuery("delete from subcategory where catid="+request.getParameter("pid"));
	}
	public String[] getSingleRecord(int sellerid) {
		Database db=new Database();
		String s[]=new String[9];
		try {
			ResultSet rst=db.runSelectQuery("select * from sellers where sellerid='"+sellerid+"'");
			if(rst.next()) {
				for(int i=0;i<s.length;i++) {
					s[i]=rst.getString(i+1);
				}	
			}
			db.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	public String[][] getAllRecords() {
		Database db=new Database();
		String s[][]=null;
		try {
			rst=db.runSelectQuery("select count(*) from sellers");
			rst.next();
			int cnt=rst.getInt(1);
			s=new String[cnt][9];
			rst=db.runSelectQuery("select * from sellers");
			for(int i=0;rst.next();i++) {
				for(int j=0;j<9;j++) {
					s[i][j]=rst.getString(j+1);
				}	
			}
			db.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	public int getMaxSellerId() {
		Database db=new Database();
		int max=0;
		try {
			rst=db.runSelectQuery("select max(sellerid) from sellers");
			if(rst.next())
				max=rst.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return max+1;
	}

}
