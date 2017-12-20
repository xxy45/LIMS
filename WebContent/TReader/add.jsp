
<%@ page import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
    <title></title>
  </head>
  <!-- JavaScript是搭配HTML使用的脚本代码,可以帮助我们操作HTML内容和浏览器本身 -->
  <!-- JavaScript可以做很多很多事情，甚至可以用来编写游戏和强大的基于浏览器的应用
  然而更普遍的功能是利用JavaScript帮助我们进行表单验证,确保提交的数据是符合服务器业务处理要求的 -->
  <script type="text/javascript">
  	function myBack(){
  		//将浏览器导航为index.jsp,location.href属性可以更改当前浏览器地址栏的内容
  		location.href="index.jsp";
 		//window.location.href="index.jsp";
 
  	}
  	//mySubmit方法用于提交表单，并且在提交之前验证表单数据的格式是否符合要求
  	function mySubmit(){
  		//document是文档对象，代表整个HTML页面
  		//forms是表单集合，如果存在多个表单的话,索引从0开始，并且是从上往下编号   如果表单有表单名可以用<span style="font-family:FangSong_GB2312;"><strong>document.表单名.控件名.value </strong></span>
 
  		var id=document.forms[0].reader_id;
               //通过document.getElementById（“id名”） 可以获取非<input /> 中的内容，但是dojsp无法获取         
        var id_msg=document.getElementById("id_msg");
  
  		id_msg.innerHTML="";
  		
  		if(id.value.length==0){
  			//提示用户
  			//alert("姓名为必填项");
  			id_msg.innerHTML="<font color='red'>*借书证号为必填项</font>";
  			//聚焦（鼠标定位）
                        id_msg.focus();
  			return ;//中断方法的运行
  		}
  		//对于多选的控件判断会稍微麻烦点点哦
  	
  		document.forms[0].submit();
  		//submit是提交方法
  	}
  </script>
  <body>
	<h1 align="center">新增信息</h1>
	<form action="doadd.jsp" method="post" >
		<table align="center" width="50%">
      <!--   借书证号   -->
      <tr>  
                <td align="right" width="37%">借书证号:</td>  
                <td align="left" width="25%"><input type="text" name="reader_id" ></td>   
                <td>  
                    <div id="id_msg" align="left"></div>  
                </td>  
            </tr>  
            <!-- 密码 -->  
            <tr>  
                <td align="right" width="37%">密码:</td>  
                <td align="left" width="25%"><input type="text" name="password" value="123456"></td>   
             
            </tr>  
            <!-- 姓名 -->  
            <tr>  
                <td align="right" width="37%">姓名:</td>  
                <td align="left" width="25%"><input type="text" name="name" ></td>   
             
            </tr>  
            <!-- 性别 -->  
            <tr>  
                <td align="right">性别:</td>  
                <td align="left" colspan="2"><input type="radio" name="sex" value="男">男  
                <input type="radio" name="sex" value="女" />女</td>   
              
            </tr>  
            <!-- 出生时间 -->  
            <tr>  
                <td align="right">出生时间:</td>  
                <td align="left" colspan="2"><input type= "date" name="date"> 
            </tr>  
           
               <!-- 专业 -->  
            <tr>  
                <td align="right" width="37%">专业:</td>  
                <td align="left" width="25%"><input type="text" name="major" ></td>   
         
            </tr>
            
            <!-- 借书量 -->  
             <tr>  
                <td align="right" width="37%">借书量:</td>  
                <td align="left" width="25%"><input type="number" name="borrow" value= "0" ></td>   
             
            </tr>  
             
            <!-- 描述 -->  
            <tr>  
                <td align="right" valign="middle">备注:</td>  
                <td align="left" colspan="2"><textarea rows="8" name="remarks"></textarea></td>  
            </tr>  
            
             <!-- 联系方式 -->  
            <tr>  
                <td align="right" valign="middle">联系方式:</td>  
                <td align="left" colspan="2"><input type="text"  name="phone"></td>  
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