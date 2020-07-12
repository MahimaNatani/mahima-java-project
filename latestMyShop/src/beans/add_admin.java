package beans;
import java.sql.*;

public class add_admin {
	private String user;
	private String pass;
	private String email;
	private String contact;
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
	public void save() {
		Database db=new Database();
		db.runOtherQuery("insert into users(user,pass,email,contact) values('"+user+"','"+pass+"','"+email+"','"+contact+"')");
	}
	public void update() {
		Database db=new Database();
		db.runOtherQuery("update users set pass='"+pass+"',email='"+email+"',contact='"+contact+"' where user='"+user+"'");
	}
	public void delete() {
		Database db=new Database();
		db.runOtherQuery("delete from users where user='"+user+"'");
		//db.runOtherQuery("delete from subcategory where catid="+request.getParameter("pid"));
	}
	public String[] getSingleRecord(String user) {
		Database db=new Database();
		String s[]=new String[4];
		try {
			ResultSet rst=db.runSelectQuery("select * from users where user='"+user+"'");
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
			rst=db.runSelectQuery("select count(*) from users");
			rst.next();
			int cnt=rst.getInt(1);
			s=new String[cnt][4];
			rst=db.runSelectQuery("select * from users");
			for(int i=0;rst.next();i++) {
				for(int j=0;j<4;j++) {
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


