<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
	<link rel="shortcut icon" href="img/logo1.png"/>


<% //Verifica se está logado
session.getValue("loginClient");
session.getValue("senhaClient");
session.getValue("funcaoClient");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>

function mensagem(){
	alert('Formulário enviado com sucesso!');
}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pizzaria Eureka</title>
 
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="css/estilo.css" rel="stylesheet" type="text/css"> 
<link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
</head>

<body data-spy="scroll" data-target=".menu-navegacao" data-offset="80">

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
            
            <div class="collapse navbar-collapse" id="menu-navegacao">
            
            	<ul class="nav navbar-nav navbar-left">
    				<li><a href="#" class=" hidden-xs">Pizzaria Eureka</a></li>
    			</ul>
    			
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

    			
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#portfolio">Produtos</a></li>
                    <li><a href="#quemsomos">Quem Somos</a></li>
                    <li><a href="#localizacao">Localização</a></li>
                    <li><a href="#contato">Contato</a></li>
                    <c:if test="${items > 0 && loginClient != null}"><li><a href="carrinho.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>( ${items} )</a></li></c:if>
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
      
      <!-- slider da aplicação -->
      <div class="divslider">
        <div class="container-fluid">
        <div id="sliderprincipal" class="carousel slide" data-ride="carousel">
            
            <ol class="carousel-indicators">
                <li data-target="#sliderprincipal" data-slide-to="0"></li>
                <li data-target="#sliderprincipal" data-slide-to="1"></li>
            </ol>
            
            <div class="carousel-inner" role="listbox">
                <div class="item active" style="height:450px;">
                    <img src="img/pizza3.jpg" alt="Imagem Slider 1" width="100%" class="img-responsive">
                </div>
                <div class="item" style="height:450px;">
                    <img src="img/pizza2.jpg" alt="Imagem Slider 2" width="100%" class="img-responsive" style="background-size:100% 100%;">
                </div>
            </div>
            
            <a class="left carousel-control" href="#sliderprincipal" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span><span class="sr-only">Anterior</span></a>  
            <a class="right carousel-control" href="#sliderprincipal" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span><span class="sr-only">Próximo</span></a>
            
          </div>
          </div>
          </div>
      </div>      
      <!-- fim do slider da aplicação -->
      
      <!-- Portfólio -->
      <section id="portfolio" class="div_colorida">
        <div class="container">
            <div class="row">
            <div class="col-xs-12">
                <div class="page-header col-md-offset-4"><img src="img/img1.png" class="pull-left"><h1 class="pull-left fonte" style="margin-top:3px; padding:0 8px;">PRODUTOS</h1><img class="pull-left" src="img/img2.png"></div><br><br>
                </div>                
            </div>
            
            <% request.getAttribute("page"); %>
            
<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>

<sql:query var="meuProd" dataSource="${ds}">
SELECT * FROM produto where usuario = '${loginClient}';
</sql:query>

<div class="container-fluid">
        <div class="row-fluid">

<c:forEach var="prodmeu" items="${meuProd.rows}">

	<form method="post" action="add_prod.jsp">
	<c:set scope="request" var="nome" value="${prodmeu.Nome_prod}"/>
	<c:set scope="request" var="preco" value="${prodmeu.Preco_prod }"/>

    <div class="col-sm-3 produto">
    	<h4 class="text-center well">${nome}</h4>
        <img src="img/pizza3.jpg" class="img-responsive img-thumbnail img_prod" />
        <h4 class="text-center text-danger bg bg-danger"><b>R$ ${preco}</b></h4>
        <input type="hidden" name="produto" value="${nome}"><input type="hidden" name="valor" value="${preco}"><input type="hidden" name="usuario" value="${loginClient}">
        <c:if test="${loginClient != null}"><button type="submit" class="btn btn-danger btn-block">Comprar</button></form></c:if>
    </div>

</c:forEach>

</div>
	</div>

<div class="container-fluid">
        <div class="row-fluid">

<c:if test="${page == null}"><c:set var="page" value="0"/></c:if>
<sql:query var="consProd" dataSource="${ds}">
SELECT * FROM produto where usuario = 'null' limit ${page}, 16;
</sql:query>
<% int i = 0; %>
<c:forEach var="prod" items="${consProd.rows}">
<form method="post" action="add_prod.jsp">
<c:set scope="request" var="nome" value="${prod.Nome_prod}"/>
<c:set scope="request" var="preco" value="${prod.Preco_prod }"/>
<c:set scope="request" var="descricao" value="${prod.Desc_prod}"></c:set>

    <div class="col-sm-3 produto">
    	<h4 class="text-center well">${nome}</h4>
        <img src="img/produtos/${nome}.jpg" class="img-responsive img-thumbnail img_prod" data-toggle="modal" data-target="#myModal<%= i %>">
        <h4 class="text-center text-danger bg bg-danger"><b>R$ ${preco}</b></h4>
        <c:if test="${loginClient != null}"><button type="submit" class="btn btn-danger btn-block">Comprar</button></c:if>
    </div>

<div class="modal fade" id="myModal<%= i %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="myModalLabel">${nome}</h4>
      </div>
      <div class="modal-body">
        <img src="img/produtos/${nome}.jpg" class="img-responsive img-thumbnail img-modal">
        <p class="alert alert-danger">${descricao}</p>
      </div>
      <div class="modal-footer">
      <input type="hidden" name="produto" value="${nome}"><input type="hidden" name="valor" value="${preco}"><input type="hidden" name="usuario" value="${loginClient}">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button></form>
      </div>
    </div>
  </div>
</div>
<% i++; %>

</c:forEach>

<div class="col-sm-4 col-sm-offset-5">       
	<nav>
	  <ul class="pagination">
	    <li><a href="pagination.jsp?pag=0">1</a></li>
	    <li><a href="pagination.jsp?pag=16">2</a></li>
	    <li><a href="pagination.jsp?pag=32">3</a></li>
	    <li><a href="pagination.jsp?pag=48">4</a></li>
	    <li><a href="pagination.jsp?pag=64">5</a></li>
	  </ul>
	</nav>
</div>

     </div>
    </div>       
            
            <div class="col-sm-6 col-sm-offset-3">
				<br><br><img src="img/img3.png" class="text-center" width="100%">
			</div>
			
          </div>
      </section>
      <!-- Fim do portfólio -->
      
      <!-- Quem somos -->
      <section id="quemsomos">
        <div class="container">
            <div class="row">
            <div class="col-xs-12">
                <div class="page-header col-md-offset-4"><img src="img/img1.png" class="pull-left"><h1 class="pull-left fonte" style="margin-top:3px; padding:0 8px;">Quem Somos</h1><img class="pull-left" src="img/img2.png"></div><br><br>
                </div>
            </div>
			
			<div class="col-sm-12 well text-justify">
			
				<p style="font-size:15px;">Com a ambição de estar no topo das melhores pizzarias de Belo Horizonte e região metropolitana, a Pizzaria Eureka investiu pesado nos quesitos tecnologia, matéria prima e principalmente na mão-de-obra qualificada, para ter como resultado os produtos mais saborosos e ser referência em atendimento, tudo isso levando em consideração nosso respeito para com nossos clientes. A pizzaria Eureka conta com os melhores sistemas de atendimento, fornecedores de ótima procedência e funcionários bem selecionados e altamente treinados. Com toda essa estrutura podemos oferecer o melhor para você!</p>				
			
			</div>
			
			<div class="col-sm-6">
				<img src="img/pizza7.jpg" class="img-responsive img-thumbnail" alt="Responsive image">
			</div>
			
			<div class="col-sm-6">
				<img src="img/pizza8.jpg" class="img-responsive img-thumbnail" alt="Responsive image">
			</div>
            
			<div class="col-sm-6 col-sm-offset-3">
				<br><br><img src="img/img3.png" class="text-center" width="100%">
			</div>
            
          </div>
      </section>      
      <!-- Fim quem somos -->
      
      <!-- Localização -->
      <section id="localizacao" class="div_colorida">
        <div class="container">
            <div class="row">            
            <div class="col-xs-12">
                <div class="page-header col-md-offset-4"><img src="img/img1.png" class="pull-left"><h1 class="pull-left fonte" style="margin-top:3px; padding:0 8px;">Localização</h1><img class="pull-left" src="img/img2.png"></div><br><br> 
                </div>
            </div>
            
            <div class="row -fluid">
				
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1875.4096588458583!2d-43.93309699869822!3d-19.932017403618044!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xa699c2ae29c993%3A0xfa0152c2b181a025!2sR.+Pernambuco%2C+480+-+Centro%2C+Belo+Horizonte+-+MG%2C+30130-150!5e0!3m2!1spt-BR!2sbr!4v1434495750231" width="100%" height="500" frameborder="0" style="border:0"></iframe>

            </div>
            <br><br>
            <div class="col-sm-6 col-sm-offset-3">
					<img src="img/img3.png" class="text-center" width="100%">
			</div>
			
          </div>
      </section>
      <!-- Fim da localização -->
      
      <!-- Contato -->
      <section id="contato">
        <div class="container">
            <div class="row">
            
            	<div class="col-xs-12">
                	<div class="page-header col-md-offset-4">
                		<img src="img/img1.png" class="pull-left">
                		<h1 class="pull-left fonte" style="margin-top:3px; padding:0 8px;">Entre em contato</h1>
                		<img class="pull-left" src="img/img2.png">
                	</div><br><br>
                </div>
            </div>
            
            <div class="row contato">
                <div class="col-xs-12">
                    <p class="bg-success aviso">Preencha o formulário abaixo para entrar em contato conosco!</p>
                </div>
            </div>
            
            <div class="row contato">
                <div class="col-xs-12">  
                    
                    <form name="frmContato" id="frmContato" onsubmit="mensagem();">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control input-lg" placeholder="Qual seu nome?" required>
                                </div>
                                
                                <div class="form-group">
                                    <input type="email" class="form-control input-lg" placeholder="Qual seu e-mail?" required>
                                </div>
                                
                                <div class="form-group">
                                    <input type="assunto" class="form-control input-lg" placeholder="Seu assunto?">
                                </div>
                                
                            </div>
                            
                            <div class="col-md-6">
                                <textarea class="form-control input-lg" placeholder="Sua mensagem! *" required></textarea>
                            </div>
                        </div>
                        
                        <div class="row">

                            <div class="col-sm-6 text-left">
                                <button type="submit" class="btn btn-success btn-lg">Enviar Formulário</button>
                            </div>
							
							<div class="col-sm-6 col-sm-offset-3">
								<img src="img/img3.png" class="text-center" width="100%">
							</div>
							
							
                        </div>
                        
                    </form>
                    
                </div>
            </div>            
            
          </div>
      </section>
      <!-- Fim do contato -->
      
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