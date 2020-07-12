package beans;

import java.sql.*;

public class Category {
	private int catId;
	private String catName;
	private ResultSet rst;
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public void save() {
		Database db=new Database();
		db.runOtherQuery("insert into category(catid,catname) values("+catId+",'"+catName+"')");
	}
	public void update() {
		Database db=new Database();
		db.runOtherQuery("update category set catname='"+catName+"' where catid="+catId);
	}
	public void delete() {
		Database db=new Database();
		db.runOtherQuery("delete from category where catid="+catId);
		//db.runOtherQuery("delete from subcategory where catid="+request.getParameter("pid"));
	}
	public String[] getSingleRecord(int catId) {
		Database db=new Database();
		String s[]=new String[2];
		try {
			ResultSet rst=db.runSelectQuery("select * from category where catid="+catId);
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
			rst=db.runSelectQuery("select count(*) from category");
			rst.next();
			int cnt=rst.getInt(1);
			s=new String[cnt][2];
			rst=db.runSelectQuery("select * from category");
			for(int i=0;rst.next();i++) {
				for(int j=0;j<2;j++) {
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
	public int getMaxCategoryId() {
		Database db=new Database();
		int max=0;
		try {
			rst=db.runSelectQuery("select max(catid) from category");
			if(rst.next())
				max=rst.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return max+1;
	}
	public int getCategoryId(String catName) {
		Database db=new Database();
		int catId=0;
		try {
			rst=db.runSelectQuery("select catid from category where catname='"+catName+"'");
			if(rst.next())
				catId=rst.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return catId;
	}
	public String getCategoryName(int catId) {
		Database db=new Database();
		String catName="";
		try {
			rst=db.runSelectQuery("select catname from category where catid="+catId);
			if(rst.next())
				catName=rst.getString(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return catName;
	}	
}
