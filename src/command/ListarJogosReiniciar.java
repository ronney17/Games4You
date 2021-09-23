package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Jogos;
import service.JogosService;

public class ListarJogosReiniciar implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Jogos> lista = null;
		HttpSession session = request.getSession();

		JogosService jogos = new JogosService();
		lista = jogos.listarJogos();
		session.setAttribute("lista", lista);

		RequestDispatcher dispatcher = request.getRequestDispatcher("BuscarJogos.jsp");
		dispatcher.forward(request, response);
	}
}
