<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap2.min.css" rel="stylesheet">
<link href="css/bootsnipp.css" rel="stylesheet">
<title>Cadastro</title>
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

	<form action="controller.do" method="post" class="form-horizontal">
		<fieldset>
			<div class="panel-primary">
				<div id="ok" class="panel-body">
					<div class="form-group">
						<div class="col-md-11 control-label">
							<p class="help-block">
								Campo Obrigatório <em>*</em>
							</p>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="Nome">Nome <em>*</em></label>
						<div class="col-md-8">
							<input id="nome" name="nome" placeholder=""
								class="form-control input-md" required type="text">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="Nome">CPF <em>*</em></label>
						<div class="col-md-2">
							<input id="cpfCliente" name="cpfCliente"
								placeholder="Apenas números" class="form-control input-md"
								required type="text" maxlength="11" pattern="[0-9]+$">
						</div>

						<label class="col-md-1 control-label" for="prependedtext">Nascimento<em>*</em></label>
						<div class="col-md-2">
							<input id="dataDeNasc" name="dataDeNasc" placeholder="DD/MM/AAAA"
								class="form-control input-md" required type="text"
								maxlength="10" OnKeyPress="formatar('##/##/####', this)"
								onBlur="showhide()">
						</div>

						<!-- Multiple Radios (inline) -->

						<label class="col-md-1 control-label" for="radios">Sexo</label>
						<div class="col-md-4">
							<label class="radio-inline" for="radios-0"> <input
								name="sexo" id="sexo" value="feminino" type="radio">
								Feminino
							</label> <label class="radio-inline" for="radios-1"> <input
								name="sexo" id="sexo" value="masculino" type="radio">
								Masculino
							</label>
						</div>
					</div>

					<!-- Telefone-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="prependedtext">Telefones
							<em>*</em>
						</label>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-earphone"></i></span> <input id="telefones"
									name="telefones" class="form-control"
									placeholder="(XX) XXXXX-XXXX" required type="text"
									maxlength="13" pattern="\[0-9]{2}\ [0-9]{4,6}-[0-9]{3,4}$"
									OnKeyPress="formatar('##-#####-####', this)">
							</div> 
						</div>

						<label class="col-md-1 control-label" for="prependedtext">Telefone</label>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-earphone"></i></span> <input id="telefones"
									name="telefones2" class="form-control"
									placeholder="(XX) XXXXX-XXXX" type="text" maxlength="13"
									pattern="\[0-9]{2}\ [0-9]{4,6}-[0-9]{3,4}$"
									OnKeyPress="formatar('##-#####-####', this)">
							</div>
						</div>

					</div>

					<!-- Email-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="prependedtext">Email
							<em>*</em>
						</label>
						<div class="col-md-5">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope"></i></span> <input id="email"
									name="email" class="form-control" placeholder="email@email.com"
									required type="text"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
							</div>
						</div>
					</div>

					<!-- Senha-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="prependedtext">Senha
							<em>*</em>
						</label>
						<div class="col-md-5">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input id="senha"
									name="senha" class="form-control"
									placeholder="Digite uma senha" type="password" required>
							</div>
						</div>
					</div>

					<!-- Search input-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="CEP">CEP <em>*</em></label>
						<div class="col-md-2">
							<input id="cep" name="cep" placeholder="Apenas números"
								class="form-control input-md" required value="" type="search"
								maxlength="8" pattern="[0-9]+$">
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-primary"
								onclick="pesquisacep(cep.value)">Pesquisar</button>
						</div>
					</div>

					<!-- Endereco-->
					<div class="form-group">
						<label class="col-md-2 control-label" for="prependedtext">Endereço</label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">Rua <em>*</em></span> <input
									id="rua" name="rua" class="form-control" placeholder=""
									required readonly="readonly" type="text">
							</div>

						</div>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon">Nº <em>*</em></span> <input
									id="numero" name="numero" class="form-control" placeholder=""
									required type="text">
							</div>

						</div>

						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon">Bairro</span> <input id="bairro"
									name="bairro" class="form-control" placeholder="" required
									readonly="readonly" type="text">
							</div>

						</div>
					</div>

					<div class="form-group">
						<label class="col-md-2 control-label" for="prependedtext"></label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">Cidade</span> <input id="cidade"
									name="cidade" class="form-control" required readonly="readonly"
									type="text">
							</div>

						</div>

						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon">Estado</span> <input id="estado"
									name="estado" class="form-control" placeholder="" required
									readonly="readonly" type="text">
							</div>

						</div>

						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon">Complemento</span> <input
									id="complemento" name="complemento" class="form-control"
									placeholder="" type="text">
							</div>

						</div>
					</div>

					<!-- Button (Double) -->
					<div class="form-group">
						<label class="col-md-2 control-label" for="Cadastrar"></label>
						<div class="col-md-8">
							<button id="Cadastrar" name="command" value="CriarCliente"
								class="btn btn-success" type="Submit">Cadastrar</button>
							<button onclick="location.href = 'Index.jsp';" id="Cancelar"
								name="Cancelar" class="btn btn-danger" type="Reset">Cancelar</button>
						</div>
					</div>
				</div>

			</div>


		</fieldset>

	</form>
	<div>
		<br> <br>
		<c:import url="Rodape.jsp" />
	</div>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/cad.js"></script>

</body>
</html>
