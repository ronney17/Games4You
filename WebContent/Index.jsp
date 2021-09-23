<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Games4You</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap2.min.css" rel="stylesheet">
<link href="css/estilo.css" rel="stylesheet">

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
	<div class="container">
		<div class="row">
			<div class="painel-primary">

				<!-- tracinhos -->
				<div id="carouselExampleIndicators" class="carousel slide my-5"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<a href="controller.do?command=CarregarJogos&id=1"> <img
								class="d-block img-fluid" src="Imagens\gtav.jpg"
								alt="First slide" width="1200" height="630">
							</a>
							<div class="carousel-caption d-none d-md-block"></div>
						</div>
						<div class="carousel-item">
							<a href="controller.do?command=CarregarJogos&id=9"> <img
								class="d-block img-fluid" src="Imagens\mine.jpg "
								alt="Second slide">
							</a>
							<div class="carousel-caption d-none d-md-block"></div>
						</div>
						<div class="carousel-item">
							<a href="controller.do?command=CarregarJogos&id=8"> <img
								class="d-block img-fluid" src="Imagens\thewitcher.jpg"
								contenteditable="" alt="Third slide">
							</a>
							<div class="carousel-caption d-none d-md-block"></div>
						</div>
					</div>
					<!-- botões '<' e '>' -->
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<div class="row">

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top" src="Imagens/r6.jpg"
								alt="Foto de capa do R6">
							<div class="card-body">
								<h4 class="card-title">
									<a href="controller.do?command=CarregarJogos&id=2">Tom
										Clancy's Rainbow Six Siege</a>
								</h4>
								<h5>R$59.99</h5>
								<p class="card-text">Domine a arte da destruição e do uso de
									gadgets em Tom Clancy’s Rainbow Six Siege. Enfrente combates
									intensos...</p>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top" src="Imagens/re2.jpg"
								alt="Foto da capa do Minecraft">
							<div class="card-body">
								<h4 class="card-title">
									<a href="controller.do?command=CarregarJogos&id=3">Resident
										Evil 2: Remake</a>
								</h4>
								<h5>R$129.99</h5>
								<p class="card-text">Em Resident Evil 2, a ação clássica,
									exploração tensa e a jogabilidade de resolver quebra-cabeças
									que definiu...</p>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top" src="Imagens/injustice.jpg"
								alt="Foto da capa do Injustice">
							<div class="card-body">
								<h4 class="card-title">
									<a href="controller.do?command=CarregarJogos&id=4">Injustice:
										Gods Among Us</a>
								</h4>
								<h5>R$49.99</h5>
								<p class="card-text">Injustice: Gods Among Us Ultimate
									Edition aprimora o novo e ousado jogo de luta da NetherRealm...</p>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top" src="Imagens/hunt.jpg" alt="">
							<div class="card-body">
								<h4 class="card-title">
									<a href="controller.do?command=CarregarJogos&id=5">Hunt:
										Showdown</a>
								</h4>
								<h5>R$89.99</h5>
								<p class="card-text">Monstros cruéis e sinistros vagueiam
									pelos pântanos do Louisiana, e tu fazes parte de um grupo de
									duros...</p>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top" src="Imagens/pub.jpg" alt="">
							<div class="card-body">
								<h4 class="card-title">
									<a href="controller.do?command=CarregarJogos&id=6">Playerunknown's
										Battlegrounds</a>
								</h4>
								<h5>R$55.99</h5>
								<p class="card-text">PLAYERUNKNOWN'S BATTLEGROUNDS é um
									shooter de battle royale que coloca 100 jogadores um contra...</p>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top" src="Imagens/csgo.jpg" alt="">
							<div class="card-body">
								<h4 class="card-title">
									<a href="controller.do?command=CarregarJogos&id=12">Counter
										Strike: Global Offensive</a>
								</h4>
								<h5>$25.99</h5>
								<p class="card-text">Counter-Strike: Global Offensive (CS:
									GO) expandirá na jogabilidade de ação baseada em equipes na
									qual...</p>
							</div>
						</div>
					</div>

				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.Página -->

	<!-- Rodapé -->
	<footer class="py-4 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">
				PGMR &copy; 2019 <br> Todos os direitos reservados.
			</p>
		</div>

	</footer>

	<!-- Bootstrap / JavaScript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>

</body>

</html>