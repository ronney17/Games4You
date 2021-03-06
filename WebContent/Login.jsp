<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap2.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">
</head>
<body class="text-center">
	<form action="controller.do" method="post" class="form-signin">
		<h1 class="h3 mb-3 font-weight-normal">Fazer login</h1>
		<label for="inputEmail" class="sr-only">Endereço de Email</label> 
		<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email" required autofocus> 
		<label for="inputPassword" class="sr-only">Senha</label> 
		<input type="password" id="inputPassword" name="senha" class="form-control" placeholder="Senha" required>
		<div class="checkbox mb-3">
		<c:if test="${not empty msgErro}">
   		<span id="msg">${msgErro}</span>
		</c:if>
		<c:remove var="msgErro" scope="session" /> 
		</div>
		<button class="btn btn-lg btn-success btn-primary btn-block" type="submit" name="command" value="FazerLogin">Entrar</button>
		<button onclick="location.href='Cadastro.jsp';" class="btn btn-lg btn-alert btn-primary btn-block" type="submit">Inscrever-se</button>
		<button onclick="location.href='Index.jsp';" class="btn btn-lg btn-danger btn-secundary btn-block" type="submit">Voltar</button>
		<p class="mt-5 mb-3 text-muted">&copy;PGMR 2019</p>
	</form>
	<script src="js/Login.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
