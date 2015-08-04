<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%

String pag = request.getParameter("pag");

request.setAttribute("page", pag);

RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
rd.forward(request, response);

%>