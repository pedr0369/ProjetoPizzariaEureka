<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="br.gov.eureka.dao.*, br.gov.eureka.model.*, java.util.List, java.util.ArrayList" %>
<link rel="shortcut icon" href="imagens/logo.jpg"/>
<%
//Verifica se está logado
if(session.getValue("loginAtend") != null || session.getValue("senhaAtend") != null || session.getValue("funcaoAtend") == "1"){
} else {
	out.println("<script>alert('Login ou senha inválidos'); top.location.href='index.jsp';</script>"); //Exibe na tela e pede para voltar
}

request.getAttribute("lista");
%>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">
<div class="row qtd_atend well">

<sql:setDataSource var="ds"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>
<sql:query var="atend" dataSource="${ds}">
Select count(a.Nro_atend) as "atendimentos" from atendimento a natural join pessoa p where p.Usuario_pessoa = '${loginAtend}' and a.Data_atend = curdate();
</sql:query>

<c:forEach var="qtde" items="${atend.rows}">
Atendimento nº: <c:out value="${qtde.atendimentos + 1}"/>
</c:forEach>
<c:set var="now" value="<%=new java.util.Date()%>" />
<span>/ Data: </span> <fmt:formatDate value="${now}" type="date"/>

</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-sm-12 col-md-8 col-md-offset-2 princ">

			<div class="col-md-5 col-sm-5 cod_prod well">
				<h4 class="text-center"><strong>Adicione um produto</strong></h4>
				<br>
<form method="post" action="consultaProd.jsp">
				<div class="input-group">
  					<span class="input-group-addon" id="basic-addon1">Cód</span>
  					<input type="text" class="form-control input input-lg" aria-describedby="basic-addon1" name="cod" required>  					
				</div>
				<br><button type="submit" class="btn btn-default btn-md btn-block"><span class="glyphicon glyphicon-edit"></span> Consultar</button><hr>
</form>
				
				<table class="table table-hover">
					<tr>
						<th style="text-align:center;">Produto</th>
						
						<c:if test="${is_pizza == true}">
							<th style="text-align:center;">Tamanho</th>
						</c:if>
						
						<c:if test="${is_pizza == false}">
							<th style="text-align:center;">Preço</th>
						</c:if>
					</tr>

					<tr>
						<td><input type="text" disabled class="form-control input input-sm" name="nome" value="${nome}"></td>
						
						<c:if test="${is_pizza == false}">
							<td><input type="text" disabled class="form-control input input-sm" name="preco" value="R$ ${preco}"></td>
						</c:if>
						
<form action="ListaPed.jsp" method="post" name="teste">

						<c:if test="${is_pizza == true}">
							<td><select required="required" class="form-control" name="tamanho" >
							  <option value=0>Peq.</option>
							  <option value=0.30>Media</option>
							  <option value=0.50>Grande</option>
							  <option value=0.70>Gigante</option>
							</select></td>
						</c:if>
					</tr>
				
				<tr>				
				<c:if test="${nome != null}">
				<input type="hidden" name="preco" value="${preco}"><input type="hidden" name="nome" value="${nome}">
				<td colspan="2"><button type="submit" class="btn btn-default btn-md btn-block" value="adicionar"><span class="glyphicon glyphicon-ok" ></span> Adicionar</button></td>
				</c:if>		
</tr></table>
</form>
      </div>

			<div class="col-md-6 col-sm-6 col-sm-offset-1 detalhamento well">
				
				<div class="alert alert-success text-center" style="box-shadow: 1px 1px 4px black;">
					Lista de Itens
				</div>
				
				<table class="table table-hover table-bordered">
				
					<tr>
						<th># Produto</th>
						<th>Preço</th>
					</tr>
			<% int i = 1; %>
			
<sql:setDataSource var="con"
driver = "com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session"
/>
<sql:query var="listagem" dataSource="${con}">
SELECT * FROM lista where usuario = '${loginAtend}';
</sql:query>
		
<c:forEach var="listando" items="${listagem.rows}">
<tr>
<td><%= i %> - <c:out value="${listando.produto}"/></td>
<td><c:out value="${listando.preco }"/> <a href="exclui_item.jsp?item=${listando.produto}"><span class="glyphicon glyphicon-trash pull-right"></span></a> </td>
<c:set var="total" value="${total + listando.preco }"></c:set>
<% i++; %>
</c:forEach>
					
					<tr>
  					<td colspan="2">
  					<form action="verificar_lista.jsp" method="post">
  					<div class="input-group">
  					<span class="input-group-addon" id="basic-addon1">Total</span>
  					<input type="text" class="form-control input input-lg" maxlength="5" aria-describedby="basic-addon1" value="${total}" disabled></div>
  					</td>				
					</tr>
					
					<tr>
						<td colspan="2"><div class="input-group">
						<% if(request.getParameter("vlr_recebido") == null){ %>
  							<span class="input-group-addon" id="basic-addon1">Valor Recebido:</span>
  							<input type="text" class="form-control input input-md" aria-describedby="basic-addon1" maxlength="5" name="vlr_recebido" required></div>
  						<% } %>
  						
  						<% if(request.getParameter("vlr_recebido") != null) { %>
  							<span class="input-group-addon" id="basic-addon1">Troco:</span>
  							<input type="text" class="form-control input input-md" aria-describedby="basic-addon1" maxlength="5" id="troco" disabled value="R$ <%= request.getAttribute("troco") %>"></div>
  						<% } %>
  						</td>					
					</tr>	
					
					<tr>
					<% if(request.getParameter("vlr_recebido") == null){ %>
						<input type="hidden" name="total" value="${total}">
						<td colspan="2"><input type="submit" value="Enviar" class="btn btn-danger btn-block">
					<% }else { %>
						<td colspan="2"><a href="finaliza_atend.jsp" class="btn btn-success btn-block ">Finalizar Atendimento</a></td>
					<% } %>
					</tr>		
					</form>
				</table>
				
			</div> <!-- div do detalhamento -->
		</div><!-- div principal -->
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>