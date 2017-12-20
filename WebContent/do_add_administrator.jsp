
<%@ page import="java.util.*,java.sql.*,dao.*,table.*" pageEncoding="UTF-8" %>
<!-- 处理操作的页面，并非用于显示数据,所以无需任何HTML代码 -->
<%
	request.setCharacterEncoding("UTF-8");
	String admin_id=request.getParameter("admin_id");
	String admin_password=request.getParameter("password");
	String description=request.getParameter("description");
	String permissions = request.getParameter("permissions");
	
	Admin obj = new Admin(); 
	obj.setAdmin(admin_id);
	obj.setPassword(admin_password);
	obj.setDescription(description);
	AdminDao dao = new AdminDao();
	dao.save(obj);
	Connection con=null;
	Statement stmt=null;

	String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String user = "admin";
	String password = "123123";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";

	Class.forName(driverName);

	con=DriverManager.getConnection(url, user, password);
	con.setAutoCommit(false);
	stmt=con.createStatement();
	String s1 = "create login "+admin_id+" with password='"+admin_password+"', default_database=MBOOK";
	String s2 = "create user "+admin_id+" for login "+admin_id+" with default_schema=dbo";
	String s3 = "insert into Admin values("+admin_id+","+admin_password+","+description+")";
	String s4 = null;
	String s5 = null;
	String s6 = null;
	String s7 = null;
	String s8 = null;
	if(permissions.equals("Select")){
		s4 = "use MBOOK grant select on TBook to "+admin_id;
		s5 = "use MBOOK grant all privileges on TReader to "+admin_id;
		s6 = "use MBOOK grant all privileges on TLend to "+admin_id;
		s7 = "use MBOOK grant all privileges on HLend to "+admin_id;
		s8 = "use MBOOK grant all privileges on TBLend to "+admin_id;
	}
	if(permissions.equals("All")){
		s4 = "use MBOOK grant all privileges on TBook to "+admin_id;
		s5 = "use MBOOK grant all privileges on TReader to "+admin_id;
		s6 = "use MBOOK grant all privileges on TLend to "+admin_id;
		s7 = "use MBOOK grant all privileges on HLend to "+admin_id;
		s8 = "use MBOOK grant all privileges on TBLend to "+admin_id;
		}
	stmt.addBatch(s1);
	stmt.addBatch(s2);
	//stmt.addBatch(s3);
	stmt.addBatch(s4);
	stmt.addBatch(s5);
	stmt.addBatch(s6);
	stmt.addBatch(s7);
	stmt.addBatch(s8);
	
	stmt.executeBatch();
	con.commit(); //事务提交
	//恢复自动提交模式

	con.setAutoCommit(true);
	stmt.close();
	
	
	response.sendRedirect("common/doview.jsp");
%>


