package model;


public class Telefones {
	private int id;
	private String telefone;
	private Cliente clientes;

	public Telefones() {
	}

	public Telefones(int id, String telefone, Cliente clientes) {
		this.id = id;
		this.telefone = telefone;
		this.clientes = clientes;
	}
	
	public Telefones(int id, String telefone) {
		this.id = id;
		this.telefone = telefone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Cliente getClientes() {
		return clientes;
	}

	public void setClientes(Cliente clientes) {
		this.clientes = clientes;
	}
}
