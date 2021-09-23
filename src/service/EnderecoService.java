package service;

import dao.EnderecoDao;
import model.Endereco;

public class EnderecoService {
	EnderecoDao dao = new EnderecoDao();

	public int criar(Endereco Endereco) {
		return dao.criar(Endereco);
	}

	public void atualizar(Endereco Endereco) {
		dao.atualizar(Endereco);
	}

	public void excluir(int id) {
		dao.excluir(id);
	}

	public Endereco carregar(int id) {
		return dao.carregar(id);
	}
}
