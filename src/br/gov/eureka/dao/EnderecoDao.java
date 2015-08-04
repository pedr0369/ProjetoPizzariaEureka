package br.gov.eureka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.gov.eureka.conexao.Conexao;
import br.gov.eureka.model.Endereco;

public class EnderecoDao {
		
		// a conexão com o banco de dados		
			private Connection connection;
			
			public EnderecoDao() throws SQLException {
				this.connection = Conexao.getConnection();
			}
			
			public void adiciona(Endereco endereco) throws SQLException {				
				// prepared statement para inserção
				
				PreparedStatement stmt = 
				this.connection.prepareStatement("insert into endereco (Rua_end, Comp_end, Cep_end,"
						+ "Bairro_end, Cidade_end, Estado_end) "
						+ "values (?,?,?,?,?,?)");
				
						// seta os valores
						stmt.setString(1,endereco.getRuaEndereco());
						stmt.setString(2, endereco.getComplementoEndereco());
						stmt.setString(3, endereco.getCepEndereco());
						stmt.setString(4, endereco.getBairroEndereco());
						stmt.setString(5, endereco.getCidadeEndereco());
						stmt.setString(6, endereco.getEstadoEndereco());
						// executa
						
						stmt.execute();
						stmt.close();
			}
			
			public List<Endereco> consultando() throws SQLException{
				PreparedStatement stmt =
						this.connection.prepareStatement("select max(Id_end) from endereco");
				ResultSet resultado = stmt.executeQuery();
				
				List<Endereco> lista = new ArrayList<Endereco>();
				
				while(resultado.next()){
					Endereco cadastro = new Endereco();
						cadastro.setIdEndereco(resultado.getInt("max(Id_end)"));
						lista.add(cadastro);
				}
				
				resultado.close();
				stmt.close();
				
				return lista;
			}
			
			public void alterarEndereco(Endereco endereco) throws SQLException {
				// prepared statement para inserção
				PreparedStatement stmt = 
				this.connection.prepareStatement("update endereco set Rua_end=?, Comp_end=?, Cep_end=?, Bairro_end=?, Cidade_end=?, Estado_end=? where Id_end=?");
						// seta os valores
						stmt.setString(1,endereco.getRuaEndereco());
						stmt.setString(2,endereco.getComplementoEndereco());
						stmt.setString(3,endereco.getCepEndereco());
						stmt.setString(4,endereco.getBairroEndereco());
						stmt.setString(5,endereco.getCidadeEndereco());
						stmt.setString(6,endereco.getEstadoEndereco());		
						// executa
						stmt.execute();
						stmt.close();	
			}
			
			
			public void deletar(Endereco endereco){				
				try {
			PreparedStatement stmt = this.connection.prepareStatement("DELETE FROM endereco WHERE Id_end=?");
			
			//executa
			stmt.setLong(1,endereco.getIdEndereco());			
			
			stmt.execute();
			stmt.close();	
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
}
		
	}
