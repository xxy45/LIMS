<%@ page language="java" import="java.util.*" import="java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
   if(request.getParameter("s2")!=null)
  		session.setAttribute("s2",request.getParameter("s2"));
  String s2=session.getAttribute("s2").toString();
   
	
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	/* String user = "admin";
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
<link rel="stylesheet" type="text/css" href="table.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<form action="doRemove.jsp" method="post">
		<!-- 用于存放选择的id，然后会随表单提交给服务器处理页面 -->
		<input type="hidden" name="isbn">
		<table id="table-1" width="100%">
			<tr>
				<td colspan="11" align="right"><a href="add.jsp">添加图书</a></td>
			</tr>

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
				<td>借书次数</td>
				<td>操作</td>
			</tr>
			<%
String sql="select * from TBook where 分类号  like '%"+s2+"%'";
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
				<%
					Connection con1 = null;
						CallableStatement cs = null;
						con1 = DriverManager.getConnection(url, user, password);
						String sql1 = "{?=CALL B_count(?)}";
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


				<td><a href="update.jsp?isbn=<%=rs.getString(2)%>">修改</a> <input
					type="button" value="删除" onclick="myAction('<%=rs.getString(2)%>')" />
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
