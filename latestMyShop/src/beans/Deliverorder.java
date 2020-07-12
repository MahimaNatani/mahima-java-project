package beans;
import java.sql.*;
public class Deliverorder 
{
	
		private int order_id; 
		private String user;
		private int amount;
	Database db=new Database();
	
	public ResultSet display()
	{
			ResultSet rst=db.runSelectQuery(" select * from pendingorders where delivered=1");
			return rst;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

}
