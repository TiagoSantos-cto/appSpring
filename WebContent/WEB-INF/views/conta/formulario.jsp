<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adicionar Contas</title>
</head>
<body>
	<h3>Formulário de Conta</h3>

	<form action="adicinaConta" method="post">
		Descrição: <br>
		<textarea name ="descricao" rows="5" cols="100"></textarea> 
		<form:errors path="conta.descricao" />
		<br>
		<br>
		Valor: <input type="text" name="valor" /> &nbsp;
		Tipo: &nbsp;
		<select name="tipo">
			<option value="ENTRADA">Entrada</option>
			<option value="SAIDA">Saída</option>
		
		</select> 
		<br> <br> <input type="submit" value="Adicionar" />
	</form>
	<br><br>

<a href="/appSpring/home">Voltar</a>
</body>
</html>