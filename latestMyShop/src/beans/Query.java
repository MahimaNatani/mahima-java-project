package beans;
import java.sql.*;
public class Query {
private String mail_id;
private String query;
private String id;
private ResultSet rst;
public String getMail_id() {
	return mail_id;
}
public void setMail_id(String mail_id) {
	this.mail_id = mail_id;
}
public String getQuery() {
	return query;
}
public void setQuery(String query) {
	this.query = query;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}

public ResultSet display()
{
	Database db=new Database();
		ResultSet rst=db.runSelectQuery(" select * from inbox where response is not null");
		return rst;
}
}
