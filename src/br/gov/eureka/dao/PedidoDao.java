package br.gov.eureka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.gov.eureka.conexao.Conexao;
import br.gov.eureka.model.Atendimento;
import br.gov.eureka.model.Pedido;

public class PedidoDao {

	
	// a conexão com o banco de dados
	
				private Connection connection;
				
				public PedidoDao() throws SQLException {
					this.connection = Conexao.getConnection();
				}
				
				public void adicionarPedido(Pedido pedido) throws SQLException {
					
					// prepared statement para inserção
					
					PreparedStatement stmt = this.connection.prepareStatement("insert into pedido (Nro_ped, Data_ped, Hora_ped, Situacao_ped, Id_func, Id_cli)" 
							+ "values (?,?,?,?,?,?)");
					
							// seta os valores
					
							stmt.setInt(1,pedido.getNumPedido());
							stmt.setString(2,pedido.getDataPedido());
							stmt.setString(3,pedido.getHoraPedido());
							stmt.setString(4,pedido.getSituacaoPedido());
							stmt.setString(5,pedido.getSituacaoPedido());
							stmt.setInt(6,pedido.getIdFuncionario());
							stmt.setInt(6,pedido.getIdCliente());
							
							
							
							// executa
							
							stmt.execute();
							stmt.close();
				}
				
				
				
				public String consultarPedido(Pedido pedido) throws SQLException{
				    PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM pedido where Id_ped=?");
				    ResultSet resultado = stmt.executeQuery();
				     		         
				    stmt.execute();
				    stmt.close();
					return null;
				  
		     
		}
					
					
					
					public void alterarPedido(Pedido pedido) throws SQLException {
						// prepared statement para inserção
						PreparedStatement stmt = 
						this.connection.prepareStatement("update pedido set Nro_ped=?, Data_ped=?, Hora_ped=?, Situacao_ped=?, Id_func=?, Id_cli=? where Id_ped=?");
								// seta os valores
								stmt.setInt(1,pedido.getNumPedido());
								stmt.setString(2,pedido.getDataPedido());
								stmt.setString(3,pedido.getHoraPedido());
								stmt.setString(4,pedido.getSituacaoPedido());
								stmt.setInt(5,pedido.getIdFuncionario());
								stmt.setInt(6,pedido.getIdCliente());
								
								
								
								
								
								
								
								// executa
								stmt.execute();
								stmt.close();	
					
			}
					
					public void excluirPedido(Pedido pedido){
						
						try {
					PreparedStatement stmt = this.connection.prepareStatement("DELETE FROM pedido WHERE Id_ped=?");
					// seta os valores
					
					
					
					stmt.setInt(1,pedido.getIdPedido());
					
					
					
					//executa
					stmt.execute();
					stmt.close();	
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}	
					
					}		
		
		
	
	
	
}
