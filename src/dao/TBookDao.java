
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import table.TBook;

public class TBookDao {

	//��ѯ���У��飩

	public ArrayList<TBook> findAll(){
		Connection con=null;
		PreparedStatement psta=null;
		ResultSet rs=null;
		ArrayList<TBook> list=new ArrayList<TBook>();
		String sql="select * from TBookView";
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			rs=psta.executeQuery();
			while(rs.next()){
				TBook obj=new TBook();
				obj.setISBN(rs.getString(1));
				obj.setName(rs.getString(2));
				obj.setWriter(rs.getString(3));
				obj.setPress(rs.getString(4));
				obj.setPublishedDate(rs.getString(5));
				obj.setPrice(rs.getFloat(9));
				obj.setCopyVolume(rs.getInt(7));
				obj.setInventory(rs.getInt(8));
				obj.setClassification(rs.getString(6));
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

	public boolean save(TBook obj){
		Connection con=null;
		PreparedStatement psta=null;
		String sql="insert into TBook values(?,?,?,?,?,?,?,?,?)";
		boolean flag=false;
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, obj.getISBN());
			psta.setString(2, obj.getName());
			psta.setString(3, obj.getWriter());
			psta.setString(4, obj.getPress());
			psta.setString(5, obj.getPublishedDate());
			psta.setFloat(9, obj.getPrice());
			psta.setInt(7, obj.getCopyVolume());
			psta.setInt(8, obj.getInventory());
			psta.setString(6, obj.getClassification());
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
	
	public boolean remove(String isbn){
		Connection con=null;
		PreparedStatement psta=null;
		boolean flag=false;
		String sql="delete from TBook where ISBN=?";
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
	//ͨ������ģ����ѯ
	public TBook findByName(String name){
		Connection con=null;
		PreparedStatement psta=null;
		ResultSet rs=null;
		TBook obj=null;
		String sql="select * from TBookView where ���� like ?";
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, "%"+name+"%");
			rs=psta.executeQuery();
			if(rs.next()){
				obj=new TBook();
				obj.setISBN(rs.getString(1));
				obj.setName(rs.getString(2));
				obj.setWriter(rs.getString(3));
				obj.setPress(rs.getString(4));
				obj.setPublishedDate(rs.getString(5));
				obj.setPrice(rs.getFloat(9));
				obj.setCopyVolume(rs.getInt(7));
				obj.setInventory(rs.getInt(8));
				obj.setClassification(rs.getString(6));
				
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
	
	//ͨ��isbn�޸ģ�Ϊ������׼���ģ��ģ�
		
			public TBook findById(String isbn){
				Connection con=null;
				PreparedStatement psta=null;
				ResultSet rs=null;
				TBook obj=null;
				String sql="select * from TBookView where ISBN=?";
				try{
					con=BaseDao.getConnection();
					psta=con.prepareStatement(sql);
					psta.setString(1, isbn);
					rs=psta.executeQuery();
					if(rs.next()){
						obj=new TBook();
						obj.setISBN(rs.getString(1));
						obj.setName(rs.getString(2));
						obj.setWriter(rs.getString(3));
						obj.setPress(rs.getString(4));
						obj.setPublishedDate(rs.getString(5));
						obj.setPrice(rs.getFloat(9));
						obj.setCopyVolume(rs.getInt(7));
						obj.setInventory(rs.getInt(8));
						obj.setClassification(rs.getString(6));
						
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

	public boolean update(TBook obj){
		Connection con=null;
		PreparedStatement psta=null;
		String sql="update TBook set ����=?,������=?,������=?,��������=?,�۸�=?,������=?,�����=?,�����=? where ISBN=?";
		boolean flag=false;
		try{
			con=BaseDao.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, obj.getName());
			psta.setString(2, obj.getWriter());
			psta.setString(3, obj.getPress());
			psta.setString(4,  obj.getPublishedDate());
			psta.setFloat(5, obj.getPrice());
			psta.setInt(6, obj.getCopyVolume());
			psta.setInt(7,obj.getInventory());
			psta.setString(8, obj.getClassification());
			psta.setString(9, obj.getISBN());
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

