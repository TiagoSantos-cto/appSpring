<html>
<head>
<meta charset="UTF-8">
<title>Projeto Spring</title>
</head>
<body>
<a href="/appSpring/logout">sair</a>
<h1>HOME</h1> 
<p><b><i>Bem vindo, ${usuarioLogado.login}!</i></b></p>
<p> 
Para <b>cadastrar</b> uma nova conta <a href="/appSpring/form">clique aqui</a>. 
<br>
Para <b>acessar</b> as contas j� existentes <a href="listaContas">clique aqui</a> .
</p> 
<br>
<i>Esta aplica��o usa um banco de dados em mem�ria, chamado HSQLDB.</i>
<br>
<br>
</body>
</html>