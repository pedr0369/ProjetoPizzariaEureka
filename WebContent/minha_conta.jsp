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
<title>Minha Conta</title>

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
                    <li><a href="#">Minha Conta</a></li>
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
      
      <!-- area alteração de dados -->
      <div class="container" style="margin-top:15px;">
      	<div class="row">
      		<div class="col-sm-12 well">
      			
      			<h3 class="text-center">Meus dados</h3><br>
      				
<sql:query var="meusdados" dataSource="${ds}">
SELECT p.*, e.* from pessoa p natural join endereco e where p.Usuario_pessoa = '${loginClient}' and p.Nvl_acesso = 0;
</sql:query>

<c:forEach var="dados" items="${meusdados.rows}">
    <c:set value="${dados.Nome_pessoa}" var="nome" scope="request"/>
    <c:set value="${dados.Tel_pessoa}" var="tel" scope="request"/>
    <c:set value="${dados.Tel1_pessoa}" var="tel1" scope="request"/>
    <c:set value="${dados.Cel_pessoa}" var="cel" scope="request"/>
    <c:set value="${dados.Id_end}" var="id" scope="request" />
    <c:set value="${dados.Bairro_end}" var="bairro" scope="request"/>
    <c:set value="${dados.Rua_end}" var="rua" scope="request"/>
    <c:set value="${dados.Comp_end}" var="complemento" scope="request"/>
    <c:set value="${dados.Cep_end}" var="cep" scope="request"/>
    <c:set value="${dados.Cidade_end}" var="cidade" scope="request"/>
    <c:set value="${dados.Estado_end}" var="uf" scope="request"/> 
</c:forEach>

<form action="edit_conta.jsp" method="post">

<div class="col-sm-4">	
		<div class="form-group">
		<label for="exampleInputEmail1">Nome: </label>
			<input type="text" name="nome" class="form-control" placeholder="${nome}" value="${nome}">
		</div>
</div>

<input type="hidden" name="id" value="${id}">

<div class="col-sm-4">	
		<div class="form-group">
		<label for="exampleInputEmail1">Telefone: </label>
			<input type="text" name="tel" class="form-control" placeholder="${tel}"  value="${tel}">
		</div>
</div>

<div class="col-sm-4">	
		<div class="form-group">
		<label for="exampleInputEmail1">Telefone 1:</label>
			 <input type="text" name="tel1" class="form-control" placeholder="${tel1}" value="${tel1}">
		</div>
</div>

<div class="col-sm-4">	
		<div class="form-group">
		<label for="exampleInputEmail1">Celular: </label>
			<input type="text" name="cel" class="form-control" placeholder="${cel}" value="${cel}">
		</div>
</div>

<div class="col-sm-4">	
		<div class="form-group">
		<label for="exampleInputEmail1">Rua: </label>
			<input type="text" name="rua" class="form-control" placeholder="${rua}" value="${rua}">
		</div>
</div>

<div class="col-sm-4">	
		<div class="form-group">
		<label for="exampleInputEmail1">Complemento: </label>
			<input type="text" name="complemento" class="form-control" placeholder="${complemento}" value="${complemento}">
		</div>
</div>

<div class="col-sm-4">	
		<div class="form-group">
		<label for="exampleInputEmail1">Cep: </label>
			<input type="text" name="cep" class="form-control" placeholder="${cep}" value="${cep}">
		</div>
</div>

<div class="col-sm-4">	
		<div class="form-group">
		<label for="exampleInputEmail1">Cidade: </label>
			<input type="text" name="cidade" class="form-control" placeholder="${cidade}" value="${cidade}">
		</div>
</div>

<div class="col-sm-4">	
		<div class="form-group">
		<label for="exampleInputEmail1">Estado: </label>
			<input type="text" name="estado" class="form-control" value="${estado}" placeholder="${estado}">
		</div>
</div>

<div class="col-sm-12">
<input type="submit" class="btn btn-success btn-block" value="Editar meus dados">
</div>


</form>
      			
      		</div>
      	</div>
      </div>
      
      <!-- fim da area alteração de dados -->      
      
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