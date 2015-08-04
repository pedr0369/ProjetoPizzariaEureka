package br.gov.eureka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.gov.eureka.conexao.Conexao;
import br.gov.eureka.model.Atendimento;
import br.gov.eureka.model.Detalhamento;

public class DetalhamentoDao {
	
	
	// a conexão com o banco de dados
	
				private Connection connection;
				
				public DetalhamentoDao() throws SQLException {
					this.connection = Conexao.getConnection();
				}
				
				public void adicionarDetalhamento(Detalhamento detalhamento) throws SQLException {
					
					// prepared statement para inserção
					
					PreparedStatement stmt = this.connection.prepareStatement("insert into detalhamento (Id_ped, Quant, Sub_total)" 
							+ "values (?,?,?)");
					
							// seta os valores
					
							stmt.setInt(1,detalhamento.getIdPedido());
							stmt.setInt(2,detalhamento.getQuantidadePedido());
							stmt.setDouble(3,detalhamento.getSubTotal());
							
							
							// executa
							
							stmt.execute();
							stmt.close();
				}
				
				
				
				public String consultarDetalhamento(Detalhamento detalhamento) throws SQLException{
				    PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM detalhamento where Id_prod=?");
				    ResultSet resultado = stmt.executeQuery();
				     		         
				    stmt.execute();
				    stmt.close();
					return null;
				  
		     
		}
					
					
					
					public void alterarDetalhamento(Detalhamento detalhamento) throws SQLException {
						// prepared statement para inserção
						PreparedStatement stmt = 
						this.connection.prepareStatement("update detalhamento set Id_ped=?, Quant=?, Sub_total=? where Id_prod=?");
								// seta os valores
								stmt.setInt(1,detalhamento.getIdPedido());
								stmt.setInt(2,detalhamento.getQuantidadePedido());
								stmt.setDouble(3,detalhamento.getSubTotal());
								
								
								
								// executa
								stmt.execute();
								stmt.close();	
					
			}
					
					public void excluirDetalhamento(Detalhamento detalhamento){
						
						try {
					PreparedStatement stmt = this.connection.prepareStatement("DELETE FROM detalhamento WHERE Id_prod=?");
					// seta os valores
					
					
					
					stmt.setInt(1,detalhamento.getIdProduto());
					
					
					
					//executa
					stmt.execute();
					stmt.close();	
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}	
					
					}		
		
		
		
	
	
	
	
	
	
	
	
	

}
