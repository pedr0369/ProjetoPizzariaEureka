<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<link rel="shortcut icon" href="imagens/logo.jpg"/>
<%
if(session.getValue("loginDelivery") != null || session.getValue("senhaDelivery") != null || session.getValue("funcaoDelivery") == "3"){
} else {
	out.println("<script>alert('Login ou senha inválidos'); top.location.href='index.jsp';</script>"); //Exibe na tela e pede para voltar
}
%>

<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>

<% String ide = request.getParameter("id"); %>
<c:set var="ident" value="<%= ide %>" scope="request" />
<sql:update var="conclui" dataSource="${ds}">
	update pedido set Situacao_ped = 'Concluida' where Nro_atend = ${ident};
</sql:update>

<script>alert('Pedido concluído com sucesso');top.location.href='delivery.jsp';</script>