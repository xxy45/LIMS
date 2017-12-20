<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%request.setCharacterEncoding("utf-8");
   if(request.getParameter("s5")!=null)
 		session.setAttribute("s5",request.getParameter("s5"));
 String s5=session.getAttribute("s5").toString();
	Connection con1=null;
	Statement stmt1=null;
	ResultSet rs1=null;
	Connection con=null;
	Connection con2=null;
	Statement stmt2=null;Statement stmt=null;
	ResultSet rs=null;
	ResultSet rs2=null;
	String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String user = session.getAttribute("name").toString();
	String password = session.getAttribute("password").toString();
	/* String user = "admin";
	String password = "123123"; */
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";
	
	Class.forName(driverName);
	
	con=DriverManager.getConnection(url, user, password);
	con1=DriverManager.getConnection(url, user, password);
	con2=DriverManager.getConnection(url, user, password);
	   stmt=con.createStatement();
	 
   stmt1=con1.createStatement();
    stmt2=con2.createStatement();

	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TLend</title>
</head>
<body>
 <table  id = "table-1" width="100%">
      <tr>
       <td>ISBN</td>
       <td>图书ID</td>
       <td>书名</td>
       <td>借书证号</td>
       <td>姓名</td>
       <td>借书时间</td>
       <td>应还时间</td>
      
       
      </tr>
<%
String sql="select * from TLend where ISBN  like '%"+s5+"%'";
rs=stmt.executeQuery(sql);

while(rs.next()){
	String sql1="select 书名 from TBook where ISBN ="+rs.getString(2);
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next()){
		String sql2="select 姓名 from TReader where 借书证号 ="+rs.getString(1);
		rs2=stmt2.executeQuery(sql2);
		while(rs2.next()){
%>
	<tr>  
	  <td><%=rs.getString(2) %></td>
	  <td><%=rs.getInt(3)%></td> 
	  <td><%=rs1.getString(1)%></td> 
	  <td><%=rs.getString(1) %></td>
	  <td><%=rs2.getString(1)%></td> 
	  <td><%=rs.getString(4)%></td> 
      <td><%=rs.getString(5)%></td> 
     
	  </tr>   
<%
}
}
}
%>
</table>
 
</body>
</html>
 <%   

  
  %>    