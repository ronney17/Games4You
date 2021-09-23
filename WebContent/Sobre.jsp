<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>

<title>Games4You - Sobre nós</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="css/bootstrap2.min.css" rel="stylesheet">
<link href="css/estilo.css" rel="stylesheet">
<link href="css/about.css" rel="stylesheet">

</head>

<body>

		<!-- Menu -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="Index.jsp">Games4You</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<form action="controller.do" method="post"
				class="form-inline my-2 my-lg-0">
				<input name="data[search]" class="form-control mr-sm-2 "
					type="search" placeholder="Pesquisar" aria-label="Pesquisar">
				<button class="btn btn-outline-danger my-2 my-sm-0" id="corbotao"
					type="submit" name="command" value="ListarJogosBuscar">Pesquisar</button>
			</form>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto navbar-right">
					<c:choose>
						<c:when test="${(logado.nome) != null}">
							<li class="nav-item active"><a class="nav-link   " href="#">${logado.nome}</a></li>
							<li class="nav-item active"><a class="nav-link   "
								href="AlterarCliente.jsp">Minha conta</a></li>
							<li class="nav-item active"><a class="nav-link   "
								href="Carrinho.jsp">Meu carrinho</a></li>
							<li class="nav-item active"><a class="nav-link   "
								href="controller.do?command=ListarJogosReiniciar">Jogos</a></li>
							<li class="nav-item active"><a class="nav-link  "
								href="Sobre.jsp">Sobre nós</a></li>
							<li class="nav-item active"><a class="nav-link  "
								href="controller.do?command=Logout">Sair</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item active"><a class="nav-link   "
								href="Login.jsp">Login</a></li>
							<li class="nav-item active"><a class="nav-link   "
								href="Cadastro.jsp">Cadastre-se</a></li>
							<li class="nav-item active"><a class="nav-link   "
								href="Carrinho.jsp">Meu carrinho</a></li>
							<li class="nav-item active"><a class="nav-link   "
								href="controller.do?command=ListarJogosReiniciar">Jogos</a></li>
							<li class="nav-item active"><a class="nav-link  "
								href="Sobre.jsp">Sobre nós</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Página -->
	<div class="painel-primary" id="content">
		<div id="texto">
			<h1 class="titulosobrenos">ELABORAR UM SITE DE COMÉRCIO</h1>
			<h3 class="titulosobrenos2">Criar um site com temática de vendas.</h3>
			<div class="apre">
				<h4 class="apresentacao">Trabalho da disciplina de Projeto
					Interdisciplinar apresentado ao Curso de Ciências da Computação como
					quesito parcial da nota que compõe o semestre. Orientador: Prof.
					Hamilton Machiti.</h4><br>
					<h2 class="titulosobrenos2">INTRODUÇÃO</h2><br>

				<h4 class="apresentacao">Nesse trabalho vamos elencar o
					processo de criação de um site, cuja a temática e o comércio.
					Utilizando java, html, css e javascript e os conceitos de
					desenvolvimento web estudados neste semestre. O tema escolhido para
					o site foi o de venda de jogos.</h4>
			</div>
		</div>
	</div>

	<!-- Rodapé -->
	<div class="painel-secondary panel-height">
		<footer id="footer" class="py-4 bg-dark rodape">
			<div class="container">
				<p class="m-0 text-center text-white">
					PGMR &copy; 2019 <br> Todos os direitos reservados.
				</p>
			</div>
		</footer>
	</div>

</body>

</html>
