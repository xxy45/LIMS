
<%@ page import="java.util.*,dao.TBookDao" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String isbn=request.getParameter("isbn");

	TBookDao dao=new TBookDao();
	
	dao.remove(isbn);
	
	response.sendRedirect("TBook_admin.jsp");
 %>




