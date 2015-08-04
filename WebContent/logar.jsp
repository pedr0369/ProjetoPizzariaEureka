<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Pizzaria Eureka</title>
<link rel="shortcut icon" href="img/logo1.png"/>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
</head>
<body class="fundo">

<div class="container-fluid">
	<div class="row-fluid">
		<div class="col-sm-4 col-sm-offset-4 well logar">
			
			<h3 class="text-center">Faça seu login</h3>
			
<form method="post" action="verificacao.jsp">
  <div class="form-group">
    <input type="text" class="form-control input input-lg" name="login" id="login" placeholder="Entre com seu usuário" required>
  </div>
  <div class="form-group">
    <input type="password" class="form-control input input-lg" name="senha" id="senha" placeholder="Digite sua senha" required>
  </div>
  
  <table class="table table-responsive">
  	<tr>
  	<td class="col-sm-8"> <select class="form-control" name="funcao" style="margin-top:10px;">
  <option value=0>Cliente</option>
  <option value=1>Atendente</option>
  <option value=2>Gerente</option>
  <option value=3>Delivery</option>
</select>  </td>
	<td class="col-sm-4"><button style="margin-top:10px;" type="submit" class="btn btn-default btn-md btn-block">Logar</button></td>
</tr>
</table>
  
  <a type="button" class="btn btn-success" data-toggle="modal" data-target="#modal">Cadastre-se</a>
  <a href="index.jsp" class="btn btn-danger pull-right">Voltar</a>

</form>			
		</div>
	</div>
</div>

<div class="modal fade bs-example-modal-md" id="modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content" id="cadastro" >
      
      <form method="post" action="cadastro.jsp" class="text-center">
      <table class="table table-responsive">
      <tr><td colspan="3"><h3 class="text-center bg bg-success">Realize seu cadastro</h3></td></tr>
      <tr><td colspan="3">
  <div class="form-group">
    <input type="text" class="form-control" id="nome" placeholder="Seu nome" name="nome" required>
  </div>
  	</td></tr>
  	
  	<tr><td colspan="3">
  <div class="form-group">
    <input type="text" class="form-control" id="usuario" placeholder="Crie seu usuário" name="usuario" required>
  </div>
  </td></tr>
  
  <tr><td colspan="2">
  <div class="form-group">
    <input type="password" class="form-control" id="senha" placeholder="Crie sua senha" name="senha" required>
  </div>
  </td>
  
  <td colspan="1">
  <div class="form-group">
    <input type="password" class="form-control" id="rep_senha" placeholder="Repita sua senha" name="rep_senha" required>
  </div>
  </td></tr>
  
  <tr><td colspan="3">
  <div class="form-group">
    <input type="email" class="form-control" title="Ex: xxxx@xxxx.xxx" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" id="email" placeholder="Informe seu e-mail" name="email" maxlength="30" required>
  </div>
  </td></tr>
 
 <tr><td colspan="2"> 
  <div class="form-group">
    <input type="text" class="form-control" id="rua" placeholder="Qual a sua rua" name="rua" required>
  </div>
  </td>
  
  <td colspan="1">
  <div class="form-group">
    <input type="text" class="form-control" id="complemento" placeholder="Qual o complemento " name="complemento" required>
  </div>
  </td></tr>
  
  <tr><td colspan="1">
  <div class="form-group">
    <input type="text" class="form-control" id="cep" placeholder="Informe seu cep" name="cep" required>
  </div>
  </td>
  
  <td colspan="2">
  <div class="form-group">
    <input type="text" class="form-control" id="bairro" placeholder="Informe seu bairro" name="bairro" required>
  </div>
  </td></tr>
  
  <tr><td colspan="2">
  <div class="form-group">
    <input type="text" class="form-control" id="cidade" placeholder="Informe sua cidade" name="cidade" required>
  </div>
  </td>
  
  <td colspan="1">
  <div class="form-group">
    <input type="text" class="form-control" id="estado" placeholder="Informe seu estado" name="estado" >
  </div>
  </td></tr>
  
  <tr><td colspan="2">
  <div class="form-group">
    <input type="text" class="form-control" id="tel" placeholder="Informe seu telefone" pattern="^\d{2}\d{4,5}\d{4}$" title="Digite só numeros. Ex: 3132438352" name="tel" required maxlength="12"> 
  </div>
  </td>
  
  <td colspan="1">
  <div class="form-group">
    <input type="text" class="form-control" id="tel2" placeholder="Informe outro telefone" name="tel2" pattern="^\d{2}\d{4,5}\d{4}$" title="Digite só numeros. Ex: 3132438352" maxlength="12">
  </div>
  </td></tr>
  
  <tr><td colspan="3">
  <div class="form-group">
    <input type="text" class="form-control" id="cel" placeholder="Informe seu cel" name="cel" pattern="^\d{2}\d{4,5}\d{4}$" title="Digite só numeros. Ex: 3132438352" maxlength="12">
  </div>
  </td></tr>
 
 <tr><td colspan="3">
  <button type="submit" class="btn btn-success btn-block">Cadastrar</button>
  </td></tr>
  </table>
      </form>
    </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>