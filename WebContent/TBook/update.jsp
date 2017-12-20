
<%@ page import="java.util.*,dao.TBookDao,table.TBook" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String isbn=request.getParameter("isbn");
	TBookDao dao=new TBookDao();
	TBook obj=dao.findById(isbn);
	
 %>
<html>
  <head>
    <title></title>
  </head>
  <script type="text/javascript">
  	function myBack(){
  		location.href="index.jsp";
  	}
  
  	function mySubmit(){
  		
  		var name=document.forms[0].name;
  		var name_msg=document.getElementById("name_msg");
  		name_msg.innerHTML="";
  		
  		
  			if(name.value.length==0){
  				name_msg.innerHTML="<font color='red'>*书名为必填项</font>";
  				name.focus();
  				return ;
  			}
  	
  		document.forms[0].submit();
  	}
  </script>
  <body>
	<h1 align="center">修改信息</h1>
	<form action="doUpdate.jsp" method="post" >
		<input type="hidden" name="isbn" value="<%=obj.getISBN()%>">
		<table align="center" width="50%">
		 <!-- 书名 -->  
            <tr>  
                <td align="right" width="37%">书名:</td>  
                <td align="left" width="25%"><input type="text" name="name" value="<%=obj.getName()%>"></td>   
            	<td>
            	 	<div id = "name_msg" align="left"></div>
            	</td>
            </tr>  
            <!-- 作译者 -->  
            <tr>  
                <td align="right" width="37%">作译者:</td>  
                <td align="left" width="25%"><input type="text" name="writer" value="<%=obj.getWriter()%>"></td>   
             
            </tr>  
             <!-- 出版社-->  
            <tr>  
                <td align="right" width="37%">出版社:</td>  
                <td align="left" width="25%"><input type="text" name="press" value="<%=obj.getPress()%>"></td>   
             
            </tr>  
            <!-- 出版时间 -->  
            <tr>  
                 <td align="right" width="37%">出版时间:</td>  
                <td align="left" width="25%"><input type="text" name="published_date" value="<%=obj.getPublishedDate()%>"></td>   
            </tr>  
           
               <!-- 价格-->  
            <tr>  
                <td align="right" width="37%">价格:</td>  
                <td align="left" width="25%"><input type="text" name="price" value="<%=obj.getPrice()%>"></td>   
            </tr>
            
            <!-- 复本量 -->  
             <tr>  
                <td align="right" width="37%">复本量:</td>  
                <td align="left" width="25%"><input type="number" name="copy_volume" value= "<%=obj.getCopyVolume()%>" ></td>   
            </tr>  
             
            <!-- 库存量 -->  
             <tr>  
                <td align="right" width="37%">库存量:</td>  
                <td align="left" width="25%"><input type="number" name="inventory" value= "<%=obj.getInventory()%>" ></td>   
            </tr>  
            
             <!-- 分类号 -->  
            <tr>  
                <td align="right" valign="middle">分类号:</td>  
                <td align="left" colspan="2"><input type="text"  name="classification" value="<%=obj.getClassification()%>"></td>  
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