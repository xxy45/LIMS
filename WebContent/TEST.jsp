<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

request.setCharacterEncoding("UTF-8");

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
String s1 = "create login ccc with password='123', default_database=MBOOK";
String s2 = "create user ccc for login ccc with default_schema=dbo";
String s3 = "use MBOOK grant select on TBook to ccc";
String s4 = "insert into Admin values(?,?,?)";

stmt.addBatch(s1);
stmt.addBatch(s2);
stmt.addBatch(s3);
stmt.addBatch(s4);
stmt.executeBatch();
con.commit(); //事务提交
//恢复自动提交模式

con.setAutoCommit(true);


%>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title</title>
</head>
<body>

</body>
</html>