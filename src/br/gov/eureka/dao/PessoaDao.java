package br.gov.eureka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.gov.eureka.conexao.Conexao;
import br.gov.eureka.model.Pessoa;

public class PessoaDao {
	
	// a conexão com o banco de dados
	
		private Connection connection;
		
		public PessoaDao() throws SQLException {
			this.connection = Conexao.getConnection();
		}
		
		public void adiciona(Pessoa client) throws SQLException {
			
			// prepared statement para inserção
			
			PreparedStatement stmt = 
			this.connection.prepareStatement("insert into pessoa (Nome_pessoa, Usuario_pessoa, Senha_pessoa,"
					+ "Email_pessoa, Tel_pessoa, Tel1_pessoa, Cel_pessoa, Id_end) "
					+ "values (?,?,?,?,?,?,?,?)");
			
					// seta os valores
					stmt.setString(1,client.getNomeCliente());
					stmt.setString(2, client.getUsuarioCliente());
					stmt.setString(3, client.getSenhaCliente());
					stmt.setString(4, client.getEmailCliente());
					stmt.setString(5, client.getTelefoneCliente());
					stmt.setString(6, client.getTelefone1Cliente());
					stmt.setString(7, client.getCelularCliente());
					stmt.setInt(8, client.getIdEndereco());
															
					// executa
					stmt.execute();
					stmt.close();
		}
		
		public List<Pessoa> consulta(String login, String senha, String funcao) throws SQLException{
			PreparedStatement stmt =
					this.connection.prepareStatement("select * from pessoa where Usuario_pessoa = '" + login + "' and Senha_pessoa = '" + senha + "' and Nvl_acesso = " + funcao);
			ResultSet resultado = stmt.executeQuery();
			
			List<Pessoa> listaClientes = new ArrayList<Pessoa>();
			
			while(resultado.next()){
				Pessoa client = new Pessoa();
					client.setUsuarioCliente(resultado.getString("Usuario_pessoa"));
					client.setSenhaCliente(resultado.getString("Senha_pessoa"));
					client.setNvlAcesso(resultado.getString("Nvl_acesso"));
					
					listaClientes.add(client);
			}
			
			resultado.close();
			stmt.close();
			
			return listaClientes;
		}
		
		public void alterarCliente(Pessoa cliente) throws SQLException {
			// prepared statement para inserção
			PreparedStatement stmt = this.connection.prepareStatement("update pessoa set Nome_pessoa=?, Usuario_pessoa=?, Senha_pessoa=?, Email_pessoa=?, Tel_pessoa=?, Tel1_pessoa=?, Cel_pessoa=?, Id_End=? where Id_pessoa=?");
					// seta os valores
					stmt.setString(1,cliente.getNomeCliente());
					stmt.setString(2,cliente.getUsuarioCliente());
					stmt.setString(3,cliente.getSenhaCliente());
					stmt.setString(4,cliente.getEmailCliente());
					stmt.setString(5,cliente.getTelefoneCliente());
					stmt.setString(6,cliente.getTelefone1Cliente());
					stmt.setString(7,cliente.getCelularCliente());
					stmt.setInt(8,cliente.getIdEndereco());
					
					// executa
					stmt.execute();
					stmt.close();	
}
		
		public void excluirCliente(Pessoa cliente){
			
			try {
		PreparedStatement stmt = this.connection.prepareStatement("DELETE FROM pessoa WHERE Id_pessoa=?");
		// seta os valores
			
		
		//executa
		stmt.execute();
		stmt.close();	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		
		public List<Pessoa> consultaUser(String login) throws SQLException{
			PreparedStatement stmt =
					this.connection.prepareStatement("select Usuario_pessoa from pessoa where Usuario_pessoa = '" +  login + "'");
			ResultSet resultado = stmt.executeQuery();
			
			List<Pessoa> listaUsuario = new ArrayList<Pessoa>();
			
			while(resultado.next()){
				Pessoa client = new Pessoa();
					client.setUsuarioCliente(resultado.getString("Usuario_pessoa"));
					listaUsuario.add(client);
			}
			
			resultado.close();
			stmt.close();
			
			return listaUsuario;
			
		}
		
}
