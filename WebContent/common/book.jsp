<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%int pages = 1;
	int count = 0;
	int totalpages = 0;
	int limit = 40;
	
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String user = session.getAttribute("name").toString();
	String password = session.getAttribute("password").toString();
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";
	
	Class.forName(driverName);
	
	con=DriverManager.getConnection(url, user, password);
    
    stmt=con.createStatement();
    rs= stmt.executeQuery("select count(*) from TBook");
    if(rs.next()){
        count = rs.getInt(1);
    }
    totalpages = (int)Math.ceil(count/(limit*1.0));
    String strPage = null;
    
    strPage = request.getParameter("pages");
   
    if(rs!=null)
    {
        rs.close();
    }
    if (strPage == null) { 
        pages = 1;
    } else {
        try{
            pages = java.lang.Integer.parseInt(strPage);
        }catch(Exception e){
            pages = 1;
        }
        
        if (pages < 1){
            pages = 1;
        }
        
        if (pages > totalpages){
            pages = totalpages;
        }                            
    }
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="table.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
 <table  id = "table-1" width="100%">
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
         
      </tr>
<%
String sql="select top "+limit +" * from( select row_number() over(order by ISBN) as rownumber,* from TBook) A where rownumber >"+limit*(pages-1);
rs=stmt.executeQuery(sql);
while(rs.next()){%>
	<tr>   
	  <td><%=rs.getString(2)%></td>   
	  <td><%=rs.getString(3)%></td>
	  <td><%=rs.getString(4)%></td> 
	  <td><%=rs.getString(5)%></td>
	  <td><%=rs.getString(6)%></td> 
	  <td><%=rs.getString(7)%></td> 
	  <td><%=rs.getInt(8)%></td> 
	  <td><%=rs.getInt(9)%></td> 
	  <td><%=rs.getFloat(10)%></td>
	 
		</tr>   
<%
}
%>
</table>
 <form name="f1" action="book.jsp" method="POST"  onSubmit="return checknum()">
            <table border="0" align="center" >
                <tr>
                    <td>第<%=pages %> 页 共<%=totalpages %>页 <a href="book.jsp?pages=1">首页</a></td>
                    <td><a href="book.jsp?pages=<%=(pages<1)?pages:(pages-1) %>"> 上一页</a></td>
                    <td><a href="book.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>"> 下一页</a></td>
                    <td><a href="book.jsp?pages=<%=totalpages%>">最后一页</a></td>
                    <td>转到第:<input type="text" name="pages" size="8">页<input type="submit" value="GO" name="cndok"></td>
                </tr>
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