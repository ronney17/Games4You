package command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Jogos;
import service.JogosService;

public class Carrinho implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Pega id da TelaJogos
		int entrada = Integer.parseInt(request.getParameter("id"));

		// Jogos service
		JogosService js = new JogosService();
		Jogos j = js.carregar(entrada);

		HttpSession session = request.getSession();
		 
		@SuppressWarnings("unchecked")
		List<Jogos> lista = (List<Jogos>) session.getAttribute("carrinho");
		if (lista == null) {
			lista = new ArrayList<>();
		}
		
		for (int i = 0; i < lista.size(); i++) {
			Jogos obj = lista.get(i);

			if (obj.getId() == entrada) {
				lista.remove(i);
				break;
			}
		}
		
		lista.add(j);
		session.setAttribute("carrinho", lista);
		
		response.setStatus(HttpServletResponse.SC_NO_CONTENT);
	}
}