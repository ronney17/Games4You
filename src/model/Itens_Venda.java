package model;

public class Itens_Venda {
	private int id;
	private Venda venda;
	private Jogos jogos;
	private int quantidade;
	
	public Itens_Venda() {
	}
	
	public Itens_Venda(int id, int quantidade, Jogos jogos, Venda venda) {
		this.id = id;
		this.quantidade = quantidade;
		this.jogos = jogos;
		this.venda = venda;
	}
	
	public Itens_Venda(int id, int quantidade) {
		this.id = id;
		this.quantidade = quantidade;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public Jogos getJogos() {
		return jogos;
	}
	public void setJogos(Jogos jogos) {
		this.jogos = jogos;
	}
	public Venda getVenda() {
		return venda;
	}
	public void setVenda(Venda venda) {
		this.venda = venda;
	}
	
	
}