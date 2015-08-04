<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="br.gov.eureka.dao.*, br.gov.eureka.model.*, java.util.List, java.util.ArrayList" %>

<link rel="shortcut icon" href="imagens/logo.jpg"/>

<% //Verifica se está logado
if(session.getValue("loginAtend") != null || session.getValue("senhaAtend") != null || session.getValue("funcaoAtend") == "1"){
} else {
	out.println("<script>alert('Login ou senha inválidos'); top.location.href='index.jsp';</script>"); //Exibe na tela e pede para voltar
}
%>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<div class="row">
			<form method="post" action="atendimenton.jsp">
		<button type="submit" class="btn btn-lg btn-warning btn-block"><span class="glyphicon glyphicon-th-list"></span> Iniciar Atendimento</button>
			</form>	
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>