<%@ page import="java.util.*,table.TReader" pageEncoding="UTF-8"%>

<html>
  <head>
  <link rel="stylesheet" type="text/css" href="table.css"/>
    <title></title>
  </head>
 
  <body>
	<h1 align="center">个人信息</h1>
	<form>
		<table align="center" width="50%" id = "table-1">
      <!--   借书证号   -->
      <tr>  
                <td align="center" width="37%">借书证号:</td>  
                <td align="center" width="25%"> <label><%=session.getAttribute("name").toString() %></label></td>   
              
            </tr>  
            <!-- 密码 -->  
            <tr>  
                <td align="center" width="37%">密码:</td>  
                <td align="center" width="25%"><label><%=session.getAttribute("password").toString() %></label></td>   
             
            </tr>  
            <!-- 姓名 -->  
            <tr>  
                <td align="center" width="37%">姓名:</td>  
                <td align="center" width="25%"><label><%=session.getAttribute("description").toString() %></label></td>   
            </tr>  
           
           
          
        </table>  
	</form>
  </body>
</html>