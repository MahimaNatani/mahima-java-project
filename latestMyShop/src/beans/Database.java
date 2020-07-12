package beans;
import java.sql.*;
public class Database {
	private Connection conn;
	private Statement stmt;
	private ResultSet rst;
	private int cnt;
	void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/myshop","root","root");
			stmt=conn.createStatement();
		}
		catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	public ResultSet runSelectQuery(String selectQuery) {
		rst=null;
		try {
			connect();
			rst=stmt.executeQuery(selectQuery);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return rst;
	}
	public int runOtherQuery(String otherQuery) {
		cnt=0;
		try {
			connect();
			cnt=stmt.executeUpdate(otherQuery);
			close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public void close() {
		try {
			if(stmt!=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
