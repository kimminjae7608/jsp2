<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx=Integer.parseInt(request.getParameter("idx"));
	FreeboardDao dao = FreeboardDao.getInstance();
	dao.delete(idx);
	
	response.sendRedirect("listAction.jsp");

%>