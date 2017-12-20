<%@ page import="java.util.*,java.sql.*,dao.TReaderDao,table.TReader" pageEncoding="UTF-8"%>
<html>
  <head>  
  <link rel="stylesheet" type="text/css" href="table.css"/>
    <title></title>
  </head>
  <%
  	TReaderDao dao=new TReaderDao();
  	ArrayList<TReader> list=dao.findAll();
   %>
   
   <script type="text/javaScript">
   
   			function myAction(pid){
   		
   				document.forms[0].id.value=pid;
   				document.forms[0].submit();
   			}
	
   </script>
  <body>
	<form action="doRemove.jsp" method="post">
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
				<th>操作</th>
				<th>借书次数</th>
				
			</tr>
			<%for(int i=0;i<list.size();i++){
				TReader obj=(TReader)list.get(i);%>
				<!--Html代码-->
				<tr>
					<td><%=obj.getId()%></td>
					<td><%=obj.getPassword()%></td>
					<td><%=obj.getName()%></td>
					<td><%=obj.getSex()%></td>
					<td><%=obj.getDate()%></td>
					<td><%=obj.getMajor()%></td>
					<td><%=obj.getBorrow()%></td>
					<td><%=obj.getRemarks()%></td>
					<td><%=obj.getPhone()%></td>
					
				<%
					String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
						/* String user = "admin";
						String password = "123123"; */
						String user = session.getAttribute("name").toString();
						String password = session.getAttribute("password").toString();
						String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";

						Connection con1 = null;
						CallableStatement cs = null;
						con1 = DriverManager.getConnection(url, user, password);
						String s1 = "{?=CALL L_count(?)}";
						String s =obj.getId();
						
						try {
							Class.forName(driverName);
							cs = con1.prepareCall(s1);
							cs.registerOutParameter(1, java.sql.Types.INTEGER);
							cs.setString(2, s);
							cs.execute();
						} catch (Exception e) {
							e.printStackTrace();
						}
				%>

				<td> <%=cs.getInt(1)%> </td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%-- <a href="doRemove.jsp?id=<%=obj.getId()%>">删除</a> --%>
						<a href="update.jsp?id=<%=obj.getId()%>">修改</a> 
						<input type="button" value="删除" onclick="myAction('<%=obj.getId()%>')"/>
					</td>
   		
	
  
				</tr>
			<%}%>
		</table>
	</form>
  </body>
<html>