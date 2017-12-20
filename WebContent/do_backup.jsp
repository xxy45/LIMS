<%@ page import="java.util.*,dao.TBookDao,table.TBook,java.sql.*" pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
/* String user = "admin";
String password = "123123"; */
String user = session.getAttribute("name").toString();
String password = session.getAttribute("password").toString();
String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";

	

Connection con=null;
PreparedStatement stmt=null;
ResultSet rs=null;
	con=DriverManager.getConnection(url, user, password);
	String sql="BACKUP DATABASE MBOOK TO DISK ='E:/MBOOK.bak'";
    stmt=con.prepareStatement(sql);

	
	
	stmt.execute();
	
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h5>备份成功!</h5>
</body>
</html>