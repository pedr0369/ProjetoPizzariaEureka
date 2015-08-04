package br.gov.eureka.action;

import java.sql.SQLException;

import br.gov.eureka.conexao.Conexao;

public class Principal {

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		
		// Instanciando a classe Conectar para conferir se a conexão ao
		// banco foi bem sucedida.
						
		Conexao.getConnection();
		
		
	}

}
