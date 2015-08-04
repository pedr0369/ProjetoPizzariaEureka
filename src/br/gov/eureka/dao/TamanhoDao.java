package br.gov.eureka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.gov.eureka.conexao.Conexao;
import br.gov.eureka.model.Tamanho;

public class TamanhoDao {
	
	// a conexão com o banco de dados
	
	private Connection connection;
	
	public TamanhoDao() throws SQLException {
		this.connection = Conexao.getConnection();
	}
	
	public void adicionarTamanho(Tamanho tamanho) throws SQLException {
		
		// prepared statement para inserção
		
		PreparedStatement stmt = this.connection.prepareStatement("insert into tamanho (Abrev_tam, Id_prod, Pizza_prod, Percent_prod)" 
				+ "values (?,?,?,?)");
		
				// seta os valores
		
				stmt.setString(1,tamanho.getAbreviacaoTamanho());
				stmt.setInt(2,tamanho.getIdProduto());
				stmt.setBoolean(3,tamanho.getPizzaProduto());
				stmt.setDouble(4,tamanho.getPercentualProduto());				
				
				// executa
				
				stmt.execute();
				stmt.close();
	}
	
	
	
	public String consultarTamanho(Tamanho tamanho) throws SQLException{
	    PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM tamanho where Id_tam=?");
	    ResultSet resultado = stmt.executeQuery();
	     		         
	    stmt.execute();
	    stmt.close();
		return null;
}
		
		
		
		public void alterarTamanho(Tamanho tamanho) throws SQLException {
			// prepared statement para inserção
			PreparedStatement stmt = 
			this.connection.prepareStatement("update tamanho set Abrev_tam=?, Id_prod=?, Pizza_prod=?, Percent_prod=? where Id_tam=?");
					// seta os valores
					stmt.setString(1,tamanho.getAbreviacaoTamanho());
					stmt.setInt(2,tamanho.getIdProduto());
					stmt.setBoolean(3,tamanho.getPizzaProduto());
					stmt.setDouble(4,tamanho.getPercentualProduto());				
					
					// executa
					stmt.execute();
					stmt.close();	
		
}
		
		public void excluirTamanho(Tamanho tamanho){
			
			try {
		PreparedStatement stmt = this.connection.prepareStatement("DELETE FROM tamanho WHERE Id_tam=?");
		// seta os valores
		
		stmt.setInt(1,tamanho.getIdTamanho());

		//executa
		stmt.execute();
		stmt.close();	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}		


}
