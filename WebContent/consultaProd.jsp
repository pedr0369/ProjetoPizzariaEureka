<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<link rel="shortcut icon" href="imagens/logo.jpg"/>
	<%
//Verifica se está logado
if(session.getValue("loginAtend") != null || session.getValue("senhaAtend") != null || session.getValue("funcaoAtend") == "1"){
} else {
	out.println("<script>alert('Login ou senha inválidos'); top.location.href='index.jsp';</script>"); //Exibe na tela e pede para voltar
}
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>
<sql:query var="consProd" dataSource="${ds}">
SELECT * FROM produto where Id_prod = ${param.cod};
</sql:query>

<c:forEach var="prod" items="${consProd.rows}">
<c:set scope="request" var="nome" value="${prod.Nome_prod}"/>
<c:set scope="request" var="preco" value="${prod.Preco_prod }"/>
<c:set scope="request" var="is_pizza" value="${prod.Pizza_prod}" /> 
</c:forEach>

<%
RequestDispatcher rd = request.getRequestDispatcher("atendimenton.jsp");
rd.forward(request, response);
%>

</body>
</html>