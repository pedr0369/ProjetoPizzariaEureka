<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<% //Verifica se está logado
if(session.getValue("loginRelat") != null || session.getValue("senhaRelat") != null || session.getValue("funcaoRelat") == "2"){
} else {
	out.println("<script>alert('Login ou senha inválidos'); top.location.href='index.jsp';</script>"); //Exibe na tela e pede para voltar
}
%>

<link rel="shortcut icon" href="img/logo1.png"/>
<jsp:include page="header.jsp"></jsp:include>

			<h3 class="text-center">Relatório Gerencial </h3><br><br>			

<div class="container">
	<div class="row">		
		<div class="col-sm-10 princ">	
<table class="table table-hover">
			<form method="post" action="ValidaRelatorio.jsp">
					<tr>
					<th>Período: </th>
					<td><INPUT TYPE="RADIO" NAME="periodo" VALUE="Data_atend = curdate()" checked> Dia</td>
					<td><INPUT TYPE="RADIO" NAME="periodo" VALUE="WEEK(Data_atend) = WEEK(curdate()) order by Data_atend"> Semana</td>					
					<td><INPUT TYPE="RADIO" NAME="periodo" VALUE="MONTH(Data_atend) = MONTH(curdate()) order by Data_atend"> Mês</td>
					</tr>

					<tr>
					<th>Sistema: </th>
					<td><INPUT TYPE="RADIO" NAME="sist" VALUE="pedido"> Site</td>
					<td><INPUT TYPE="RADIO" NAME="sist" VALUE="atendimento" checked> Sistema de Atendimento</td>
					</tr>
			</table>
		</div><!-- div principal -->
		
		<div class="col-sm-2">
			<input type="submit" value="Gerar Relatorio" class="btn btn-success btn-block"></form>
		</div>
	</div>
</div>

<c:if test="${RelatorioAtendimento != null}">


<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate var="data" value="${now}" type="date"/>

<div class="container">
	<div class="row">
		<div class="col-sm-12">
<br><br><br>			
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title panel-success text-center"><b>Vendas</b> </h3>
  				</div>
  				
  				<div class="panel-body">
  				    				
    				<div class="col-sm-8 well">
    					 <div class="table table-responsive"><table border="0" class="table table-striped">

				<tr>	
               	<th>Atendente</th>
                <th>Descricao</th>
                <th>Valor</th>
                </tr>

            <c:forEach var="RelatorioAtendimento" items="${RelatorioAtendimento.rows}">
                <tr>
 					<td><c:out value="${RelatorioAtendimento.Nome_pessoa}"/></td>
                	<td><c:out value="${RelatorioAtendimento.Desc_atend}"/></td>
					<td><fmt:formatNumber type="currency"  value="${RelatorioAtendimento.Valor}"  /></td>
                </tr>
            </c:forEach>
            
        </table></div>						    					
    				</div>
    				
    <div class="col-sm-4">
    	<div class="col-sm-12 well">
    					
    <c:forEach var="ValorTotal" items="${ValorTotal.rows}">
		<div class="alert alert-success" role="alert">
  					Total: <b><fmt:formatNumber type="currency"  value="${ValorTotal.Total}"  /></b><br></c:forEach>
  					Total de Atendimentos: <c:forEach var="atendTotal" items="${totalAtend.rows}"><b>${atendTotal.total}</b></c:forEach>
		</div>

    	</div>
    					
    	<div class="col-sm-12 well">
			 <table border="0" class="table table-striped">
                <tr><th colspan="2">Atendimentos Detalhados:</th></tr>
                <tr>
                	<td>Atendente</td>
                	<td>Qrde. Atendimentos</td>
                </tr>

                <c:forEach var="Contador" items="${Qtd_atend.rows}">
                <tr>
					<td><c:out value="${Contador.Nome_pessoa}"/></td>
                    <td><c:out value="${Contador.atendimentos}"/> </td>
				</tr>
                </c:forEach>
        	</table>		
    	</div>

<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target=".bs-example-modal-lg">
  Relatório Detalhado
</button>

<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Detalhamento das vendas no período</h4>
      </div>
      <div class="modal-body">

    					 <div class="table table-bordered">
        <table border="0" class="table table-responsive">

            <thead>
            	<th>Data</th>
				<th>Hora</th>
               	<th>Atendente</th>
				<th>Nro.</th>
                <th>Descricao</th>
                <th>Valor</th>
                <th>Forma Pagamento</th>
            </thead>

            <c:forEach var="RelatorioDetalhado" items="${RelatorioDetalhado.rows}">

                <tr>
					<td><c:out value="${RelatorioDetalhado.Data_atend}"/></td>
					<td><c:out value="${RelatorioDetalhado.Hora_atend}"/></td>					
 					<td><c:out value="${RelatorioDetalhado.Nome_pessoa}"/></td>                 
					<td><c:out value="${RelatorioDetalhado.Nro_atend}"/></td>                   
                   	<td><c:out value="${RelatorioDetalhado.Desc_atend}"/></td>
				   	<td><fmt:formatNumber type="currency"  value="${RelatorioDetalhado.Valor}"  /></td>				   
				  	<td><c:out value="${RelatorioDetalhado.Form_pag_atend}"/></td>
                </tr>

                </c:forEach>

        </table>		
    				</div>    				
    					</div>

      </div>

    </div>
  </div>
</div><!-- div da parte direita da seção de relatórios -->
    					
    				</div>
    				
  				</div>
			</div>
			
		</div>
	</div><!-- container geral do relatorio -->

</c:if>
<jsp:include page="footer.jsp"></jsp:include>