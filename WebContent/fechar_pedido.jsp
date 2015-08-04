<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<link rel="shortcut icon" href="imagens/logo.jpg"/>
<%
if(session.getValue("loginClient") != null || session.getValue("senhaClient") != null || session.getValue("funcaoClient") == "0"){
} else {
	out.println("<script>alert('Login ou senha inválidos'); top.location.href='index.jsp';</script>"); //Exibe na tela e pede para voltar
}

double total = Double.parseDouble(request.getParameter("total"));
%>

<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>

<sql:query var="pedido" dataSource="${ds}">
select group_concat(produto) as "descricao" from lista  where usuario = '${loginClient}'; 
</sql:query>

<c:forEach var="descricoes" items="${pedido.rows}">
<c:set var="descrevi" scope="request" value="${descricoes.descricao}"/>
</c:forEach>

<sql:query var="id_pessoa" dataSource="${ds}">
select * from pessoa where Usuario_pessoa = '${loginClient}'; 
</sql:query>

<c:forEach var="pessoaid" items="${id_pessoa.rows}">
<c:set var="ide" scope="request" value="${pessoaid.Id_pessoa}"/>
</c:forEach>

<sql:update var="pedido" dataSource="${ds}">
insert into pedido (valor, Desc_atend, Data_atend, Hora_atend, Id_pessoa) values (<%= total %>, '${descrevi}', curdate(), curtime(), ${ide});
</sql:update>

<sql:update var="consProd" dataSource="${ds}">
delete FROM lista where usuario = '${loginClient}';
</sql:update>

<script>alert('Pedido efetuado com sucesso'); top.location.href='index.jsp';</script>
