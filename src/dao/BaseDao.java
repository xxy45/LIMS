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
                 //�رս����  
                rs.close();  
        }  
        if(sta!=null){  
                 //�رղ������  
                 sta.close();  
        }  
        if(con!=null){  
                //�ر�����  
                con.close();  
        }  
    }  
}  