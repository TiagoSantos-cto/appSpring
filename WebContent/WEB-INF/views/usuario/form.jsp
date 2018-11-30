<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Usuário</title>
</head>
<body>
<h1>Novo Usuário</h1>
	<form action="addUser" method="POST">

		Nome:  <input type="text" name="login"> <br><br>
		Senha: <input type="password" name="senha"> <br> <br>
		<input type="submit" value="Cadastrar" />
	</form>
	<br>
	<br>

	<a href="/appSpring/home">Voltar</a>
</body>
</html>