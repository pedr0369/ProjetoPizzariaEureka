<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<link rel="shortcut icon" href="img/logo1.png"/>
<%
//Verifica se est� logado
if(session.getValue("loginAtend") != null || session.getValue("senhaAtend") != null || session.getValue("funcaoAtend") == "1"){
} else {
	out.println("<script>alert('Login ou senha inv�lidos'); top.location.href='index.jsp';</script>"); //Exibe na tela e pede para voltar
}
%>

<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>

<c:set var="preco_tam" value="${(param.preco * param.tamanho) + param.preco}"></c:set>

<sql:update var="consProd" dataSource="${ds}">
INSERT into lista (produto, preco, usuario) VALUES ("${param.nome}", "${preco_tam}", "${loginAtend}");
</sql:update>

<%
response.sendRedirect("atendimenton.jsp");
%>

</body>
</html>