<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% request.setCharacterEncoding("utf-8");
   
   if(request.getParameter("s3")!=null)
  		session.setAttribute("s3",request.getParameter("s3"));
  String s3=session.getAttribute("s3").toString();

	
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
/* 	String user = "admin";
	String password = "123123"; */
	String user = session.getAttribute("name").toString();
	String password = session.getAttribute("password").toString();
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
<body><form action="doRemove.jsp" method="post">
		<input type="hidden" name="id">
		<table  id = "table-1" width="100%">
			<tr>
				<td colspan="11" align="right">
					<a href="add.jsp">添加新信息</a>
				</td>
			</tr>
			<tr>
				<th>借书证号</th>
				<th>密码</th>
				<th>姓名</th>
				<th>性别</th>
				<th>出生时间</th>
				<th>专业</th>
				<th>借书量</th>
				<th>备注</th>
				<th>联系方式</th>
				<th>借书次数</th>
				<th>操作</th>
			</tr>
<%
String sql="select * from TReader where 借书证号  like '%"+s3+"%'";
rs=stmt.executeQuery(sql);
while(rs.next()){%>
	<tr>   
	  <td><%=rs.getString(1)%></td>   
	  <td><%=rs.getString(2)%></td>
	  <td><%=rs.getString(3)%></td> 
	  <td><%=rs.getBoolean(4)%></td> 
	  <td><%=rs.getDate(5)%></td>
	  <td><%=rs.getString(6)%></td> 
	  <td><%=rs.getInt(7)%></td> 
	  <td><%=rs.getString(8)%></td> 
	  <td><%=rs.getString(9)%></td>
	  <%
					Connection con1 = null;
						CallableStatement cs = null;
						con1 = DriverManager.getConnection(url, user, password);
						String sql1 = "{?=CALL L_count(?)}";
						try {
							Class.forName(driverName);
							cs = con1.prepareCall(sql1);
							cs.registerOutParameter(1, java.sql.Types.INTEGER);
							cs.setString(2, rs.getString(1));
							cs.execute();
						} catch (Exception e) {
							e.printStackTrace();
						}
				%>

		<td><%=cs.getInt(1)%></td>
	  
	 	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%-- <a href="doRemove.jsp?id=<%=obj.getId()%>">删除</a> --%>
						<a href="update.jsp?id=<%=rs.getString(1)%>">修改</a> 
						<input type="button" value="删除" onclick="myAction('<%=rs.getString(1)%>')"/>
					</td>
		</tr>   
		<script type="text/javaScript">
   
   			function myAction(pid){
   		
   				document.forms[0].isbn.value=pid;
   				document.forms[0].submit();
   			}
	
   </script>
<%
}
%>
</table>
</form>

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