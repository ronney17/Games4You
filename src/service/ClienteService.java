package service;

import dao.ClienteDao;
import model.Cliente;

public class ClienteService {
	ClienteDao dao = new ClienteDao();

	public int criar(Cliente Cliente) {
		return dao.criar(Cliente);
	}

	public void atualizar(Cliente Cliente) {
		dao.atualizar(Cliente);
	}

	public void excluir(int id) {
		dao.excluir(id);
	}

	public Cliente carregar(int id) {
		return dao.carregar(id);
	}
	public boolean validar(Cliente usuario){
		return dao.validar(usuario);
	}
}
