<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="ds"
driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost/eureka"
user="root"
password=""
scope="session" />                                 
                       
<sql:query scope="request" var="RelatorioAtendimento" dataSource="${ds}">
    select p.*, a.* from ${param.sist} a natural join pessoa p where ${param.periodo};
</sql:query>

<sql:query scope="request" var="ValorTotal" dataSource="${ds}">      
    select sum(valor) as "Total" from ${param.sist} where ${param.periodo};
</sql:query>

<c:if test="${param.sist == 'atendimento'}">

<sql:query scope="request" var="Qtd_atend" dataSource="${ds}">
	select p.Nome_pessoa, count(a.Nro_atend) as 'atendimentos' from ${param.sist} a natural join pessoa p where ${param.periodo} ;
</sql:query>

<sql:query scope="request" var="totalAtend" dataSource="${ds}">
select count(Nro_atend) as 'total' from ${param.sist} where ${param.periodo} ;
</sql:query>

</c:if>

<%
RequestDispatcher rd = request.getRequestDispatcher("relatorio.jsp");
rd.forward(request, response);
%>