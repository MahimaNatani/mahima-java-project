package beans;
import java.sql.*;
public class DeliverDetail 
{
		private int order_id; 
		private int productid;
		private int qty;
		private int amount;
		private int price;
		
		public int getOrder_id() {
			return order_id;
		}
		public void setOrder_id(int order_id) {
			this.order_id = order_id;
		}
		public int getProductid() {
			return productid;
		}
		public void setProductid(int productid) {
			this.productid = productid;
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
		Database db =new Database();
	public ResultSet display(int id)
	{
			ResultSet rst=db.runSelectQuery(" select * from porders_det where order_id = "+id);
			return rst;
	}
}
