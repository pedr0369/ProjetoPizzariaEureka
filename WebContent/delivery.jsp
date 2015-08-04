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


<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<div class="row">
			
<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>

<sql:query var="delivery" dataSource="${ds}">
SELECT ped.*, end.*, pes.* FROM pedido ped natural join pessoa pes natural join endereco end WHERE ped.Situacao_ped = 'pendente' order by ped.Data_atend desc
</sql:query>

<c:forEach var="sit_ped" items="${delivery.rows}">

<div class="col-sm-9 alert alert-success" style="box-shadow:1px 1px 4px black;">
<h3>Pedido nº: ${sit_ped.Nro_atend}</h3>
<input type="hidden" id="id" value="${sit_ped.Nro_atend}">
<p><b>Data do pedido:</b> ${sit_ped.Data_atend} / <b>Hora do pedido: </b> ${sit_ped.Hora_atend}</p> 

<p><b>Descrição do pedido:</b> ${sit_ped.Desc_atend}</p>
 <p><b>Valor Total:</b> R$ ${sit_ped.valor} </p>
<p><b>Endereco:</b> ${sit_ped.Rua_end} / <b>Complemento:</b> ${sit_ped.Comp_end} / <b>Bairro:</b> ${sit_ped.Bairro_end} / <b>Cidade:</b> ${sit_ped.Cidade_end} / <b>Cep: </b> ${sit_ped.Cep_end}</p></p> 
<p><b>Telefone:</b> ${sit_ped.Tel_pessoa} / <b>Telefone1:</b> ${sit_ped.Tel1_pessoa} / <b>Celular:</b> ${sit_ped.Cel_pessoa}</p>
</div>

<div class="col-sm-2 col-sm-offset-1 alert alert-success" style="box-shadow:1px 1px 4px black;">
		<h4 class="text-center" style="background:#356636; color:white; padding:5px; border-radius:5px;">Pendente</h4>
	<a class="btn btn-danger btn-block" style="margin-top:10px;" href='conclui_ped.jsp?id=${sit_ped.Nro_atend}'>Concluir Pedido</a>
</div>

</c:forEach>
			
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>