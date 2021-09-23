package model;

import java.util.Date;

public class Jogos {
	private int id;
	private String nome;
	private Date dataDeLancamento;
	private String genero;
	private String descricao;
	private String classificacao;
	private double valor;
	private String fornecedor;
	private String caminhoImagem;
	private String caminhoTrailer;

	public Jogos() {
	}

	public Jogos(int id, String nome, Date dataDeLancamento, String genero, String descricao, String classificacao,
			double valor, String fornecedor, String caminhoImagem, String caminhoTrailer) {
		this.id = id;
		this.nome = nome;
		this.dataDeLancamento = dataDeLancamento;
		this.genero = genero;
		this.descricao = descricao;
		this.classificacao = classificacao;
		this.valor = valor;
		this.fornecedor = fornecedor;
		this.caminhoImagem = caminhoImagem;
		this.caminhoTrailer = caminhoTrailer;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDataDeLancamento() {
		return dataDeLancamento;
	}

	public void setDataDeLancamento(Date dataDeLancamento) {
		this.dataDeLancamento = dataDeLancamento;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getClassificacao() {
		return classificacao;
	}

	public void setClassificacao(String classificacao) {
		this.classificacao = classificacao;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public String getCaminhoImagem() {
		return caminhoImagem;
	}

	public void setCaminhoImagem(String caminhoImagem) {
		this.caminhoImagem = caminhoImagem;
	}

	public String getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(String fornecedor) {
		this.fornecedor = fornecedor;
	}

	public String getCaminhoTrailer() {
		return caminhoTrailer;
	}

	public void setCaminhoTrailer(String caminhoTrailer) {
		this.caminhoTrailer = caminhoTrailer;
	}
}
