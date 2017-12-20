<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String user = "admin";
	String password = "123123";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";
	
	Class.forName(driverName);
	
	con=DriverManager.getConnection(url, user, password);
    
    stmt=con.createStatement();
   
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

 <table  id = "table-1" width="100%">
      <tr>
          <td>ISBN</td>
          <td>书名</td>
          <td>作译者</td>
          <td>出版社</td>
          <td>出版年月</td>
          <td>分类号</td>
          <td>复本量</td>
          <td>库存量</td>
          <td>价格</td>
          <td>操作</td>
      </tr>
<%
String sql=null;
String str=session.getAttribute("search").toString();

sql="select * from TBook  where  书名  like '%"+str+"%'";

rs=stmt.executeQuery(sql);
while(rs.next()){%>
	<tr>   
	  <td><%=rs.getString(1)%></td>   
	  <td><%=rs.getString(2)%></td>
	  <td><%=rs.getString(3)%></td> 
	  <td><%=rs.getString(4)%></td>
	  <td><%=rs.getString(5)%></td> 
	  <td><%=rs.getString(6)%></td> 
	  <td><%=rs.getInt(7)%></td> 
	  <td><%=rs.getInt(8)%></td> 
	  <td><%=rs.getFloat(9)%></td>
	  <td><a href="../doborrow.jsp?isbn=<%=rs.getString(2)%>">借阅</a></td>
		</tr>   
<%
}
%>
</table>
 
</body>
</html>
 <%   
  //关闭结果集   
  rs.close();   
  //关闭SQL语句对象   
  stmt.close();   
  //关闭数据库   
  con.close();   
  %>    