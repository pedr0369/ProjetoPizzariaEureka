package br.gov.eureka.model;

public class Pessoa {
	
	//criação dos atributos privados
	
	private int idCliente;
	private String nomeCliente;
	private String usuarioCliente;
	private String senhaCliente;
	private String emailCliente;
	private String telefoneCliente;
	private String telefone1Cliente;
	private String celularCliente;
	private int idEndereco;
	private String nvl_acesso;
	
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public String getNomeCliente() {
		return nomeCliente;
	}
	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}
	public String getUsuarioCliente() {
		return usuarioCliente;
	}
	public void setUsuarioCliente(String usuarioCliente) {
		this.usuarioCliente = usuarioCliente;
	}
	public String getSenhaCliente() {
		return senhaCliente;
	}
	public void setSenhaCliente(String senhaCliente) {
		this.senhaCliente = senhaCliente;
	}
	public String getEmailCliente() {
		return emailCliente;
	}
	public void setEmailCliente(String emailCliente) {
		this.emailCliente = emailCliente;
	}
	public String getTelefoneCliente() {
		return telefoneCliente;
	}
	public void setTelefoneCliente(String telefoneCliente) {
		this.telefoneCliente = telefoneCliente;
	}
	public String getTelefone1Cliente() {
		return telefone1Cliente;
	}
	public void setTelefone1Cliente(String telefone1Cliente) {
		this.telefone1Cliente = telefone1Cliente;
	}
	public String getCelularCliente() {
		return celularCliente;
	}
	public void setCelularCliente(String celularCliente) {
		this.celularCliente = celularCliente;
	}
	public int getIdEndereco() {
		return idEndereco;
	}
	public void setIdEndereco(int idEndereco) {
		this.idEndereco = idEndereco;
	}
	
	public String getNvlAcesso(){
		return nvl_acesso;
	}
	
	public void setNvlAcesso(String nvl_acesso){
		this.nvl_acesso = nvl_acesso;
	}

	}