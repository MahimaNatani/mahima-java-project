package myshop;
import beans.Database;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.Database;

public class CommonMethods {
	public static void createAllTables() {
		try {
			Database db=new Database();
			db.runOtherQuery("create table if not exists users(user varchar(20) primary key,pass varchar(20),email varchar(255),contact varchar(255))");			
			ResultSet rst=db.runSelectQuery("select count(*) from users");
			rst.next();
			int cnt=rst.getInt(1);
			db.close();
			if(cnt==0)
				db.runOtherQuery("insert into users(user,pass) values('admin','admin')");
			db.runOtherQuery("create table if not exists buyers(user varchar(20) primary key,pass varchar(20),email varchar(255),contact varchar(255),address varchar(255),pincode varchar(6))");
			db.runOtherQuery("create table if not exists sellers(sellerid int primary key,user varchar(20) unique key,pass varchar(20),email varchar(255),contact varchar(255),address varchar(255),gstnumber varchar(20),shopname varchar(255),pincode varchar(6))");
			db.runOtherQuery("create table if not exists category(catid int primary key,catname varchar(50))");
			db.runOtherQuery("create table if not exists subcategory(subcatid int primary key,subcatname varchar(50),catid int)");
			db.runOtherQuery("create table if not exists products(productid int primary key,productname varchar(50),subcatid int,price int,description varchar(255),qty int,imagename varchar(255),sellerid int)");
			db.runOtherQuery("create table if not exists inbox(mail_id varchar(40),query varchar(255),id int primary key,response varchar(200))");
			db.runOtherQuery("create table if not exists pendingorders(order_id int primary key auto_increment, user char(10),amount int,delivered int,shippingaddress varchar(255))");
			db.runOtherQuery("create table if not exists porders_det(order_id int , productid int ,qty int, price int, amount int,shippingaddress varchar(255))");
			db.runOtherQuery("create table if not exists brands(brandid int primary key, brandname varchar(255))");
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
