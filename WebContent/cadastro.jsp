<%@ page import="br.gov.eureka.dao.*, br.gov.eureka.model.*, java.util.List, java.util.ArrayList" %>
<link rel="shortcut icon" href="imagens/logo.jpg"/>
<%

Pessoa client = new Pessoa();
Endereco cadastro = new Endereco();	
EnderecoDao endereco = new EnderecoDao();
PessoaDao cliente = new PessoaDao();

client.setNomeCliente(request.getParameter("nome"));
client.setUsuarioCliente(request.getParameter("usuario"));
client.setSenhaCliente(request.getParameter("senha"));
String rep_senha = request.getParameter("rep_senha");
client.setEmailCliente(request.getParameter("email"));
cadastro.setRuaEndereco(request.getParameter("rua"));
cadastro.setComplementoEndereco(request.getParameter("complemento"));
cadastro.setCepEndereco(request.getParameter("cep"));
cadastro.setBairroEndereco(request.getParameter("bairro"));
cadastro.setCidadeEndereco(request.getParameter("cidade"));
cadastro.setEstadoEndereco(request.getParameter("estado"));
client.setTelefoneCliente(request.getParameter("tel"));
client.setTelefone1Cliente(request.getParameter("tel2"));
client.setCelularCliente(request.getParameter("cel"));

List<Pessoa> listaUsuario = new ArrayList<Pessoa>();
listaUsuario = cliente.consultaUser(request.getParameter("usuario"));

//if para saber se já existe usuario no sistema
if(listaUsuario.size() == 0){

//if para saber se a senha é igual repete senha
if(client.getSenhaCliente().equals(rep_senha)){
	
endereco.adiciona(cadastro);
List<Endereco> lista = new ArrayList<Endereco>();
lista = endereco.consultando();

int[] id = new int[1];
for(int i = 0; i < lista.size(); i++){
	id[0] = lista.get(i).getIdEndereco();
}

client.setIdEndereco(id[0]);
cliente.adiciona(client);
out.println("<script>alert('Cadastro realizado com sucesso, agora já pode realizar seu login');document.location.href='index.jsp';</script>");
}else {
	out.println("<script>alert('As senhas não são iguais');history.back(-1);</script>");
}
//if para ver se usuario existe
}
else{
	out.println("<script>alert('Usuario já existe');history.back(-1);</script>");
}

%>
