package service;

import dao.VendaDao;
import model.Venda;

public class VendaService {
	VendaDao dao = new VendaDao();

	public int criar(Venda Venda) {
		return dao.criar(Venda);
	}
	
	public int inserir(Venda Venda) {
		return dao.inserir(Venda);
	}
	
	public Venda carregar(int id) {
		return dao.carregar(id);
	}
}