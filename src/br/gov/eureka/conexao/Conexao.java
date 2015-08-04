package br.gov.eureka.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexao {

		public static Connection getConnection() throws SQLException {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("Conectado com sucesso à base de dados!");
				return DriverManager.getConnection("jdbc:mysql://localhost/eureka","root", "");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e.getMessage());
			}
		}
	}
	
