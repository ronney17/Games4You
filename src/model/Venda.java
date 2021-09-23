package model;

public class Venda {
	private int id;
	private Cliente cliente;
	private String formadepagamento ;
	private String nomeCartao;
	private String numeroCartao;
	private String validadeCartao;
	private String cvvCartao;
	private int parcelasCartao;

	public Venda() {
	}

	public Venda(Cliente cliente, String formadepagamento, String nomeCartao, String numeroCartao,
			String validadeCartao, String cvvCartao, int parcelasCartao) {
		super();
		this.cliente = cliente;
		this.formadepagamento = formadepagamento;
		this.nomeCartao = nomeCartao;
		this.numeroCartao = numeroCartao;
		this.validadeCartao = validadeCartao;
		this.cvvCartao = cvvCartao;
		this.parcelasCartao = parcelasCartao;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public String getFormadepagamento() {
		return formadepagamento;
	}

	public void setFormadepagamento(String formadepagamento) {
		this.formadepagamento = formadepagamento;
	}

	public String getNomeCartao() {
		return nomeCartao;
	}

	public void setNomeCartao(String nomeCartao) {
		this.nomeCartao = nomeCartao;
	}

	public String getNumeroCartao() {
		return numeroCartao;
	}

	public void setNumeroCartao(String numeroCartao) {
		this.numeroCartao = numeroCartao;
	}

	public String getValidadeCartao() {
		return validadeCartao;
	}

	public void setValidadeCartao(String validadeCartao) {
		this.validadeCartao = validadeCartao;
	}

	public String getCvvCartao() {
		return cvvCartao;
	}

	public void setCvvCartao(String cvvCartao) {
		this.cvvCartao = cvvCartao;
	}

	public int getParcelasCartao() {
		return parcelasCartao;
	}

	public void setParcelasCartao(int parcelasCartao) {
		this.parcelasCartao = parcelasCartao;
	}

}