<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.text.DecimalFormat" %>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<link rel="shortcut icon" href="img/logo1.png"/>
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

<%

Double total = Double.parseDouble(request.getParameter("total"));
Double vlr_recebido = Double.parseDouble(request.getParameter("vlr_recebido"));

if(total <= vlr_recebido){
	double troco = vlr_recebido - total;
	
	request.setAttribute("troco", troco);
%>
	
<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate var="data" type="date" value="${now}" />
<fmt:formatDate var="hora" type="time" value="${now}" />

<sql:query var="descricao" dataSource="${ds}">
select group_concat(produto) as "descricao" from lista  where usuario = '${loginAtend}'; 
</sql:query>
<c:forEach var="descricoes" items="${descricao.rows}">
<c:set var="descrevi" value="${descricoes.descricao}"/>
</c:forEach>

<sql:query var="IdPessoa" dataSource="${ds}">
select Id_pessoa from pessoa where Usuario_pessoa = '${loginAtend }';
</sql:query>
<c:forEach var="listando" items="${IdPessoa.rows}">
<c:set var="id" value="${listando.Id_pessoa}"/>
</c:forEach>

<sql:update var="IdPessoa" dataSource="${ds}">
insert into atendimento (`Data_atend`, `Hora_atend`, `Desc_atend`, `valor`, `Id_pessoa`) values (curdate(), curtime(), '${descrevi}', ${param.total}, ${id});
</sql:update>
	

<%	
	RequestDispatcher rd = request.getRequestDispatcher("atendimenton.jsp");
	rd.forward(request, response);
}else {
	out.println("<script>alert('O valor recebido é menor que o valor total'); history.back(-1);</script>");
}
%>
</body>
</html>