<%@ page import="java.util.*,table.TReader" pageEncoding="UTF-8"%>

<html>
  <head>
  <link rel="stylesheet" type="text/css" href="table.css"/>
    <title></title>
  </head>
 
  <body>
	<h1 align="center">用户信息</h1>
	<form>
		<table align="center" width="50%" id = "table-1">
      <!--   借书证号   -->
      <tr>  
                <td align="center" width="37%">借书证号:</td>  
                <td align="center" width="25%"> <label><%=session.getAttribute("id").toString() %></label></td>   
              
            </tr>  
            <!-- 密码 -->  
            <tr>  
                <td align="center" width="37%">密码:</td>  
                <td align="center" width="25%"><label><%=session.getAttribute("password").toString() %></label></td>   
             
            </tr>  
            <!-- 姓名 -->  
            <tr>  
                <td align="center" width="37%">姓名:</td>  
                <td align="center" width="25%"><label><%=session.getAttribute("name").toString() %></label></td>   
             
            </tr>  
            <!-- 性别 -->  
            <tr>  
                <td align="center">性别:</td>  
                <td align="center" colspan="2"><label><%=session.getAttribute("sex").toString() %></label></td>   
              
            </tr>  
            <!-- 出生时间 -->  
            <tr>  
                <td align="center">出生时间:</td>  
                <td align="center" colspan="2"><label><%=session.getAttribute("date").toString() %></label>
            </tr>  
           
               <!-- 专业 -->  
            <tr>  
                <td align="center" width="37%">专业:</td>  
                <td align="center" width="25%"><label><%=session.getAttribute("major").toString() %></label></td>   
         
            </tr>
            
            <!-- 借书量 -->  
             <tr>  
                <td align="center" width="37%">借书量:</td>  
                <td align="center" width="25%"><label><%=session.getAttribute("borrow").toString() %></label></td>   
             
            </tr>  
             
            <!-- 描述 -->  
            <tr>  
                <td align="center" valign="middle">备注:</td>  
                <td align="center" colspan="2"><label><%=session.getAttribute("remarks").toString() %></label></td>  
            </tr>  
            
             <!-- 联系方式 -->  
            <tr>  
                <td align="center" valign="middle">联系方式:</td>  
                <td align="center" colspan="2"><label><%=session.getAttribute("phone").toString() %></label></td>  
            </tr> 
          
        </table>  
	</form>
  </body>
</html>