package beans;
import java.sql.*;
public class Forgotpass {
	private String user;
	private String pass;
	public void update(String user,String pass) {
	Database db=new Database();
	db.runOtherQuery("update users set pass='"+pass+"' where user='"+user+"'");
}
	public void update1(String user,String pass) {
	Database db=new Database();
	db.runOtherQuery("update sellers set pass='"+pass+"' where user='"+user+"'");
}
	public void update2(String user,String pass) {
	Database db=new Database();
	db.runOtherQuery("update buyers set pass='"+pass+"' where user='"+user+"'");
}
}
