package command;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
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

public class EditarCliente implements Command {

	@Override
	public void executar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//Atualizar Endereços
		int eId = Integer.parseInt(request.getParameter("eId"));
		String eRua = request.getParameter("rua");
		String eBairro = request.getParameter("bairro");
		String eCidade = request.getParameter("cidade");
		String eEstado = request.getParameter("estado");
		String eCep = request.getParameter("cep");
		
		Endereco e = new Endereco();
		e.setId(eId);
		e.setRua(eRua);
		e.setBairro(eBairro);
		e.setCidade(eCidade);
		e.setEstado(eEstado);
		e.setCep(eCep);

		// instanciar o service
		EnderecoService es = new EnderecoService();
		es.atualizar(e);

		//Atualizar Clientes
		int cId = Integer.parseInt(request.getParameter("cId"));
		String cNome = request.getParameter("nome");
		String cCpfCliente = request.getParameter("cpfCliente");
		String cSexo = request.getParameter("sexo");
		String cDataDeNasc = request.getParameter("dataDeNasc");
		String cEmail = request.getParameter("email");
		String cSenha = request.getParameter("senha");
		int cNumero = Integer.parseInt(request.getParameter("numero"));
		String cComplemento = request.getParameter("complemento");

		Cliente c = new Cliente();
		c.setId(cId);
		c.setNome(cNome);
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		try {
			c.setDataDeNasc((Date) formatter.parse(cDataDeNasc));
		} catch (ParseException e2) {
			e2.printStackTrace();
		}
		c.setCpfCliente(cCpfCliente);
		c.setSexo(cSexo);
		c.setEmail(cEmail);
		c.setSenha(cSenha);
		c.setNumero(cNumero);
		c.setComplemento(cComplemento);
		c.setEnderecos(e);

		// instanciar o service
		ClienteService cs = new ClienteService();
		cs.atualizar(c);

		//Atualizar Telefones
		int tId = Integer.parseInt(request.getParameter("tId"));
		String tTelefone = request.getParameter("telefones");
		String tTelefone2 = request.getParameter("telefones2");

		Telefones t = new Telefones();
		t.setId(tId);
		t.setTelefone(tTelefone);
		t.setClientes(c);

		// instanciar o service
		TelefonesService ts = new TelefonesService();
		ts.atualizar(t);
		
		//Segundo telefone
		if (tTelefone.length() == tTelefone2.length()) {
			Telefones t2 = new Telefones();
			TelefonesService ts2 = new TelefonesService();
			t2.setId(tId);
			t2.setTelefone(tTelefone2);
			t2.setClientes(c);
			ts2.atualizar(t2);
			HttpSession session = request.getSession();
			session.setAttribute("telefones", t2);
		}
		
		RequestDispatcher view = null;
		//Obter na sessão
		HttpSession session = request.getSession();
		session.setAttribute("logado", c);
		session.setAttribute("endereco", e);
		session.setAttribute("telefones", t);
		
		view = request.getRequestDispatcher("Login.jsp");
		view.forward(request, response);
	}
}