<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Carrinho</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap2.min.css" rel="stylesheet">
<link href="css/bootsnipp.css" rel="stylesheet">

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

	<div id="content" class="container">
		<div class="py-4 text-center">
			<h2>Carrinho de compras</h2>
		</div>
		<form action="controller.do" method="post">
			<div class="row">
				<div class="col-md-4 order-md-2 mb-4">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">Seu carrinho</span> <span
							class="badge badge-secondary badge-pill">${fn:length(carrinho)}</span>
					</h4>
					<ul class="list-group mb-3">
						<c:set var="total" value="${0}" />
						<c:set var="quantidade" value="${1}" />
						<c:if test="${not empty carrinho}">
							<c:forEach var="jogos" items="${carrinho}">
								<input type="hidden" name="jId" value="${jogos.id}" />
								<li class="list-group-item d-flex justify-content-between">
									<div>
										<h6 class="my-0">${jogos.nome}</h6>
										<small id="descricao" class="text-muted">${jogos.descricao}</small>
									</div> <span id="valor" class="text-muted">R$${jogos.valor}</span> <span
									id="excluir"><a
										href="controller.do?command=ExcluirCarrinho&id=${jogos.id}">
											<i class="fa fa-trash fa-2x" aria-hidden="true"></i>
									</a></span> <c:set var="total" value="${total + jogos.valor * quantidade}" />
								</li>
								<li class="list-group-item d-flex justify-content-between"><input
									type="number" class="form-control" name="qtd_${jogos.id}"
									placeholder="Qtd" value="1"></li>
							</c:forEach>
						</c:if>
						<li class="list-group-item d-flex justify-content-between"><span>Total</span>
							<strong>R$<fmt:formatNumber type="number"
									maxFractionDigits="2" value="${total}" /></strong></li>
					</ul>
				</div>

				<div class="col-md-8 order-md-1">
					<h4 class="mb-3">Suas informações</h4>
					<input type="hidden" name="cId" value="${logado.id}" />
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">Nome </label> <input type="text"
								class="form-control" name="nome" placeholder=""
								value="${logado.nome}" required>
							<div class="invalid-feedback">Confira seu nome.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">Email <span class="text-muted">(Obrigatório)</span></label>
						<input type="email" class="form-control" name="email"
							placeholder="voce@exemplo.com" value="${logado.email}">
						<div class="invalid-feedback">Por favor insira email válido
							para receber a chave de seu jogo.</div>
					</div>

					<h4 class="mb-3">Pagamento</h4>

					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input id="credito" value="credito" name="formaDePagamento"
								type="radio" class="custom-control-input" required> <label
								class="custom-control-label" for="credito">Cartão de
								crédito</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="debito" value="debito" name="formaDePagamento"
								type="radio" class="custom-control-input" required> <label
								class="custom-control-label" for="debito">Cartão de
								débito</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="boleto" value="boleto" name="formaDePagamento"
								type="radio" class="custom-control-input" checked required>
							<label class="custom-control-label" for="boleto">Boleto</label>
						</div>
					</div>

					<div class="Box" style="display: none">
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="cc-name">Nome no cartão</label> <input value=""
									type="text" name="nomeCartao" class="form-control"
									placeholder="">
								<div class="invalid-feedback">Nome no cartão obrigório</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="cc-number">Número no cartão</label> <input value=""
									name="numeroCartao" type="text" class="form-control"
									placeholder="" maxlength="16" pattern="[0-9]+$">
								<div class="invalid-feedback">Número do cartão obrigatório
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-3 mb-3">
								<label>Validade</label> <input value="" type="text"
									name="validadeCartao" class="form-control"
									placeholder="MM/AAAA" OnKeyPress="formatar('##/####', this)"
									maxlength="7">
								<div class="invalid-feedback">Data de validade obrigatória
								</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="cc-cvv">CVV</label> <input value="" type="text"
									name="cvvCartao" class="form-control" placeholder="">
								<div class="invalid-feedback">CVV obrigatório</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="cc-cvv">Parcelas</label> <input value="1"
									type="text" name="parcelasCartao" class="form-control"
									placeholder="">
								<div class="invalid-feedback">Mínimo: 1 parcela</div>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${(logado.nome) != null}">
							<div class="Box2" style="display: none">
								<a href="Boleto.jsp" target="_blank">Ver boleto</a>
							</div>
						</c:when>
					</c:choose>

					<hr class="mb-4">
					<button class="btn btn-success btn-primary btn-lg btn-block"
						type="submit" name="command" value="Comprar" data-toggle="modal"
						data-target="#finalizarmodal">Finalizar compra</button>

					<button onclick="location.href='Index.jsp';"
						class="btn btn-danger btn-lg btn-secundary btn-block"
						type="submit">Voltar</button>
				</div>
			</div>
		</form>
	</div>

	<!--  modal -->
	<div class="modal fade" id="finalizarmodal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">

			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Pedido finalizado!</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span>X</span>
					</button>
				</div>

				<div class="modal-body">Estamos aguardando a confirmação do
					pagamento do seu pedido. Quando confirmado, você receberá o serial
					do jogo comprado!</div>

				<div class="modal-footer">
					<!-- <button onclick="location.href='Pedidos.jsp';" type="button" class="btn btn-danger" data-dismiss="modal">Meus pedidos</button>  -->
					<button onclick="location.href='Index.jsp';" type="button"
						class="btn btn-danger" data-dismiss="modal">Fechar</button>
				</div>

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
	<script src="js/bootstrap.min.js"></script>
	<script src="js/fontawesome.js"></script>
	<script src="js/gatilho.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>
</body>
</html>
