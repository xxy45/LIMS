package dao;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.Statement;  
  
public class BaseDao {  
    public static Connection getConnection()throws Exception{  
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";      
		return DriverManager.getConnection(url, "admin", "123123");  
    }  
      
    public static void close(ResultSet rs,Statement sta,Connection con)throws Exception{  
        if(rs!=null){  
                 //关闭结果集  
                rs.close();  
        }  
        if(sta!=null){  
                 //关闭操作句柄  
                 sta.close();  
        }  
        if(con!=null){  
                //关闭链接  
                con.close();  
        }  
    }  
}  