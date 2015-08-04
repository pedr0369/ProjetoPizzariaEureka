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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Meus Pedidos</title>

<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css"> 
<link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
</head>
<body>

	<!-- Menu da aplicação -->
      <nav class="navbar navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu-navegacao">
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top">
                	<img alt="brand" src="img/logo1.png">
                </a>
            </div>
            
<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>

<sql:query var="cart" dataSource="${ds}">
SELECT count(id) as 'items' FROM lista where usuario = '${loginClient}';
</sql:query>

<c:forEach var="prod" items="${cart.rows}">
<c:set scope="request" var="items" value="${prod.items}" />
</c:forEach>
            
            <div class="collapse navbar-collapse" id="menu-navegacao">
            
            	<ul class="nav navbar-nav navbar-left">
    				<li><a href="#" class=" hidden-xs">Pizzaria Eureka</a></li>
    			</ul>
    			
                <ul class="nav navbar-nav navbar-right">
                	<li><a href="index.jsp">HOME</a></li>
                    <li><a href="#">Meus Pedidos</a></li>
                    <c:if test="${items > 0}"><li><a href="carrinho.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>( ${items} )</a></li></c:if>
                    <c:if test="${loginClient == null}"><li><a href="logar.jsp">Logar/Cadastrar</a></li></c:if>
                    
                    <c:if test="${loginClient != null}">
                    <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${loginClient} <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			          	<li><a href="montar.jsp">Montar minha Pizza</a>
			            <li><a href="minha_conta.jsp">Minha Conta</a></li>
			            <li><a href="meupedido.jsp">Meus Pedidos</a></li>
			            
			            <li role="separator" class="divider"></li>
			            <li><a href="logoff.jsp">Sair</a></li>
			          </ul>
			        </li>
			        </c:if>
                </ul>    
            </div>
            
          </div>
      </nav>      
      <!-- fim do menu da aplicação -->
      
      <div class="container">
      	<div class="row">
      		<div class="col-sm-12">
      		
      			<h3 class="text-center">Meus Pedidos</h3>
      			
      			
      				
<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>

<sql:query var="pedido" dataSource="${ds}">
SELECT ped.*, end.*, pes.* FROM `pedido` ped natural join endereco end natural join pessoa pes WHERE Usuario_pessoa = '${loginClient }' order by Nro_atend desc;
</sql:query>

<c:forEach var="prod" items="${pedido.rows}">
<div class="col-sm-12 well">
<h3>Pedido: ${prod.Nro_atend}</h3>
<div class="alert alert-success" role="alert"><p><b>Descrição do pedido:</b> ${prod.Desc_atend} / <b>Valor Total:</b> R$ ${prod.valor} </p>
<p><b>Data do pedido:</b> ${prod.Data_atend} / <b>Hora: </b> ${prod.Hora_atend} / <b>E-mail:</b> ${prod.Email_pessoa}</p></div>
<p><b>Endereco:</b> ${prod.Rua_end} / <b>Complemento:</b> ${prod.Comp_end} / <b>Bairro:</b> ${prod.Bairro_end} / <b>Cidade:</b> ${prod.Cidade_end} / <b>Cep_end:</b> ${prod.Cep_end}</p></p> 
<p><b>Telefone:</b> ${prod.Tel_pessoa} / <b>Telefone1:</b> ${prod.Tel1_pessoa} / <b>Celular:</b> ${prod.Cel_pessoa}</p>
</div>
</c:forEach>
      		
      		</div>
      	</div>
      </div>
      
      <!-- area de rodape -->
      <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    © 2015 por Pizzaria Euréka.
                </div>
            </div>    
        </div>
      </footer>
      <!-- fim -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/main.js"></script>

</body>
</html>