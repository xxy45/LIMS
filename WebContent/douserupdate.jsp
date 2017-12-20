
<%@ page import="java.util.*,dao.TReaderDao,table.TReader" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String password=request.getParameter("password");
String name=request.getParameter("name");
String sex1 = request.getParameter("sex");
boolean sex = true;
if(sex1.equals("男")) sex = true;
else if(sex1.equals("女"))  sex=false;
String date1 = request.getParameter("date");
String major = request.getParameter("major");
String borrow = request.getParameter("borrow");
String remarks = request.getParameter("remarks")+"";
String phone = request.getParameter("phone");



TReader obj=new TReader();
obj.setId(id);
obj.setPassword(password);
obj.setName(name);
obj.setSex(sex);
java.sql.Date date =java.sql.Date.valueOf(date1);
obj.setDate(date);
obj.setMajor(major);
obj.setBorrow(Integer.parseInt(borrow));
obj.setRemarks(remarks);
obj.setPhone(phone);


TReaderDao dao=new TReaderDao();
dao.update(obj);


session.setAttribute("id", id);
session.setAttribute("password",password);
session.setAttribute("name",name);
session.setAttribute("sex",sex);
session.setAttribute("date",date);
session.setAttribute("major",major);
session.setAttribute("borrow",borrow);
session.setAttribute("phone",phone);
session.setAttribute("remarks",remarks);


	
%>
<script language="javascript" type="text/javascript"> 
           window.parent.location.href="user-center.jsp"; 
           
    </script> 



