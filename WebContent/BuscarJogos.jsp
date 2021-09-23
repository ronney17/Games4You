<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<title>todos jogos</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap2.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

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
	<div  id="content" class="container">
		<div class="painel-primary my-4">
			<div class="row">
				<c:if test="${not empty lista}">
					<c:forEach var="jogos" items="${lista}">

						<div class="col-lg-3 col-md-6 mb-4">
							<div class="card h-100">
								<img class="card-img-top" src="${jogos.caminhoImagem}"
									alt="Foto de capa">
								<div class="card-body">
									<h4 class="card-title">
										<a href="controller.do?command=CarregarJogos&id=${jogos.id}">${jogos.nome}</a>
									</h4>
									<h5>R$${jogos.valor}</h5>
									<p class="card-text">${jogos.descricao}</p>
								</div>
							</div>
						</div>

						<!-- /.row -->
					</c:forEach>
				</c:if>
			</div>
		</div>


	</div>


	<!-- Rodapé -->
	<div class="panel-height">
	<footer id="footer" class="py-4 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">
				PGMR &copy; 2019 <br> Todos os direitos reservados.
			</p>
		</div>
	</footer>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>
