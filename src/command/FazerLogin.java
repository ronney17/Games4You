package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import model.Endereco;
import model.Telefones;
import service.ClienteService;
import service.EnderecoService;
import service.TelefonesService;

public class FazerLogin implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Recebe do JSP
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");

		Cliente usuario = new Cliente();
		usuario.setEmail(email);
		usuario.setSenha(senha);
		ClienteService cs = new ClienteService();

		HttpSession session = request.getSession();

		if (cs.validar(usuario)) {
			// Carregar telefones
			Telefones t = new Telefones();
			TelefonesService ts = new TelefonesService();
			t = ts.carregar(usuario.getId());

			// Carregar usuário
			usuario = cs.carregar(usuario.getId());

			// Carregar endereços
			Endereco e = new Endereco();
			EnderecoService es = new EnderecoService();
			e = es.carregar(usuario.getId());

			// Obter na sessão
			session.setAttribute("logado", usuario);
			session.setAttribute("endereco", e);
			session.setAttribute("telefones", t);

			System.out.println("Logado com sucesso: " + usuario.getEmail() + " Senha: " + usuario.getSenha());
			response.sendRedirect("Index.jsp");
		} else {
			// throw new ServletException("Usuario/Senha invalidos");
			response.sendRedirect("Login.jsp");
			session.setAttribute("msgErro", "Usuário ou senha inválidos");
		}
	}
}
