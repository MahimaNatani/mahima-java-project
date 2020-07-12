package beans;
import java.sql.*;
public class Pendingorders {
	private String order_id;
	private String user;
	private String amount;
	private String shippingaddress;
	private ResultSet rst;
	Database db=new Database();
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public String getShippingaddress() {
		return shippingaddress;
	}
	public void setShippingaddress(String shippingaddress) {
		this.shippingaddress = shippingaddress;
	}
	public void update(String id)
	{
		db.runOtherQuery("update pendingorders set delivered=1 where order_id="+id);
		db.close();
	}
	public ResultSet display()
	{
			ResultSet rst=db.runSelectQuery(" select * from pendingorders where delivered=0");
			return rst;
	}

}
