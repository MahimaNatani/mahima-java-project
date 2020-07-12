package beans;
import java.sql.*;
public class PendingDetail 
{
private int order_id; 
private int product_id;
private int qty;
private int amount;
private int price;
private String shippingaddress;
public String getShippingaddress() {
	return shippingaddress;
}

public void setShippingaddress(String shippingaddress) {
	this.shippingaddress = shippingaddress;
}

public int getOrder_id() {
	return order_id;
}

public void setOrder_id(int order_id) {
	this.order_id = order_id;
}

public int getProduct_id() {
	return product_id;
}

public void setProduct_id(int product_id) {
	this.product_id = product_id;
}

public int getQty() {
	return qty;
}

public void setQty(int qty) {
	this.qty = qty;
}

public int getAmount() {
	return amount;
}

public void setAmount(int amount) {
	this.amount = amount;
}

public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}
 Database db=new Database();
	
	public ResultSet display(int id)
	{
			ResultSet rst=db.runSelectQuery(" select * from porders_det where order_id="+id);
			//db.close();
			return rst;
	}

}
