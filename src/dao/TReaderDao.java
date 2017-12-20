
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import table.TReader;

public class TReaderDao {

	//��ѯ���У��飩

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
	
	//���뷽��������

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
	
	//ɾ��������ɾ��
	
	public boolean remove(String id){
		Connection con=null;
		PreparedStatement psta=null;
		boolean flag=false;
		String sql="delete from TReaderView where ����֤��=?";
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
	
	//ͨ������ģ����ѯ
		public TReader matchByName(String name){
			Connection con=null;
			PreparedStatement psta=null;
			ResultSet rs=null;
			TReader obj=null;
			String sql="select * from TReaderView where ����=?";
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
	//ͨ�����־�ȷ����
	public TReader findByName(String name){
		Connection con=null;
		PreparedStatement psta=null;
		ResultSet rs=null;
		TReader obj=null;
		String sql="select * from TReaderView where ����=?";
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
	
	//ͨ��id�޸ģ�Ϊ������׼���ģ��ģ�
		
			public TReader findById(String id){
				Connection con=null;
				PreparedStatement psta=null;
				ResultSet rs=null;
				TReader obj=null;
				String sql="select * from TReaderView where ����֤��=?";
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
	
	//���·������޸����ݣ����ģ�

	public boolean update(TReader obj){
		Connection con=null;
		PreparedStatement psta=null;
		String sql="update TReader set ����=?,����=?,�Ա�=?,����ʱ��=?,רҵ=?,������=?,��ע=?,��ϵ��ʽ=? where ����֤��=?";
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

