package br.gov.eureka.model;

public class ListaPed1 {

	private String ProdutoCons = "";
	private double PrecoCons = 0.0;
	
	public ListaPed1(String ProdutoCons, double PrecoCons){
		this.ProdutoCons = ProdutoCons;
		this.PrecoCons = PrecoCons;
	}
	
	public ListaPed1(){
		
	}
	
	public String getConsProd(){
		return this.ProdutoCons;
	}
	
	public void setConsProd(String ProdutoCons){
		this.ProdutoCons = ProdutoCons;
	}
	
	public double getConsPreco(){
		return this.PrecoCons;
	}
	
	public void setConsPreco(double PrecoCons){
		this.PrecoCons = PrecoCons;
	}
	
	
}
