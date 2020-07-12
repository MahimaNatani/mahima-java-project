package beans;
import java.sql.*;
public class Seller {
	private int sellerId;
	private String user;
	private String pass;
	private int contact;
	private String address;
	private int pincode;
	private String email;
	private String shopname;
	private String gstnumber;
	
	
	private ResultSet rst;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setSellerId(int sellerId) {
		sellerId = sellerId;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public void setGstnumber(String gstnumber) {
		this.gstnumber = gstnumber;
	}
	

	public int save() {
		Database db=new Database();
		sellerId = getMaxSellerId();
		int n= db.runOtherQuery("insert into sellers(sellerid,user,pass,contact,address,pincode,shopname,gstnumber) values("+sellerId+",'"+user+"','"+pass+"',"+contact+",'"+address+"',"+pincode+",'"+shopname+"',"+gstnumber+")");
		return n;
	}
	public void update() {
		Database db=new Database();
		db.runOtherQuery("update sellers set email='"+user+"', pass='"+pass+"',contact="+contact+",addrerss='"+address+"',pincode="+pincode+",shopname='"+shopname+"',gstnumber="+gstnumber+" where sellerid="+sellerId);
	}
	public void delete() {
		Database db=new Database();
		db.runOtherQuery("delete from sellers where sellerid="+sellerId);
		//db.runOtherQuery("delete from subcategory where sellerid="+request.getParameter("pid"));
	}
	public String[] getSingleRecord(int sellerId) {
		Database db=new Database();
		String s[]=new String[8];
		try {
			ResultSet rst=db.runSelectQuery("select * from sellers where sellerid="+sellerId);
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
			s=new String[cnt][8];
			rst=db.runSelectQuery("select * from sellers");
			for(int i=0;rst.next();i++) {
				for(int j=0;j<8;j++) {
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
	public int getSellerId(String user) {
		Database db=new Database();
		int sellerId=0;
		try {
			rst=db.runSelectQuery("select sellerid from sellers where user='"+user+"'");
			if(rst.next())
				sellerId=rst.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return sellerId;
	}
	public String getShopName(int sellerId) {
		Database db=new Database();
		String productName="";
		try {
			rst=db.runSelectQuery("select shopname from sellers where sellerid="+sellerId);
			if(rst.next())
				productName=rst.getString(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return productName;
	}
	public boolean validate() {
		Database db = new Database();
		boolean result=false;
		try {
			ResultSet rst = db.runSelectQuery("select * from sellers where user='"+user+"' && pass='"+pass+"'");
			if(rst.next()) {
				result=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
