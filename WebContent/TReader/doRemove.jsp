
<%@ page import="java.util.*,dao.TReaderDao" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");

	TReaderDao dao=new TReaderDao();
	
	dao.remove(id);
		//response.sendRedirect是重定向
	//重定向会让我们的浏览器显示指定的页面,但是对于用户来说无法得知操作是否成功(只能通过查看显示的页面效果来判断)
	//除了重定向以外还有3种提示效果
	//
	//1.弹出对话框,等待用户确认消息后再继续前往下一个页面
	//2.显示信息,在一段时间后自动前往下一个页面
	response.sendRedirect("index.jsp");
 %>




