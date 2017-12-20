
<%@ page import="java.util.*,dao.TBookDao,table.TBook" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String isbn=request.getParameter("isbn");
String name=request.getParameter("name");
String writer=request.getParameter("writer");
String press = request.getParameter("press");
String published_date = request.getParameter("published_date");
String price = request.getParameter("price");
String copy_volume = request.getParameter("copy_volume");
String inventory = request.getParameter("inventory");
String classification = request.getParameter("classification");

TBook obj=new TBook();
obj.setISBN(isbn);
obj.setName(name);
obj.setWriter(writer);
obj.setPress(press);
obj.setPublishedDate(published_date);
obj.setPrice(Float.parseFloat(price));
obj.setCopyVolume(Integer.parseInt(copy_volume));
obj.setInventory(Integer.parseInt(inventory));
obj.setClassification(classification);

TBookDao dao=new TBookDao();
dao.update(obj);
response.sendRedirect("TBook_admin.jsp");
	
%>