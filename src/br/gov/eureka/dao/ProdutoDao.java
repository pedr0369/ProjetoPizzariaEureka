package br.gov.eureka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.gov.eureka.conexao.Conexao;
import br.gov.eureka.model.Pessoa;
import br.gov.eureka.model.Produto;

public class ProdutoDao {
	
	
		
		// a conexão com o banco de dados
		
			private Connection connection;
			
			public ProdutoDao() throws SQLException {
				this.connection = Conexao.getConnection();
			}
			
			public void adicionarProduto(Produto produto) throws SQLException {
				
				// prepared statement para inserção
				
				PreparedStatement stmt = this.connection.prepareStatement("insert into produto (Nome_prod, Preco_prod, Desc_prod, Pizza_prod) "
						+ "values (?,?,?,?)");
				
						// seta os valores
				
						stmt.setString(1,produto.getNomeProduto());
						stmt.setDouble(2,produto.getPrecoProduto());
						stmt.setString(3,produto.getDescProduto());
						stmt.setBoolean(4,produto.getPizzaProduto());
						
						
						
											
						// executa
						
						stmt.execute();
						stmt.close();
			}
			

			public List<Produto> consultarProduto(String id) throws SQLException{
			    PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto where Id_prod= " + id);
			    ResultSet resultado = stmt.executeQuery();
			     	
			    List<Produto> listaProd = new ArrayList<Produto>();
			    
			    while(resultado.next()){
					Produto produto = new Produto();
						produto.setNomeProduto(resultado.getString("Nome_prod"));
						produto.setPrecoProduto(resultado.getDouble("Preco_prod"));
						
						listaProd.add(produto);
				}
			    
			    resultado.close();
			    stmt.close();
				return listaProd;	     
			}
				
				
				
				public void alterarProduto(Produto produto) throws SQLException {
					// prepared statement para inserção
					PreparedStatement stmt = 
					this.connection.prepareStatement("update produto set Nome_prod=?, Preco_prod=?, Desc_prod=?, Pizza_prod=? where Id_prod=?");
							// seta os valores
							stmt.setString(1,produto.getNomeProduto());
							stmt.setDouble(2,produto.getPrecoProduto());
							stmt.setString(3,produto.getDescProduto());
							stmt.setBoolean(4,produto.getPizzaProduto());
							
							
							// executa
							stmt.execute();
							stmt.close();	
				
		}
				
				public void excluirProduto(Produto produto){
					
					try {
				PreparedStatement stmt = this.connection.prepareStatement("DELETE FROM produto WHERE Id_prod=?");
				// seta os valores
				
				
				//executa
				stmt.execute();
				stmt.close();	
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
				
				}		
	}