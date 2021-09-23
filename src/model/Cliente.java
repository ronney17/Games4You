package model;

import java.util.Date;

public class Cliente{
	private int id;
	private String nome;
	private String cpfCliente;
	private String sexo;
	private Date dataDeNasc;
	private String senha;
	private String email;
	private int numero;
	private String complemento;
	private Endereco enderecos;

	public Cliente() {
	}
	
	public Cliente(int id, String nome, String cpfCliente, String sexo, Date dataDeNasc, String email, String senha, int numero, String complemento, Endereco enderecos) {
		super();
		this.setId(id);
		this.setNome(nome);
		this.setCpfCliente(cpfCliente);
		this.setSexo(sexo);
		this.setDataDeNasc(dataDeNasc);
		this.setEmail(email);
		this.setSenha(senha);
		this.setNumero(numero);
		this.setComplemento(complemento);
		this.setEnderecos(enderecos);
	}
	
	public Cliente(int id, String nome, String cpfCliente, String sexo, Date dataDeNasc, String email, int numero, String complemento) {
		super();
		this.setId(id);
		this.setNome(nome);
		this.setCpfCliente(cpfCliente);
		this.setSexo(sexo);
		this.setDataDeNasc(dataDeNasc);
		this.setEmail(email);
		this.setNumero(numero);
		this.setComplemento(complemento);
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

	public String getCpfCliente() {
		return cpfCliente;
	}

	public void setCpfCliente(String cpfCliente) {
		this.cpfCliente = cpfCliente;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Date getDataDeNasc() {
		return dataDeNasc;
	}

	public void setDataDeNasc(Date dataDeNasc2) {
		this.dataDeNasc = dataDeNasc2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public Endereco getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(Endereco enderecos) {
		this.enderecos = enderecos;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}
