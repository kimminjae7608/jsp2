<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx=Integer.parseInt(request.getParameter("idx"));
	FreeboardDao dao = FreeboardDao.getInstance();
	dao.delete(idx);
	out.print("<script>");
	out.print("alert('고객 idx "+idx+" 삭제되었습니다.');");
	out.print("location.href='listAction.jsp';");
	out.print("</script>");
	/* response.sendRedirect("listAction.jsp"); */

%>