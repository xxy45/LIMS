package dao;
import java.sql.*;
import java.util.ArrayList;

import table.Admin;
public class AdminDao {
	//查询所有（查）

		public ArrayList<Admin> findAll(){
			Connection con=null;
			PreparedStatement psta=null;
			ResultSet rs=null;
			ArrayList<Admin> list=new ArrayList<Admin>();
			String sql="select * from Admin";
			try{
				con=BaseDao.getConnection();
				psta=con.prepareStatement(sql);
				rs=psta.executeQuery();
				while(rs.next()){
					Admin obj=new Admin();
					obj.setAdmin(rs.getString(1));
					obj.setPassword(rs.getString(2));
					obj.setDescription(rs.getString(3));
					
					list.add(obj);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					BaseDao.close(rs, psta, con);
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}return list;
		}
		
		//插入方法（增）

		public boolean save(Admin obj){
			Connection con=null;
			PreparedStatement psta=null;
			String sql="insert into Admin values(?,?,?)";
			boolean flag=false;
			try{
				con=BaseDao.getConnection();
				psta=con.prepareStatement(sql);
				psta.setString(1, obj.getAdmin());
				psta.setString(2, obj.getPassword());
				psta.setString(3, obj.getDescription());
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
		
		//删除方法（删）
		
		public boolean remove(String ad){
			Connection con=null;
			PreparedStatement psta=null;
			boolean flag=false;
			String sql="delete from Admin where 管理员 =?";
			try{
				con=BaseDao.getConnection();
				psta=con.prepareStatement(sql);
				psta.setString(1, ad);
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
		
		//通过名字修改，为更新做准备的（改）
			
				public Admin findById(String ad){
					Connection con=null;
					PreparedStatement psta=null;
					ResultSet rs=null;
					Admin obj=null;
					String sql="select * from Admin where 管理员 =?";
					try{
						con=BaseDao.getConnection();
						psta=con.prepareStatement(sql);
						psta.setString(1, ad);
						rs=psta.executeQuery();
						if(rs.next()){
							obj=new Admin();
							obj.setAdmin(rs.getString(1));
							obj.setPassword(rs.getString(2));
							obj.setDescription(rs.getString(3));
						}
					}catch(Exception e){
						e.printStackTrace();
					}finally{
						try{
							BaseDao.close(rs, psta, con);
						}catch(Exception e){
							e.printStackTrace();
						}
					}return obj;
				}
		
		//更新方法（修改数据）（改）

		public boolean update(Admin obj){
			Connection con=null;
			PreparedStatement psta=null;
			String sql="update Admin set 管理员=?,密码=?,描述=? where 管理员=?";
			boolean flag=false;
			try{
				con=BaseDao.getConnection();
				psta=con.prepareStatement(sql);
				psta.setString(1, obj.getAdmin());
				psta.setString(2, obj.getPassword());
				psta.setString(3, obj.getDescription());
				psta.setString(4, obj.getAdmin());
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
