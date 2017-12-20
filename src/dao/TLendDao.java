package dao;
import java.sql.*;

public class TLendDao {
	//É¾³ý·½·¨£¨É¾£©
	
		public boolean remove(String isbn){
			Connection con=null;
			PreparedStatement psta=null;
			boolean flag=false;
			String sql="delete from TLend where ISBN=?";
			try{
				con=BaseDao.getConnection();
				psta=con.prepareStatement(sql);
				psta.setString(1, isbn);
				flag=psta.executeUpdate()>0;
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					BaseDao.close(null, psta, con);
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}return flag;
		}
}
