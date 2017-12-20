
<%@ page import="java.util.*,dao.TBookDao,dao.BaseDao,table.TBook" pageEncoding="UTF-8"%>
<html>
  <head>  
  <link rel="stylesheet" type="text/css" href="table.css"/>
    <title></title>
  </head>
  <%
  	TBookDao dao=new TBookDao();
  	ArrayList<TBook> list=dao.findAll();
   %>
   
   <script type="text/javaScript">
   
   			function myAction(pid){
   		
   				document.forms[0].isbn.value=pid;
   				document.forms[0].submit();
   			}
	
   </script>
  <body>
	<form action="doRemove.jsp" method="post">
		<!-- 用于存放选择的id，然后会随表单提交给服务器处理页面 -->
		<input type="hidden" name="isbn">
		<table  id = "table-1" width="100%">
			<tr>
				<td colspan="10" align="right">
					<a href="add.jsp">添加图书</a>
				</td>
			</tr>
			<tr>
				<th>ISBN</th>
				<th>书名</th>
				<th>作译者</th>
				<th>出版社</th>
				<th>出版年月</th>
				<th>分类号</th>
				<th>复本量</th>
				<th>库存量</th>
				<th>价格</th>
				<th>操作</th>
			</tr>
			<%for(int i=0;i<list.size();i++){
				TBook obj=(TBook)list.get(i);%>
				<tr>
					<td><%=obj.getISBN()%></td>
					<td><%=obj.getName()%></td>
					<td><%=obj.getWriter()%></td>
					<td><%=obj.getPress()%></td>
					<td><%=obj.getPublishedDate()%></td>
					<td><%=obj.getClassification()%></td>
					<td><%=obj.getCopyVolume()%></td>
					<td><%=obj.getInventory()%></td>
					<td><%=obj.getPrice()%></td>
					
					<td>
						<a href="update.jsp?isbn=<%=obj.getISBN()%>">修改</a> 
						<input type="button" value="删除" onclick="myAction('<%=obj.getISBN()%>')"/>
					</td>
				</tr>
			<%}%>
		</table>
	</form>
  </body>
<html>