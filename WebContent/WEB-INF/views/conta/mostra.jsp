<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alterar Conta</title>
</head>
<body>
<h1>Alterar Conta</h1>
    
    <form action="alteraConta" method="post">
        Descrição: 
        <br>
        <textarea name="descricao" rows="5" cols="100">${conta.descricao}</textarea>
        <br>
        <br>
        Valor:  <input type="text" name="valor" value="${conta.valor}" /> &nbsp;
        Tipo: 
        <select name="tipo">
            <option value="ENTRADA" ${conta.tipo=='ENTRADA' ? 'selected':''}>Entrada</option>
            <option value="SAIDA" ${conta.tipo=='SAIDA' ? 'selected':''}>Saída</option>
        </select>
        
        &nbsp; &nbsp; &nbsp; &nbsp;
    
        Pago? <input type="checkbox" name="paga"     ${conta.paga?'checked':''} />
        <br>
        <br>
        Data de Pagamento: <input type="text" name="dataPagamento" value= "<fmt:formatDate value= "${conta.dataPagamento.time}" pattern="dd/MM/yyyy"/>"  />
         <br> 
         <br>                                                            
        <input type="hidden" name="id" value="${conta.id}"/>
        <input type="submit" value="Alterar"/>
        </form>
        <br>
        
        <a href="/appSpring/listaContas">Voltar</a>
        
</body>
</html>