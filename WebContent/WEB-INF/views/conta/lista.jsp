<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Contas</title>

<script src="resources/js/jquery.js"></script>

<script type="text/javascript">

function deuCerto(dadosDaResposta) {
	  alert("Conta paga com sucesso!");  
	}
	
	function pagaAgora(id) {
	$.post( "pagaConta", {'id' : id}, function() {$("#conta_"+id).html("Paga");} );
	}
	
</script>

</head>
<body>

	<table>
		<tr>
			<th>Código &nbsp;</th>
			<th>Descrição&nbsp;</th>
			<th>Valor&nbsp;</th>
			<th>Tipo&nbsp;</th>
			<th>Situação&nbsp;</th>
			<th>Data de Pagamento&nbsp;</th>
			<th>Ação&nbsp;</th>
		</tr>

		<c:forEach items="${todasContas}" var="conta">
			
			<tr>
				<td><b>${conta.id}</b> &nbsp; </td> 
				<td><i>${conta.descricao}</i>  &nbsp;</td> 
				<td>${conta.valor} &nbsp;&nbsp;</td> 
				<td>${conta.tipo} &nbsp;</td> 

				<td>&nbsp;<c:if test="${conta.paga eq false}">
						Não Paga. 
					</c:if> 
					<c:if test="${conta.paga eq true}">
						Paga. 
					</c:if></td>

				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy" /></td>
				<c:if test="${conta.paga eq false}">
				<td><a href="#" onclick="pagaAgora(${conta.id});">Pagar</a></td> 
				</c:if>
				<td><a href="removeConta?id=${conta.id}">Remover</a></td> 
				<td><a href="mostraConta?id=${conta.id}">Alterar</a></td>
				
			</tr>
		
		</c:forEach>
	</table>
	
	<br>
	<a href="/appSpring/home">Voltar</a>
</body>
</html>