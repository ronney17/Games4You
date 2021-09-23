<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap2.min.css" rel="stylesheet">
<link href="css/info.css" rel="stylesheet">
<link href="css/lity.min.css" rel="stylesheet">

<title>Informaçôes do jogo</title>
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
		<form action="controller.do" method="post" class="form-horizontal">
			<input type="hidden" name="id" value="${jogos.id}" />
			<div class="row">
				<div class="painel-primary">

					<!-- tracinhos -->
					<div class="carousel slide my-5">
						<img class="d-block img-fluid" src="${jogos.caminhoImagem}"
							alt="First slide" width="1200" height="630">
					</div>

					<div class="">

						<h1>${jogos.nome}</h1>

						<span class="descricao" id="fade-content"> <strong>Descrição:
						</strong>${jogos.descricao}
						</span>
						<p>
							<strong>Gêneros: </strong><a>${jogos.genero}</a>
						</p>
						<p>
							<strong>Data de lançamento: </strong>
							<c:set var="myDate">
								<fmt:formatDate pattern="dd/MM/yyyy"
									value="${jogos.dataDeLancamento}" />
							</c:set>
							<c:out value="${myDate}"></c:out>
						</p>
						<p>
							<strong>Distribuidora: </strong> ${jogos.fornecedor}
						</p>

						<h1 id="valor">
							<strong>Preço: </strong> R$${jogos.valor}
						</h1>
						<p>
							<strong><a
								href="//www.youtube.com/watch?v=${jogos.caminhoTrailer}"
								data-lity="" rel="nofollow">ASSISTIR O TRAILER</a></strong>
						</p>
						<p>
							<span class="r${jogos.classificacao}">${jogos.classificacao}</span>
							<c:choose>
								<c:when test="${(jogos.classificacao).equalsIgnoreCase('L')}">
									<span class="rt">Livre para todos os públicos</span>
								</c:when>
								<c:otherwise>
									<span class="rt">Inadequado para menores de
										${jogos.classificacao} anos</span>
								</c:otherwise>
							</c:choose>
						</p>
						<br> <br>
					</div>
					<!-- Button (Double) -->

					<div class="form-group">
						<button class="btn btn-success btn-primary" type="submit"
							name="command" value="ComprarUm">Comprar</button>
						<button data-toggle="modal" data-target="#adicionadomodal" class="btn btn-alert btn-primary" type="submit"
							name="command" value="Carrinho">Add ao carrinho</button>
						<button onclick="location.href='Index.jsp';"
							class="btn btn-danger btn-secundary" type="reset">Voltar</button>
					</div>

				</div>
			</div>
		</form>
	</div>

<div class="modal fade" id="adicionadomodal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                
                    <div class="modal-content">
                        <div class="modal-header">
                        	<h4 class="modal-title">Jogo adicionado ao carrinho!</h4>
                            <button type="button" class="close" data-dismiss="modal" ><span>X</span></button>
                         </div>
                        
                        <div class="modal-body">
                           <form action="ManterCliente.do" method="post">
                             <button  onclick="location.href='Carrinho.jsp';"  type="button" class="btn btn-danger" data-dismiss="modal">Ir para o carrinho</button>
                             <button  type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                            </form>
                        </div>
                    </div>
                    
                </div>
            </div>

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
	<script src="js/lity.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>
</body>
</html>