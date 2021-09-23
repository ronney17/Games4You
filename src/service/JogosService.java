package service;

import java.util.ArrayList;

import dao.JogosDao;
import model.Jogos;

public class JogosService {
	JogosDao dao = new JogosDao();

	public int criar(Jogos Jogos) {
		return dao.criar(Jogos);
	}

	public void atualizar(Jogos Jogos) {
		dao.atualizar(Jogos);
	}

	public void excluir(int id) {
		dao.excluir(id);
	}

	public Jogos carregar(int id) {
		return dao.carregar(id);
	}
	
	public ArrayList<Jogos> listarJogos(){
		return dao.listarJogos();
	}
	public ArrayList<Jogos> listarJogos(String chave){
		return dao.listarJogos(chave);
	}
	public ArrayList<Jogos> listarCarrinho(int id){
		return dao.listarCarrinho(id);
	}
}
