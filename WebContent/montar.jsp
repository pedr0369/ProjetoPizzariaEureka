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
<link rel="shortcut icon" href="imagens/logo.jpg"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pizzaria Eureka</title>
 
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
                    <li><a href="#">Montar Pizza</a></li>
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

<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>
<sql:query var="ingredientes" dataSource="${ds}">
Select * from ingredientes
</sql:query>

<div class="container-fluid">
	<div class="row-fluid">

<h3 class="text-center">Monte sua própria pizza</h3>
<br>
<p><strong>Ingredientes:</strong></p>
<form action="#" method="post">
<c:forEach var="itens" items="${ingredientes.rows}">

<div class="col-sm-3">
<div class="checkbox">
  <label>
    <input type="checkbox" name="ingredientes" value='${itens.valor}'>
    	<p style="font-size:14px;">${itens.nome} (<b> R$ ${itens.valor} </b>)</p> 
  </label>
</div>
</div>
</c:forEach>

<div class="col-sm-8">
	<div class="form-group">
	<% if(request.getParameter("ingredientes") == null){ %>
		<input type="text" class="form-control" name="nomeProd" maxlength="30" placeholder="Crie o nome de sua pizza" required>
	<% }else { %>
		<input type="text" class="form-control" value="${param.nomeProd}" disabled>
	<% } %>
	</div>
</div>

<div class="col-sm-3 col-sm-offset-1">
	<div class="input-group">
      <div class="input-group-addon">Total</div>

<% if(request.getParameter("ingredientes") == null){ %>
     	 <input type="text" class="form-control" name="total" id="exampleInputAmount" placeholder="R$ 0.0">
<% }else { %>
<c:forEach var="aIngredientes" items="${paramValues.ingredientes}">
 	<c:set var="total" value="${total + aIngredientes}" scope="request" />
</c:forEach>
 <input type="text" class="form-control" id="exampleInputAmount" value="${total}" disabled required>
<% } %>
    
    </div>
  </div>

<div class="col-sm-8 col-sm-offset-2">
<% if(request.getParameter("ingredientes") == null){ %>  
	<input type="submit" value="Conferir" class="btn btn-danger btn-block"></form>
<% }else { %>
	<a href="montar_produto.jsp?prod=${param.nomeProd}&total=${total}" class="btn btn-block btn-success">Montar produto</a>
<% } %>
</div>

</div>
</div>
<hr>
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