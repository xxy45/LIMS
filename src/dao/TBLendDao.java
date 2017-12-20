package dao;
import java.util.ArrayList;
import java.util.List;

import table.TBLend;

import java.sql.*;


public class TBLendDao {
	public List<TBLend> getTBLend() {
		List<TBLend> TBLend_list = new ArrayList<TBLend>();
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String user = "admin";
		String password = "123123";
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";
		try {
			
			try {
            	Class.forName(driverName);
			} catch (ClassNotFoundException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			
            con=DriverManager.getConnection(url, user, password);
            
            stmt=con.createStatement();
            
            String sql = "select * from TBLend order by 图书ID";
            rs=stmt.executeQuery(sql);
            
            
            while(rs.next())
            {
            	String book_id=rs.getString("图书ID");
                String book_isbn=rs.getString("ISBN");
                boolean isLend=rs.getBoolean("是否借出");
               
                TBLend bl=new TBLend(book_id,book_isbn,isLend);
                TBLend_list.add(bl);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            //System.out.println(123);
        }finally
        {
            try {
                if(rs!=null)
                {
                    rs.close();
                }
                if(stmt!=null)
                {
                    stmt.close();
                }
                if(con!=null)
                {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		
		return TBLend_list;
	}
}
