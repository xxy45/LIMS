
<%@ page import="java.util.*,dao.TBookDao,table.TBook,java.sql.*" pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	String isbn=request.getParameter("isbn");
	String name=request.getParameter("name");
	String writer=request.getParameter("writer");
	String press = request.getParameter("press");
	
	String published_date = request.getParameter("published_date");
	String price = request.getParameter("price");
	String copy_volume = request.getParameter("count");
	String inventory = request.getParameter("count");
	String classification = request.getParameter("classification");
	
	
	TBook obj=new TBook();
	obj.setISBN(isbn);
	obj.setName(name);
	obj.setWriter(writer);
	obj.setPress(press);
	obj.setPublishedDate(published_date);
	obj.setPrice(Float.parseFloat(price));
	obj.setCopyVolume(Integer.parseInt(copy_volume));
	obj.setInventory(Integer.parseInt(inventory));
	obj.setClassification(classification);
	
	TBookDao dao=new TBookDao();
	dao.save(obj);
	
	//调用存储过程

	int count = Integer.parseInt(request.getParameter("count"));
	
	
	String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String user = session.getAttribute("name").toString();
	String password = session.getAttribute("password").toString();
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";
	
		
	
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		CallableStatement cs=null;
		con=DriverManager.getConnection(url, user, password);
		int first_id=10000;
		stmt=con.createStatement();
		rs= stmt.executeQuery("select count(*) from TBLend");
		if(rs.next()){
			first_id = rs.getInt(1);
			}
		rs.close();
		stmt.close();
		
		String s1="{CALL BookID_Generate(?,?,?)}";
		
		
		try{
			
			
			Class.forName(driverName);
			
		
			cs = con.prepareCall(s1);
			cs.setString(1, isbn); 
            cs.setInt(2, count);
            cs.setInt(3, first_id);    
     
            cs.execute();
			}
			
		catch(Exception e){
			e.printStackTrace();
		}
		con.close();
		
	
	
	
	
	response.sendRedirect("TBook_admin.jsp");
%>