<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%int pages = 1;
	int count = 0;
	int totalpages = 0;
	int limit = 20;
	
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String user = "admin";
	String password = "123123";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=MBook;";
	
	Class.forName(driverName);
	
	con=DriverManager.getConnection(url, user, password);
    
    stmt=con.createStatement();
    rs= stmt.executeQuery("select count(*) from TLend");
    if(rs.next()){
        count = rs.getInt(1);//结果为count(*)表，只有一列。这里通过列的下标索引（1）来获取值
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
<title>TLend</title>
</head>
<body>
 <table  id = "table-1" width="100%">
      <tr>
       <td>借书证号</td>
       <td>ISBN</td>
       <td>图书ID</td>
       <td>借书时间</td>
       <td>应还时间</td>
       
      </tr>
<%
String sql="select top "+limit +" * from( select row_number() over(order by 图书ID) as rownumber,* from HLend) A where rownumber >"+limit*(pages-1);
rs=stmt.executeQuery(sql);
while(rs.next()){%>
	<tr>    
	  <td><%=rs.getString(2)%></td>
	  <td><%=rs.getString(3)%></td> 
	  <td><%=rs.getInt(4)%></td> 
	  <td><%=rs.getString(5)%></td> 
      <td><%=rs.getString(6)%></td> 
	  </tr>   
<%
}
%>
</table>
 <form name="f1" action="TLend.jsp" method="POST"  onSubmit="return checknum()">
            <table border="0" align="center" >
                <tr>
                    <td>第<%=pages %> 页 共<%=totalpages %>页 <a href="TLend.jsp?pages=1">首页</a></td>
                    <td><a href="Tlend.jsp?pages=<%=(pages<1)?pages:(pages-1) %>"> 上一页</a></td>
                    <td><a href="TLend.jsp?pages=<%=(pages>=totalpages)?totalpages:(pages+1)%>"> 下一页</a></td>
                    <td><a href="TLend.jsp?pages=<%=totalpages%>">最后一页</a></td>
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
  rs.close();   
  //关闭数据库   
  rs.close();   
  %>    