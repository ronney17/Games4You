package service;

import dao.Itens_VendaDao;
import model.Itens_Venda;

public class Itens_VendaService {
	Itens_VendaDao dao = new Itens_VendaDao();

	public int criar(Itens_Venda Itens_Venda) {
		return dao.criar(Itens_Venda);
	}

	public void atualizar(Itens_Venda Itens_Venda) {
		dao.atualizar(Itens_Venda);
	}

	public void excluir(int id) {
		dao.excluir(id);
	}

	public Itens_Venda carregar(int id) {
		return dao.carregar(id);
	}
}
