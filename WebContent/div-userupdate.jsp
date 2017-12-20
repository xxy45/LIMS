
<%@ page import="java.util.*,dao.TReaderDao,table.TReader" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id= session.getAttribute("id").toString();
	TReaderDao dao=new TReaderDao();
	TReader obj=dao.findById(id);
	
	//准备好常量
	ArrayList sexs=new ArrayList();
	sexs.add("男");
	sexs.add("女");
 %>
<html>
  <head>
    <title></title>
  </head>
  <script type="text/javascript">
  	function myBack(){
  		window.history.back(-1);
  	}
  
  	function mySubmit(){
  		
  		var password=document.forms[0].password;
  		var password_msg=document.getElementById("password_msg");
  		password_msg.innerHTML="";
  		
  		
  			if(password.value.length==0){
  				password_msg.innerHTML="<font color='red'>*密码为必填项</font>";
  				password.focus();
  				return ;
  			}
  	
  		document.forms[0].submit();
  	}
  </script>
  <body>
	<h1 align="center">修改信息</h1>
	<form action="douserupdate.jsp" method="post" >
		<input type="hidden" name="id" value="<%=obj.getId()%>">
		<input type="hidden" name="borrow" value = "<%=obj.getBorrow() %>">
		<table align="center" width="50%">
			<!-- 密码 -->
			<tr>
				<td align="right" width="37%">密码:</td>
				<td align="left" width="25%"><input type="text" name="password" value="<%=obj.getPassword()%>" ></td> 
				<td>
					<div id="password_msg" align="left"></div>
				</td>
			</tr>
			<!-- 姓名 -->
			<tr>
				<td align="right" width="37%">姓名:</td>
				<td align="left" width="25%"><input type="text" name="name" value="<%=obj.getName()%>" ></td> 
				<td>
					<div id="name_msg" align="left"></div>
				</td>
			</tr>
			<!-- 性别 -->
			<tr>
				<td align="right">性别:</td>
				<td align="left" colspan="2">
					<%for(int i=0;i<sexs.size();i++){%>
						<input type="radio" name="sex" value="<%=sexs.get(i).toString()%>"
						<%String s ="女";
						if(obj.getSex()==true)  s = "男";
							if (s.equals(sexs.get(i).toString())){%>
						checked="checked"
						<% }%>
						><%=sexs.get(i).toString()%>
					<% } %>
				</td> 
			</tr>
			<!-- 出生时间 -->
			<tr>
				<td align="right">出生时间:</td>
				<td align="left" colspan="2"><input type = "date" name = "date" value="<%=obj.getDate()%>"></td>
			</tr>
			<!-- 专业 -->
			<tr>
				<td align="right" valign="middle">专业:</td>
				<td align="left" colspan="2"><input type="text" name="major" value ="<%=obj.getMajor()%>"></td>
			</tr>
			
			<!-- 备注 -->
			<tr>
				<td align="right" valign="middle">备注:</td>
				<td align="left" colspan="2"><textarea rows="8" name="mtext" value="<%=obj.getRemarks()%>"></textarea></td>
			</tr>
			<!-- 联系方式 -->
			<tr>
				<td align="right" valign="middle">联系方式:</td>
				<td align="left" colspan="2"><input type="text" name="phone" value="<%=obj.getPhone()%>"></td>
			</tr>
			<!-- 按钮 -->
			<tr>
				<td align="center" colspan="3">
					<input type="button" value="修改" onclick="mySubmit()">
					    
					<input type="button" value="返回"  onclick="myBack()">
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>