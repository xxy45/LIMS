<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%  request.setCharacterEncoding("utf-8");
    String s = request.getParameter("search");
    session.setAttribute("search",s);
    if(s == null)
    	response.sendRedirect("TBook.jsp");
    else
    	response.sendRedirect("dousersearch.jsp");
    %>
