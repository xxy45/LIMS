<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*,java.util.*,dao.*"
    pageEncoding="utf-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String isbn=request.getParameter("isbn");

	TLendDao dao=new TLendDao();
	
	dao.remove(isbn);
	response.sendRedirect("return_success.jsp");
    %>
