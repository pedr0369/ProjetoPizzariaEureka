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
%>

<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>

<sql:update var="editar_pessoa" dataSource="${ds}">
update pessoa set Nome_pessoa = '${param.nome}', Tel_pessoa = '${param.tel}', Tel1_pessoa = '${param.tel1}', Cel_pessoa = '${param.cel}' where Usuario_pessoa = '${loginClient}';
</sql:update>

<sql:update var="editar_endereco" dataSource="${ds}">
update endereco set Rua_end = '${param.rua}', Comp_end = '${param.complemento}', Cep_end = '${param.cep}', Cidade_end = '${param.cidade}', Estado_end = '${param.estado}' where Id_end = '${param.id}';
</sql:update>

<script>
alert('Dados modificados com sucesso!');
top.location.href='minha_conta.jsp';
</script>


