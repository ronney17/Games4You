package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.Itens_Venda;
import model.Jogos;
import model.Venda;
import service.Itens_VendaService;
import service.VendaService;

public class Comprar implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Pega parametros da tela carrinho
		int cId = Integer.parseInt(request.getParameter("cId"));
		String paga = request.getParameter("formaDePagamento");

		Cliente c = new Cliente();
		c.setId(cId);

		Venda v = new Venda();
		v.setCliente(c);
		v.setFormadepagamento(paga);

		String nomeCartao = request.getParameter("nomeCartao");
		String numeroCartao = request.getParameter("numeroCartao");
		String validadeCartao = request.getParameter("validadeCartao");
		String cvvCartao = request.getParameter("cvvCartao");
		int parcelasCartao = Integer.parseInt(request.getParameter("parcelasCartao"));

		v.setNomeCartao(nomeCartao);
		v.setNumeroCartao(numeroCartao);
		v.setValidadeCartao(validadeCartao);
		v.setCvvCartao(cvvCartao);
		v.setParcelasCartao(parcelasCartao);

		VendaService vs = new VendaService();
		vs.criar(v);

		for (String jId : request.getParameterValues("jId")) {
			int qtd = Integer.parseInt(request.getParameter("qtd_" + jId));

			int jId2 = Integer.parseInt(jId);
			Jogos j = new Jogos();
			j.setId(jId2);

			Itens_Venda iv = new Itens_Venda();
			iv.setQuantidade(qtd);
			iv.setJogos(j);
			iv.setVenda(v);

			Itens_VendaService ivs = new Itens_VendaService();
			ivs.criar(iv);
		}

		response.setStatus(HttpServletResponse.SC_NO_CONTENT);
	}
}