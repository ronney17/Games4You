package command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Jogos;
import service.JogosService;

public class CarregarJogos implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//Pega id do jsp
		int id = Integer.parseInt(request.getParameter("id"));
		//Intancia objeto jogos
		Jogos j = new Jogos();
		j.setId(id);
		//Jogos service
		JogosService ps = new JogosService();
		
		RequestDispatcher view = null;

		j = ps.carregar(j.getId());
		request.setAttribute("jogos", j);
		//Manda para tela de jogos
		view = request.getRequestDispatcher("TelaJogos.jsp");

		view.forward(request, response);
	}
}