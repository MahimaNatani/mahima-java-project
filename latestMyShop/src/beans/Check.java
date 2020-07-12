package beans;

import java.sql.*;

public class Check {
	private String  user; 
	private String  pass;
	private String email;
	private String contact;
	private String address;
	private String pincode;
	Database db=new Database();
	public void add(String user,String pass,String email,String contact,String address,String pincode)
	{
		db.runOtherQuery("insert into buyers values('"+user+"','"+pass+"','"+email+"','"+contact+"','"+address+"','"+pincode+"')");
		db.close();
	}
	public ResultSet getAllName()
	{
		ResultSet rst=db.runSelectQuery("select * from  buyers");
		return rst;
	}
}

