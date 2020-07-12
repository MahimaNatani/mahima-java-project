package beans;

import java.sql.*;

public class SubCategory {
	private int subCatId;
	private String subCatName;
	private String catId;
	private ResultSet rst;
	public int getSubCatId() {
		return subCatId;
	}
	public void setSubCatId(int subCatId) {
		this.subCatId = subCatId;
	}
	public String getSubCatName() {
		return subCatName;
	}
	public void setSubCatName(String subCatName) {
		this.subCatName = subCatName;
	}
	public String getCatId() {
		return catId;
	}
	public void setCatId(String catId) {
		this.catId = catId;
	}
	
	public void save() {
		Database db=new Database();
		setSubCatId(getMaxSubCategoryId());
		db.runOtherQuery("insert into subcategory(subcatid,subcatname,catid) values("+subCatId+",'"+subCatName+"','"+catId+"')");
	}
	public void update() {
		Database db=new Database();
		String query = "update subcategory set subcatname='"+subCatName+"',catid='"+catId+"' where subcatid="+subCatId+"";
		db.runOtherQuery(query);
	}
	public void delete() {
		Database db=new Database();
		db.runOtherQuery("delete from subcategory where subcatid='"+subCatId+"'");
		//db.runOtherQuery("delete from subcategory where catid="+request.getParameter("pid"));
	}
	public String[] getSingleRecord(int SubCatId) {
		Database db=new Database();
		Category c = new Category();
		String s[]=new String[3];
		try {
			ResultSet rst=db.runSelectQuery("select * from subcategory where subcatid="+SubCatId+"");
			if(rst.next()) {
				for(int i=0;i<s.length-1;i++) {
					s[i]=rst.getString(i+1);
				}	
				s[2] = c.getCategoryName(rst.getInt(3));
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
		Category c = new Category();
		try {
			rst=db.runSelectQuery("select count(*) from subcategory");
			rst.next();
			int cnt=rst.getInt(1);
			s=new String[cnt][3];
			rst=db.runSelectQuery("select * from subcategory");
			for(int i=0;rst.next();i++) {
				for(int j=0;j<3;j++) {
					s[i][j]=rst.getString(j+1);
				}	
				s[i][2] = c.getCategoryName(rst.getInt(3));
			}
			db.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	public int getMaxSubCategoryId() {
		Database db=new Database();
		int max=0;
		try {
			rst=db.runSelectQuery("select max(subcatid) from subcategory");
			if(rst.next())
				max=rst.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return max+1;
	}
	public String getSubCategoryId(String subCatName) {
		Database db=new Database();
		String subCatId="";
		try {
			rst=db.runSelectQuery("select subcatid from subcategory where subcatname='"+subCatName+"'");
			if(rst.next())
				subCatId=rst.getString(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return subCatId;
	}
	public String getSubCategoryName(String subCatId) {
		Database db=new Database();
		String subCatName="";
		try {
			rst=db.runSelectQuery("select subcatname from subcategory where subcatid='"+subCatId+"'");
			if(rst.next())
				subCatName=rst.getString(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return subCatName;
	}	
	public String[][] getAllSubCategory() {
		Database db=new Database();
		String s[][]=null;
		try {
			ResultSet rst=db.runSelectQuery("select count(*) from subcategory");
			rst.next();
			int cnt=rst.getInt(1);
			s=new String[cnt][2];
			rst=db.runSelectQuery("select subcatid,subcatname from subcategory");
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
	public String[][] getAllSubCategoryByCatId(int catId) {
		Database db=new Database();
		String s[][]=null;
		try {
			ResultSet rst=db.runSelectQuery("select count(*) from subcategory where catid="+catId);
			rst.next();
			int cnt=rst.getInt(1);
			s=new String[cnt][2];
			rst=db.runSelectQuery("select subcatid,subcatname from subcategory where catid="+catId);
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
