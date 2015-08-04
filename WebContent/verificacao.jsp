<%@ page import="br.gov.eureka.dao.PessoaDao, br.gov.eureka.model.*, java.util.List, java.util.ArrayList" %>
<link rel="shortcut icon" href="imagens/logo.jpg"/>
<%
Pessoa client = new Pessoa();
	String funcao = request.getParameter("funcao");
	String login = request.getParameter("login");
	String senha = request.getParameter("senha");
	
 PessoaDao cliente = new PessoaDao();

List<Pessoa> lista_cliente = new ArrayList<Pessoa>();	
lista_cliente = cliente.consulta(login, senha, funcao);

String[] login1 = new String[1];
String[] senha1 = new String[1];
String[] funcao1 = new String[1];

for(Pessoa listando : lista_cliente){
	login1[0] = listando.getUsuarioCliente();
	senha1[0] = listando.getSenhaCliente();
	funcao1[0] = listando.getNvlAcesso();
}

if(lista_cliente.size() == 1){
	if(login.equals(login1[0]) && senha.equals(senha1[0]) && funcao.equals("1")){ //Caso login e senha estejam corretos...
		session.putValue("loginAtend", login); //Grava a session com o Login
		session.putValue("senhaAtend", senha); //Grava a session com a Senha
		session.putValue("funcaoAtend", funcao);
		out.println("<script>document.location.href='atendimento.jsp';</script>"); //Exibe um código javascript para redireionar ao painel
		}
	else if(login.equals(login1[0]) && senha.equals(senha1[0]) && funcao.equals("2")){ //Caso login e senha estejam corretos...
		session.putValue("loginRelat", login); //Grava a session com o Login
		session.putValue("senhaRelat", senha); //Grava a session com a Senha
		session.putValue("funcaoRelat", funcao);
		out.println("<script>document.location.href='relatorio.jsp';</script>"); //Exibe um código javascript para redireionar ao painel
		}
	else if(login.equals(login1[0]) && senha.equals(senha1[0]) && funcao.equals("0")){ //Caso login e senha estejam corretos...
		session.putValue("loginClient", login); //Grava a session com o Login
		session.putValue("senhaClient", senha); //Grava a session com a Senha
		session.putValue("funcaoClient", funcao);
		out.println("<script>document.location.href='index.jsp';</script>"); //Exibe um código javascript para redireionar ao painel
		}
	else if(login.equals(login1[0]) && senha.equals(senha1[0]) && funcao.equals("3")){ //Caso login e senha estejam corretos...
		session.putValue("loginDelivery", login); //Grava a session com o Login
		session.putValue("senhaDelivery", senha); //Grava a session com a Senha
		session.putValue("funcaoDelivery", funcao);
		out.println("<script>document.location.href='delivery.jsp';</script>"); //Exibe um código javascript para redireionar ao painel
		}
}
	else { //Se estiverem incorretos...
		out.println("<script>alert('Login ou senha inválidos'); top.location.href='logar.jsp';</script>"); //Exibe na tela e pede para voltar
	}
%>
