package beans;
import java.sql.*;
import java.util.*;
import java.util.Date;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.io.output.*;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
public class Product {
	private int productId;
	private String productName;
	private String subcatId;
	private String price;
	private String description;
	private String quantity;
	private String imagename;
	private int sellerId;
	private ResultSet rst;
	private String user;
	
	public int getSellerId() {
		return sellerId;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public void setSubcatId(String subcatId) {
		this.subcatId = subcatId;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public ResultSet show()
	{		Database db=new Database();
			ResultSet rst=db.runSelectQuery("select * from products order by subcatid");
			return rst;
	}
	
	public void save() {
		Database db=new Database();
		Seller s1 = new Seller();
		//setSellerId(s1.getSellerId(getUser()));
		setProductId(getMaxProductId());
		String query = "insert into products(productid,productname,subcatid,price,description,qty,imagename,sellerid) values("+productId+",'"+productName+"',"+subcatId+","+price+",'"+description+"',"+quantity+",'"+imagename+"',"+sellerId+")";
		db.runOtherQuery(query);
	}
	public void update(int productId, String productName,int subcatId,int price,String description) {
		Database db=new Database();
		String query=null;
		if(imagename==null)
			query = "update products set productname='"+productName+"', subcatid="+subcatId+",price="+price+",description='"+description+"',qty="+quantity+" where productid="+productId;
		else
			query = "update products set productname='"+productName+"', subcatid="+subcatId+",price="+price+",description='"+description+"',qty="+quantity+",imagename='"+imagename+"'where productid="+productId;
		System.out.println(query);
		db.runOtherQuery(query);
	}
	public void update() {
		Database db=new Database();
		String query=null;
		if(imagename==null)
			query = "update products set productname='"+productName+"', subcatid="+subcatId+",price="+price+",description='"+description+"',qty="+quantity+" where productid="+productId;
		else
			query = "update products set productname='"+productName+"', subcatid="+subcatId+",price="+price+",description='"+description+"',qty="+quantity+",imagename='"+imagename+"'where productid="+productId;
		System.out.println(query);
		db.runOtherQuery(query);
	}
	public void delete(int productId) {
		Database db=new Database();
		db.runOtherQuery("delete from products where productid="+productId);
		//db.runOtherQuery("delete from subcategory where productid="+request.getParameter("pid"));
	}
	public String getItemName(int productId)
	{
		String s1="";
		try
		{	Database db=new Database();
			ResultSet rst=db.runSelectQuery("select productName from products where productid="+productId);
			rst.next();
			s1=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			
		}
		return s1;		
	}
	public String getCatName(int catId)
	{
		String s1="";
		try
		{	Database db=new Database();
			ResultSet rst=db.runSelectQuery("select catName from category where catId="+catId);
			rst.next();
			s1=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			
		}
		return s1;	
	}
	public String getSubCatName(int subCatId)
	{
		String s1="";
		try
		{	Database db=new Database();
			ResultSet rst=db.runSelectQuery("select subcatname from subcategory where subcatid="+subCatId);
			rst.next();
			s1=rst.getString(1);
			db.close();
		}
		catch(SQLException e)
		{
			
		}
		return s1;
	}
	public ResultSet getAllItemName()
	{	Database db=new Database();
		ResultSet rst;
		rst=db.runSelectQuery("select * from products");
		return rst;
	}
	public ResultSet getAllCatName()
	{	Database db=new Database();
		ResultSet rst;
		rst=db.runSelectQuery("select * from category");
		return rst;
	}
	public ResultSet getAllSubCatName()
	{	Database db=new Database();
		ResultSet rst;
		rst=db.runSelectQuery("select * from subcategory");
		return rst;
	}
	public String[] getSingleRecord(int productId) {
		Database db=new Database();
		String s[]=new String[8];
		try {
			ResultSet rst=db.runSelectQuery("select * from products where productid="+productId);
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
	
	public String[][] getAllRecords(String user) {
		Database db=new Database();
		Seller s1 = new Seller();
		String s[][]=null;
		String cntquery = null,query=null;
		try {
			if(user.equals("admin") || user.equals("buyer")) {
				cntquery = "select count(*) from products";
				query = "select * from products";
			}
			else {
				
				//setSellerId(s1.getSellerId(getUser()));
				cntquery = "select count(*) from products where sellerId="+sellerId;
				query = "select * from products where sellerId="+sellerId;
			}
			rst=db.runSelectQuery(cntquery);
			rst.next();
			int cnt=rst.getInt(1);
			s=new String[cnt][8];
			rst=db.runSelectQuery(query);
			for(int i=0;rst.next();i++) {
				for(int j=0;j<7;j++) {
					s[i][j]=rst.getString(j+1);
				}	
				s[i][7]=s1.getShopName(rst.getInt(8));
			}
			db.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	public int getMaxProductId() {
		Database db=new Database();
		int max=0;
		try {
			rst=db.runSelectQuery("select max(productid) from products");
			if(rst.next())
				max=rst.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		db.close();
		return max+1;
	}
	public int getProductId(String productName) {
		Database db=new Database();
		int productId=0;
		try {
			rst=db.runSelectQuery("select productid from products where productname='"+productName+"'");
			if(rst.next())
				productId=rst.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		db.close();
		return productId;
	}
	public String getProductName(int productId) {
		Database db=new Database();
		String productName="";
		try {
			rst=db.runSelectQuery("select productname from products where productid="+productId);
			if(rst.next())
				productName=rst.getString(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		db.close();
		return productName;
	}
	public void imageUpload(String realPath,HttpServletRequest request,int sellerid) {
		String itemname="",image="",dbpath="";
		Seller s = new Seller();
		Date d = new Date();
		long timestamp = d.getTime();
		String shopname = s.getShopName(sellerid);
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) 
		{		
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			try 
			{
				items = upload.parseRequest(request);
			} 
			catch (FileUploadException e) 
			{
				e.printStackTrace();
			}
			Iterator itr = items.iterator();
			while (itr.hasNext()) 
			{
				FileItem item = (FileItem) itr.next();
				if (!item.isFormField())
				{
					try 
					{
						image = item.getName();
						if(image.length()>0) {
							image=shopname+"-"+timestamp+image.substring(image.indexOf('.'),image.length());
	
							File savedFile = new File(realPath+"\\"+image);
							dbpath = "productimages/"+image;
							System.out.println(dbpath);
							setImagename(dbpath);
							item.write(savedFile);
						}
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
				}
				else
				{
					String fieldname = item.getFieldName();
					String fieldvalue = item.getString();
					
					if(fieldname.equals("pid"))
						setProductId(Integer.parseInt(fieldvalue));
					
					if(fieldname.equals("save"))
						continue;
					
					if(fieldname.equals("uname")){
						setUser(fieldvalue);
					}
					if(fieldname.equals("productname")){
						setProductName(fieldvalue);
					}
					if(fieldname.equals("subcatname")){
						setSubcatId(fieldvalue);
					}
					if(fieldname.equals("price")){
						setPrice(fieldvalue);
					}
					if(fieldname.equals("description")){
						setDescription(fieldvalue);
					}if(fieldname.equals("qty")){
						setQuantity(fieldvalue);
					}
				}
			}
		}
	}
	public String[][] getBrands() {
		Database db=new Database();
		String s[][]=null;
		try {
			ResultSet rst=db.runSelectQuery("select count(*) from brands");
			rst.next();
			int cnt=rst.getInt(1);
			s=new String[cnt][2];
			rst=db.runSelectQuery("select * from brands");
			for(int i=0;rst.next();i++) {
					s[i][0]=rst.getString(1);
					s[i][1]=rst.getString(2);
			}	
			db.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return s;
	}

}
