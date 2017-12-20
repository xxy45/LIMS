<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*,dao.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String isbn = request.getParameter("isbn");
	String id = session.getAttribute("id").toString();
	
	Connection con = null;
	PreparedStatement psta=null;
	ResultSet rs = null;
	String sql = "select 图书ID from TBLend where ISBN= ?";
	ArrayList list=new ArrayList();
	
		con=BaseDao.getConnection();
		psta=con.prepareStatement(sql);
		psta.setString(1, isbn);
		rs=psta.executeQuery();
		while(rs.next()){
			String bookid=rs.getString(1);
			list.add(bookid);
		}
		
	
			BaseDao.close(rs, psta, con);
		
	
	//存储过程
	int a=0;
	String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String user = "admin";
	String password = "123123";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";
	for(int i=0;i<list.size();i++){
		String book_id=list.get(i).toString();
		
		Connection con1 = null;
		CallableStatement cs=null;
		
		String s1="{?=CALL Book_Borrow(?,?,?,?)}";
		
		
		try{
			
			
			Class.forName(driverName);
			
			con1=DriverManager.getConnection(url, user, password);
			cs = con1.prepareCall(s1);
			cs.registerOutParameter(1,java.sql.Types.INTEGER);
            cs.setString(2, id);
            cs.setString(3, isbn);    
            cs.setString(4, book_id);    
            cs.registerOutParameter(5,java.sql.Types.NVARCHAR);
            cs.execute();
           	a = cs.getInt(1);
            
				
			}
			
		catch(Exception e){
			e.printStackTrace();
		}
		
		if(a==1) {
			break;
		}
		
	}
	if(a==1) response.sendRedirect("borrow_success.jsp");
	else response.sendRedirect("common/TBook.jsp");
	
%>




