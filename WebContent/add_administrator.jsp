
<%@ page import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
    <title></title>
  </head>
 
  <script type="text/javascript">
  	function myBack(){
  		location.href="manager-super.jsp";
 		
  	}
  	function mySubmit(){
  		
  		var id=document.forms[0].admin_id;
        var id_msg=document.getElementById("id_msg");
  
  		id_msg.innerHTML="";
  		
  		if(id.value.length==0){
  		id_msg.innerHTML="<font color='red'>*借书证号为必填项</font>";
  		id_msg.focus();
  			return ;//中断方法的运行
  		}
  		
  		document.forms[0].submit();
  	}
  </script>
  <body>
	<h1 align="center">新增管理员</h1>
	<form action="do_add_administrator.jsp" method="post" >
		<table align="center" width="50%">
      <!--   借书证号   -->
      <tr>  
                <td align="right" width="37%">管理员:</td>  
                <td align="left" width="25%"><input type="text" name="admin_id" ></td>   
                <td>  
                    <div id="id_msg" align="left"></div>  
                </td>  
            </tr>  
            <!-- 密码 -->  
            <tr>  
                <td align="right" width="37%">密码:</td>  
                <td align="left" width="25%"><input type="text" name="password"></td>   
             
            </tr>  
            
            
            <tr>  
                <td align="right">权限:</td>  
                <td align="left" colspan="2"><input type="radio" name="permissions" value="Select">select
                <input type="radio" name="permissions" value="All">all privileges
                </td>   
              
            </tr>    
                 
            <!-- 描述 -->  
            <tr>  
                <td align="right" width="37%">描述:</td>  
                <td align="left" width="25%"><input type="text" name="description" ></td>   
            </tr>  
            
            <!-- 按钮 -->  
            <tr>  
                <td align="center" colspan="3">  
                    <input type="button" value="添加" onclick="mySubmit()">  
                          
                    <input type="button" value="返回"  onclick="myBack()">  
                </td>  
            </tr>  
        </table>  
	</form>
  </body>
</html>