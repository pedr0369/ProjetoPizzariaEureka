package br.gov.eureka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.gov.eureka.conexao.Conexao;
import br.gov.eureka.model.Atendimento;

public class AtendimentoDao {

	// a conexão com o banco de dados
	
			private Connection connection;
			
			public AtendimentoDao() throws SQLException {
				this.connection = Conexao.getConnection();
			}
			
			public void adicionarAtendimento(Atendimento atendimento) throws SQLException {
				
				// prepared statement para inserção
				
				PreparedStatement stmt = this.connection.prepareStatement("insert into atendimento (Nro_atend, Data_atend, Hora_atend, Desc_atend, Form_pag_atend, Id_func)" 
						+ "values (?,?,?,?,?,?)");
				
						// seta os valores
				
						stmt.setInt(1,atendimento.getNumeroAtendimento());
						stmt.setString(2,atendimento.getDataAtendimento());
						stmt.setString(3,atendimento.getHoraAtendimento());
						stmt.setString(4,atendimento.getDescricaoAtendimento());
						stmt.setString(5,atendimento.getFormaPagamento());
						stmt.setInt(6,atendimento.getIdFuncionario());
						
						
						// executa
						
						stmt.execute();
						stmt.close();
			}
			
			
			
			public String consultarAtendimento(Atendimento atendimento) throws SQLException{
			    PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM atendimento where Id_atend=?");
			    ResultSet resultado = stmt.executeQuery();
			     		         
			    stmt.execute();
			    stmt.close();
				return null;
			  
	     
	}
				
				
				
				public void alterarAtendimento(Atendimento atendimento) throws SQLException {
					// prepared statement para inserção
					PreparedStatement stmt = 
					this.connection.prepareStatement("update atendimento set Nro_atend=?, Data_atend=?, Hora_atend=?, Desc_atend=?, Form_pag_atend=?, Id_func=? where Id_atend=?");
							// seta os valores
							stmt.setInt(1,atendimento.getNumeroAtendimento());
							stmt.setString(2,atendimento.getDataAtendimento());
							stmt.setString(3,atendimento.getHoraAtendimento());
							stmt.setString(4,atendimento.getDescricaoAtendimento());
							stmt.setString(5,atendimento.getFormaPagamento());
							stmt.setInt(6,atendimento.getIdFuncionario());
							
							
							
							
							
							
							
							
							
							// executa
							stmt.execute();
							stmt.close();	
				
		}
				
				public void excluirAtendimento(Atendimento atendimento){
					
					try {
				PreparedStatement stmt = this.connection.prepareStatement("DELETE FROM atendimento WHERE Id_atend=?");
				// seta os valores
				
				
				
				stmt.setInt(1,atendimento.getIdAtendimento());
				
				
				
				//executa
				stmt.execute();
				stmt.close();	
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
				
				}		
	
	
	
	
	
}
