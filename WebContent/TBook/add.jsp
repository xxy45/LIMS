<%@ page import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
    <title></title>
  </head>
 
  <script type="text/javascript">
  	function myBack(){
  		location.href="TBook_admin.jsp";
  	}
 
  	function mySubmit(){
  		
  		var isbn=document.forms[0].isbn;
        var isbn_msg=document.getElementById("isbn_msg");
  
  		isbn_msg.innerHTML="";
  		
  		if(isbn.value.length==0){
  			//提示用户
  			//alert("姓名为必填项");
  			isbn_msg.innerHTML="<font color='red'>*借书证号为必填项</font>";
  			//聚焦（鼠标定位）
            isbn_msg.focus();
  			return ;//中断方法的运行
  		}
  		document.forms[0].submit();
  	}
  </script>
  <body>
	<h1 align="center">新增信息</h1>
	<form action="doadd.jsp" method="post" >
		<table align="center" width="50%">
      <!--   ISBN  -->
      <tr>  
                <td align="right" width="37%">ISBN:</td>  
                <td align="left" width="25%"><input type="text" name="isbn" ></td>   
                <td>  
                    <div id="isbn_msg" align="left"></div>  
                </td>  
            </tr>  
            <!-- 书名 -->  
            <tr>  
                <td align="right" width="37%">书名:</td>  
                <td align="left" width="25%"><input type="text" name="name" ></td>   
             
            </tr>  
            <!-- 作译者 -->  
            <tr>  
                <td align="right" width="37%">作译者:</td>  
                <td align="left" width="25%"><input type="text" name="writer" ></td>   
             
            </tr>  
             <!-- 出版社-->  
            <tr>  
                <td align="right" width="37%">出版社:</td>  
                <td align="left" width="25%"><input type="text" name="press" ></td>   
             
            </tr>  
            <!-- 出版时间 -->  
            <tr>  
                 <td align="right" width="37%">出版时间:</td>  
                <td align="left" width="25%"><input type="text" name="published_date" ></td>   
            </tr>  
           
               <!-- 价格-->  
            <tr>  
                <td align="right" width="37%">价格:</td>  
                <td align="left" width="25%"><input type="text" name="price" ></td>   
            </tr>
            
            <!-- 数量 ：复本量、库存量 -->  
             <tr>  
                <td align="right" width="37%">数量:</td>  
                <td align="left" width="25%"><input type="number" name="count"  ></td>   
            </tr>  
             
             <!-- 库存量 -->  
          <!--    <tr>  
                <td align="right" width="37%">库存量:</td>  
                <td align="left" width="25%"><input type="number" name="inventory" value= "0" ></td>   
            </tr>   -->
            
             <!-- 分类号 -->  
            <tr>  
                <td align="right" valign="middle">分类号:</td>  
                <td align="left" colspan="2"><input type="text"  name="classification"></td>  
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