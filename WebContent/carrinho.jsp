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
      
      <!-- Portfólio -->
      <section id="portfolio" class="div_colorida">
        <div class="container">
            <div class="row">
            <div class="col-xs-12">
                <div class="page-header col-md-offset-4"><img src="img/img1.png" class="pull-left"><h1 class="pull-left fonte" style="margin-top:3px; padding:0 8px;">Carrinho</h1><img class="pull-left" src="img/img2.png"></div><br><br>
                </div>                
            </div>
        
     <div class="container-fluid">
        <div class="row-fluid">
       
<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>

<sql:query var="consProd" dataSource="${ds}">
SELECT * FROM lista where usuario = '${loginClient}';
</sql:query>

<c:forEach var="prod" items="${consProd.rows}">

<div class="col-sm-2 prod_cart" style="margin-top:30px;">
<table class="table table-bordered prod_carrinho" style="box-shadow:1px 1px 4px black; background-color:#c0c0c0;">
<tr>
<td class="text-center well" style="font-size:12px;">${prod.produto} <a href="del_prod_cart.jsp?prod=${prod.produto}"><span class="glyphicon glyphicon-trash pull-right"></span></a></td>
</tr>
<tr>
<td><img src="img/produtos/${prod.produto}.jpg" alt="Meu produto" class="img img-responsive img-thumbnail" width="100%"/></td>
</tr>
<tr>
<td class="alert alert-danger"><h4 class="text-center">R$ <c:out value="${prod.preco}"/></h4></td>
</tr>
</table>
</div>

</c:forEach>

     </div>   
    </div>

<sql:query var="total" dataSource="${ds}">
SELECT sum(preco)as 'total' FROM lista where usuario = '${loginClient}';
</sql:query>

<c:forEach var="totalizando" items="${total.rows}">
<c:set var="cart_total" value="${totalizando.total}" scope="request" /> 
</c:forEach>

<div class="container">
<div class="row" style="margin-top:50px;">

<div class="col-sm-3">
	<a href="index.jsp" class="btn btn-danger btn-block" style="margin-top:50px;">Continuar Comprando</a>
</div>

<div class="col-sm-3 col-sm-offset-1">
<div class="input-group">
   <div class="input-group-addon">Total</div>
   <input type="text" class="form-control input-lg" name="total" placeholder="R$ ${cart_total}">
</div>
<a class="btn btn-success btn-block" href="fechar_pedido.jsp?total=${cart_total}">Fechar Pedido</a>
</div>
</div>
</div>

            <div class="col-sm-6 col-sm-offset-3">
				<br><br><img src="img/img3.png" class="text-center" width="100%">
			</div>
			
          </div>
      </section>
      <!-- Fim do portfólio -->
      
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