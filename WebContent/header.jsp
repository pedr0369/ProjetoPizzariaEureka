<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%
if(session.getValue("loginAtend") != null){ %> Sistema de Atendimento <% } 
else if(session.getValue("loginRelat") != null){ %> Sistema de Relatório <% }
else if(session.getValue("loginDelivery") != null){ %> Sistema de Delivery <% } %> 
</title>
<link rel="shortcut icon" href="imagens/logo.jpg"/>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
<link rel="shortcut icon" href="imagens/logo.jpg"/>
</head>
<body>

<nav class="navbar ">
  <div class="container-fluid">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed btn btn-default" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar" style="background-color:#999;"></span>
        <span class="icon-bar" style="background-color:#666;"></span>
        <span class="icon-bar" style="background-color:#999;"></span>
      </button>
      <a class="navbar-brand" href="#">
        <img alt="brand" src="img/logo1.png">
      </a>
    </div>
    
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-left">
    	<li><a href="#" class=" hidden-xs">Pizzaria Eureka</a></li>
    </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a class="hidden-xs"><% if(session.getValue("loginAtend") != null){ out.println(session.getValue("loginAtend")); }
      	else if(session.getValue("loginRelat") != null){ out.println(session.getValue("loginRelat")); }
      	else if(session.getValue("loginDelivery") != null){ out.println(session.getValue("loginDelivery")); }
      	 %></a></li>
        <li><a href="logoff.jsp" class="sair">Sair</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div>
</nav>