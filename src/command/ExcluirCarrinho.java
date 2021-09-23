package command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Jogos;

public class ExcluirCarrinho implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Pega id da TelaJogos
		int entrada = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();

		@SuppressWarnings("unchecked")
		List<Jogos> lista = (List<Jogos>) session.getAttribute("carrinho");

		for (int i = 0; i < lista.size(); i++) {
			Jogos obj = lista.get(i);

			if (obj.getId() == entrada) {
				lista.remove(i);
				break;
			}
		}
		
		session.setAttribute("carrinho", lista);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Carrinho.jsp");
		dispatcher.forward(request, response);
	}
}