package br.gov.eureka.model;

public class Produto {

	private String idProduto;
	private String nomeProduto;
	private double precoProduto;
	private String descProduto;
	private boolean pizzaProduto = false;
	
	public String getIdProduto() {
		return idProduto;
	}
	public void setIdProduto(String idProduto) {
		this.idProduto = idProduto;
	}
	public String getNomeProduto() {
		return nomeProduto;
	}
	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}
	public double getPrecoProduto() {
		return precoProduto;
	}
	public void setPrecoProduto(double precoProduto) {
		this.precoProduto = precoProduto;
	}
	public String getDescProduto() {
		return descProduto;
	}
	public void setDescProduto(String descProduto) {
		this.descProduto = descProduto;
	}
	public boolean getPizzaProduto() {
		return pizzaProduto;
	}
	public void setPizzaProduto(boolean pizzaProduto) {
		this.pizzaProduto = pizzaProduto;
	}
	
}
