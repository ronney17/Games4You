package service;

import dao.TelefonesDao;
import model.Telefones;

public class TelefonesService {
	TelefonesDao dao = new TelefonesDao();

	public int criar(Telefones telefones) {
		return dao.criar(telefones);
	}

	public void atualizar(Telefones Telefones) {
		dao.atualizar(Telefones);
	}

	public void excluir(int id) {
		dao.excluir(id);
	}

	public Telefones carregar(int id) {
		return dao.carregar(id);
	}
}
