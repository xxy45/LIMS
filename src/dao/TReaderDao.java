
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import table.TReader;

public class TReaderDao {

	//查询所有（查）

	public ArrayList<TReader> findAll(){
		Connection con=null;
		PreparedStatement psta=null;
		ResultSet rs=null;
		ArrayList<TReader> list=new ArrayList<TReader>();
		String sql="select * from TReaderView";
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			rs=psta.executeQuery();
			while(rs.next()){
				TReader obj=new TReader();
				obj.setId(rs.getString(1));
				obj.setPassword(rs.getString(2));
				obj.setName(rs.getString(3));
				obj.setSex(rs.getBoolean(4));
				obj.setDate(rs.getDate(5));
				obj.setMajor(rs.getString(6));
				obj.setBorrow(rs.getInt(7));
				obj.setRemarks(rs.getString(8));
				obj.setPhone(rs.getString(9));
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

	public boolean save(TReader obj){
		Connection con=null;
		PreparedStatement psta=null;
		String sql="insert into TReader values(?,?,?,?,?,?,?,?,?)";
		boolean flag=false;
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, obj.getId());
			psta.setString(2, obj.getPassword());
			psta.setString(3, obj.getName());
			psta.setBoolean(4, obj.getSex());
			psta.setDate(5, (Date) obj.getDate());
			psta.setString(6, obj.getMajor());
			psta.setInt(7, obj.getBorrow());
			psta.setString(8, obj.getRemarks());
			psta.setString(9, obj.getPhone());
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
	
	public boolean remove(String id){
		Connection con=null;
		PreparedStatement psta=null;
		boolean flag=false;
		String sql="delete from TReaderView where 借书证号=?";
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, id);
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
	
	//通过名字模糊查询
		public TReader matchByName(String name){
			Connection con=null;
			PreparedStatement psta=null;
			ResultSet rs=null;
			TReader obj=null;
			String sql="select * from TReaderView where 姓名=?";
			try{
				con=BaseDao.getConnection();
				psta=con.prepareStatement(sql);
				psta.setString(1, "%"+name+"%");
				rs=psta.executeQuery();
				if(rs.next()){
					obj=new TReader();
					obj.setId(rs.getString(1));
					obj.setPassword(rs.getString(2));
					obj.setName(rs.getString(3));
					obj.setSex(rs.getBoolean(4));
					obj.setDate(rs.getDate(5));
					obj.setMajor(rs.getString(6));
					obj.setBorrow(rs.getInt(7));
					obj.setRemarks(rs.getString(8));
					obj.setPhone(rs.getString(9));
					
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
	//通过名字精确查找
	public TReader findByName(String name){
		Connection con=null;
		PreparedStatement psta=null;
		ResultSet rs=null;
		TReader obj=null;
		String sql="select * from TReaderView where 姓名=?";
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, name);
			rs=psta.executeQuery();
			if(rs.next()){
				obj=new TReader();
				obj.setId(rs.getString(1));
				obj.setPassword(rs.getString(2));
				obj.setName(rs.getString(3));
				obj.setSex(rs.getBoolean(4));
				obj.setDate(rs.getDate(5));
				obj.setMajor(rs.getString(6));
				obj.setBorrow(rs.getInt(7));
				obj.setRemarks(rs.getString(8));
				obj.setPhone(rs.getString(9));
				
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
	
	//通过id修改，为更新做准备的（改）
		
			public TReader findById(String id){
				Connection con=null;
				PreparedStatement psta=null;
				ResultSet rs=null;
				TReader obj=null;
				String sql="select * from TReaderView where 借书证号=?";
				try{
					con=BaseDao.getConnection();
					psta=con.prepareStatement(sql);
					psta.setString(1, id);
					rs=psta.executeQuery();
					if(rs.next()){
						obj=new TReader();
						obj.setId(rs.getString(1));
						obj.setPassword(rs.getString(2));
						obj.setName(rs.getString(3));
						obj.setSex(rs.getBoolean(4));
						obj.setDate(rs.getDate(5));
						obj.setMajor(rs.getString(6));
						obj.setBorrow(rs.getInt(7));
						obj.setRemarks(rs.getString(8));
						obj.setPhone(rs.getString(9));
						
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

	public boolean update(TReader obj){
		Connection con=null;
		PreparedStatement psta=null;
		String sql="update TReader set 密码=?,姓名=?,性别=?,出生时间=?,专业=?,借书量=?,备注=?,联系方式=? where 借书证号=?";
		boolean flag=false;
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, obj.getPassword());
			psta.setString(2, obj.getName());
			psta.setBoolean(3, obj.getSex());
			psta.setDate(4, (Date) obj.getDate());
			psta.setString(5, obj.getMajor());
			psta.setInt(6, obj.getBorrow());
			psta.setString(7,obj.getRemarks());
			psta.setString(8, obj.getPhone());
			psta.setString(9, obj.getId());
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

