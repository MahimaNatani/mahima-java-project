package beans;
import java.sql.*;
public class Buyer {
	private String user;
	private String pass;
	private String email;
	private String contact;
	private String address;
	private String pincode;
	private ResultSet rst;
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
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public void delete() {
		Database db=new Database();
		db.runOtherQuery("delete from buyers where user='"+user+"'");
		//db.runOtherQuery("delete from subcategory where catid="+request.getParameter("pid"));
	}
	public String[][] getAllRecords() {
		Database db=new Database();
		String s[][]=null;
		try {
			rst=db.runSelectQuery("select count(*) from buyers");
			rst.next();
			int cnt=rst.getInt(1);
			s=new String[cnt][6];
			rst=db.runSelectQuery("select * from buyers");
			for(int i=0;rst.next();i++) {
				for(int j=0;j<6;j++) {
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

}
