<%@ page import="java.util.*,dao.*,table.*" pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("UTF-8");

	
	String isAdmin = request.getParameter("checkbox");
	String p = request.getParameter("textfield2");

	if (isAdmin == null) {

		String id = request.getParameter("id");
		TReaderDao dao = new TReaderDao();
		TReader ob = dao.findById(id);
		if (ob != null) {

			String password = ob.getPassword();

			if (password.equals(p)) {
				session.setAttribute("name", ob.getName());
				session.setAttribute("id", ob.getId());
				session.setAttribute("password", ob.getPassword());
				session.setAttribute("sex", ob.getSex());
				session.setAttribute("date", ob.getDate());
				session.setAttribute("major", ob.getMajor());
				session.setAttribute("borrow", ob.getBorrow());
				session.setAttribute("phone", ob.getPhone());
				session.setAttribute("remarks", ob.getRemarks());

				response.sendRedirect("user.jsp");
			} else {
				response.sendRedirect("Wopop.html");
				//alter("用户名或密码不正确！");
			}
		} else
			response.sendRedirect("Wopop.html");
	} else {
		String ad = request.getParameter("id");
		AdminDao dao = new AdminDao();
		Admin ob = dao.findById(ad);
		if (ob != null) {

			String password = ob.getPassword();

			if (password.equals(p)) {
				session.setAttribute("name", ob.getAdmin());
				session.setAttribute("password", ob.getPassword());
				session.setAttribute("description", ob.getDescription());

				response.sendRedirect("manager.jsp");
			} else {
				response.sendRedirect("Wopop.html");
			}
		}
	}
%>



