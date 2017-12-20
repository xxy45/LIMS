<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*,dao.*,table.*"
    pageEncoding="utf-8"%>
<%
String id = session.getAttribute("id").toString();
TReaderDao dao = new TReaderDao();
TReader ob = dao.findById(id);
;
session.setAttribute("borrow",ob.getBorrow());


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
	<h5>借阅成功！<label> <a href="common/TBook.jsp">返回..</a></label></h5>
	
</body>
</html>