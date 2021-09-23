<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<HEAD>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<TITLE>Boleto</TITLE>
<STYLE>
td.BoletoCodigoBanco {font-size: 6mm; font-family: arial, verdana; font-weight : bold; 
					  FONT-STYLE: italic; text-align: center; vertical-align: bottom;  
					  border-bottom: 0.15mm solid #000000; border-right: 0.15mm solid #000000;
					  padding-bottom : 1mm}
td.BoletoLogo { border-bottom: 0.15mm solid #000000;  border-right: 0.15mm solid #000000;
				text-align: center; height: 10mm}	
td.BoletoLinhaDigitavel {font-size: 4 mm; font-family: arial, verdana; font-weight : bold; 
					     text-align: center; vertical-align: bottom; 
					      border-bottom: 0.15mm solid #000000; padding-bottom : 1mm; }
td.BoletoTituloEsquerdo{font-size: 0.2cm; font-family: arial, verdana; padding-left : 0.15mm;
						border-right: 0.15mm solid #000000; text-align: left}
td.BoletoTituloDireito{font-size: 2mm; font-family: arial, verdana; padding-left : 0.15mm;
						text-align: left}
td.BoletoValorEsquerdo{font-size: 3mm; font-family: arial, verdana; text-align: center;
						border-right: 0.15mm solid #000000; font-weight: bold;
						border-bottom: 0.15mm solid #000000; padding-top: 0.5mm}
td.BoletoValorDireito{font-size: 3mm; font-family: arial, verdana; text-align:right; 
					  padding-right: 3mm; padding-top: 0.8mm; border-bottom: 0.15mm solid #000000;
					   font-weight: bold;}
td.BoletoTituloSacado{font-size: 2mm; font-family: arial, verdana; padding-left : 0.15mm;
						vertical-align: top; padding-top : 0.15mm; text-align: left}
td.BoletoValorSacado{font-size: 3mm; font-family: arial, verdana;  font-weight: bold; 
					text-align : left}
td.BoletoTituloSacador{font-size: 2mm; font-family: arial, verdana; padding-left : 0.15mm;
						vertical-align: bottom; padding-bottom : 0.8mm;
						border-bottom: 0.15mm solid #000000}
td.BoletoValorSacador{font-size: 3mm; font-family: arial, verdana; vertical-align: bottom; 
					padding-bottom : 0.15mm; border-bottom: 0.15mm solid #000000;
					 font-weight: bold; text-align: left}	
td.BoletoPontilhado{border-top: 0.3mm dashed #000000; font-size: 1mm}
ul.BoletoInstrucoes{font-size : 3mm; font-family : verdana, arial}	  
</STYLE>
</HEAD>
<BODY>

<p align=center>
<TABLE cellSpacing=0 cellPadding=0 border=0 class=Boleto>
  
  <TR>
    <TD style='width: 0.9cm'></TD>
    <TD style='width: 1cm'></TD>
    <TD style='width: 1.9cm'></TD>
    
    <TD style='width: 0.5cm'></TD>
    <TD style='width: 1.3cm'></TD>
    <TD style='width: 0.8cm'></TD>
    <TD style='width: 1cm'></TD>
    
    <TD style='width: 1.9cm'></TD>
    <TD style='width: 1.9cm'></TD>
    
    <TD style='width: 3.8cm'></TD>
    
    <TD style='width: 3.8cm'></TD>
  </TR><tr><td colspan=11>
  <ul class=BoletoInstrucoes>
  <li>Imprima em papel A4 ou Carta</li>
  <li>Utilize margens mínimas a direita e a esquerda</li>
  <li>Recorte na linha pontilhada</li>
  <li>Não rasure o código de barras</li>
  </ul>
  </td></tr> 
 
  <tr><td colspan=11 class=BoletoPontilhado>&nbsp;</td></tr>
  <TR>
    <TD colspan=4 class=BoletoLogo><img src='Imagens/104.jpg'></TD>
    <TD colspan=2 class=BoletoCodigoBanco>104-0</TD>
    <TD colspan=6 class=BoletoLinhaDigitavel>84680000001 6 85520082089 9 99680035070 3 86328807799 4</TD>
  </TR>
  <TR>
    <TD colspan=10 class=BoletoTituloEsquerdo>Local de Pagamento</TD>
    <TD class=BoletoTituloDireito>Vencimento</TD>
  </TR>
  <TR>
    <TD colspan=10 class=BoletoValorEsquerdo style='text-align: left; padding-left : 0.1cm'>Pagável em qualquer banco até o dia do vencimento</TD>
    <TD class=BoletoValorDireito>06/12/2019</TD>
  </TR>  
  <TR>
    <TD colspan=10 class=BoletoTituloEsquerdo>Cedente</TD>
    <TD class=BoletoTituloDireito>Agência/Código do Cedente</TD>
  </TR>
  <TR>
    <TD colspan=10 class=BoletoValorEsquerdo style='text-align: left; padding-left : 0.1cm'>Games4You</TD>
    <TD class=BoletoValorDireito>4742/16855200820</TD>
  </TR>   
  <TR>
    <TD colspan=3 class=BoletoTituloEsquerdo>Data do Documento</TD>
    <TD colspan=4 class=BoletoTituloEsquerdo>Número do Documento</TD>
    <TD class=BoletoTituloEsquerdo>Espécie</TD>
    <TD class=BoletoTituloEsquerdo>Aceite</TD>
    <TD class=BoletoTituloEsquerdo>Data do Processamento</TD>
    <TD class=BoletoTituloDireito>Nosso Número</TD>
  </TR>
  <TR>
    <TD colspan=3 class=BoletoValorEsquerdo>03/12/2019</TD>
    <TD colspan=4 class=BoletoValorEsquerdo>2</TD>
    <TD class=BoletoValorEsquerdo>RC</TD>
    <TD class=BoletoValorEsquerdo>N</TD>
    <TD class=BoletoValorEsquerdo>03/12/2019</TD>
    <TD class=BoletoValorDireito>85520082089</TD>
  </TR>  
  <TR>
    <TD colspan=3 class=BoletoTituloEsquerdo>Uso do Banco</TD>
    <TD colspan=2 class=BoletoTituloEsquerdo>Carteira</TD>
    <TD colspan=2 class=BoletoTituloEsquerdo>Moeda</TD>
    <TD colspan=2 class=BoletoTituloEsquerdo>Quantidade</TD>
    <TD class=BoletoTituloEsquerdo>(x) Valor</TD>
    <TD class=BoletoTituloDireito>(=) Valor do Documento</TD>
  </TR>
  <TR>
    <TD colspan=3 class=BoletoValorEsquerdo>&nbsp;</TD>
    <TD colspan=2 class=BoletoValorEsquerdo>SR</TD>
    <TD colspan=2 class=BoletoValorEsquerdo>R$</TD>
    <TD colspan=2 class=BoletoValorEsquerdo>&nbsp;</TD>
    <TD class=BoletoValorEsquerdo>&nbsp;</TD>
    <TD class=BoletoValorDireito><c:set var="total" value="${0}" /><c:set var="quantidade" value="${1}" /><c:if test="${not empty carrinho}"><c:forEach var="jogos" items="${carrinho}"><c:set var="total" value="${total + jogos.valor * quantidade}" /></c:forEach></c:if>R$<fmt:formatNumber type="number"
									maxFractionDigits="2" value="${total}" /></TD>
  </TR>  
  <TR>
    <TD colspan=10 class=BoletoTituloEsquerdo>Instrucoes</TD>
    <TD class=BoletoTituloDireito>(-) Desconto</TD>
  </TR>
  <TR>
    <TD colspan=10 rowspan=9 class=BoletoValorEsquerdo style='text-align: left; vertical-align:top; padding-left : 0.1cm'>Não receber após data de vencimento</TD>
    <TD class=BoletoValorDireito>&nbsp;</TD>
  </TR>  
  <TR>
    <TD class=BoletoTituloDireito>(-) Outras Deduções/Abatimento</TD>
  </TR>  
  <TR>
    <TD class=BoletoValorDireito>&nbsp;</TD>
  </TR>  
  <TR>
    <TD class=BoletoTituloDireito>(+) Mora/Multa/Juros</TD>
  </TR>  
  <TR>
    <TD class=BoletoValorDireito>&nbsp;</TD>
  </TR>  
  <TR>
    <TD class=BoletoTituloDireito>(+) Outros Acréscimos</TD>
  </TR>  
  <TR>
    <TD class=BoletoValorDireito>&nbsp;</TD>
  </TR>  
  <TR>
    <TD class=BoletoTituloDireito>(=) Valor Cobrado</TD>
  </TR>  
  <TR>
    <TD class=BoletoValorDireito>&nbsp;</TD>
  </TR>                
  <TR>
    <TD rowspan=3 Class=BoletoTituloSacado>Sacado:</TD>
    <TD colspan=8 Class=BoletoValorSacado>${logado.nome}</TD>
    <TD colspan=2 Class=BoletoValorSacado>${logado.cpfCliente}</TD>
  </TR> 
  <TR>
    <TD colspan=10 Class=BoletoValorSacado>${endereco.rua} ${logado.numero} ${endereco.bairro}</TD>
  </TR>
  <TR>
    <TD colspan=10 Class=BoletoValorSacado>${endereco.cidade} ${endereco.estado}&nbsp;${endereco.cep}</TD>
  </TR>  
  <TR>
    <TD colspan=2 Class=BoletoTituloSacador>Sacador / Avalista:</TD>
    <TD colspan=9 Class=BoletoValorSacador>${logado.nome}</TD>
  </TR>
  <TR>
    <TD colspan=11 class=BoletoTituloDireito style='text-align: right; padding-right: 0.1cm'>Recibo do Sacado - Autenticação Mecânica</TD>
  </TR>
  <TR>
    <TD colspan=11 height=60 valign=top>&nbsp;</TD>
  </TR>
  <tr><td colspan=11 class=BoletoPontilhado>&nbsp;</td></tr>  
  <TR>
    <TD colspan=4 class=BoletoLogo><img src='Imagens/104.jpg'></TD>
    <TD colspan=2 class=BoletoCodigoBanco>104-0</TD>
    <TD colspan=6 class=BoletoLinhaDigitavel>84680000001 6 85520082089 9 99680035070 3 86328807799 4</TD>
  </TR>
  <TR>
    <TD colspan=10 class=BoletoTituloEsquerdo>Local de Pagamento</TD>
    <TD class=BoletoTituloDireito>Vencimento</TD>
  </TR>
  <TR>
    <TD colspan=10 class=BoletoValorEsquerdo style='text-align: left; padding-left : 0.1cm'>Pagável em qualquer banco até o dia do vencimento</TD>
    <TD class=BoletoValorDireito>06/12/2019</TD>
  </TR>  
  <TR>
    <TD colspan=10 class=BoletoTituloEsquerdo>Cedente</TD>
    <TD class=BoletoTituloDireito>Agência/Código do Cedente</TD>
  </TR>
  <TR>
    <TD colspan=10 class=BoletoValorEsquerdo style='text-align: left; padding-left : 0.1cm'>Games4You</TD>
    <TD class=BoletoValorDireito>4742/16855200820</TD>
  </TR>   
  <TR>
    <TD colspan=3 class=BoletoTituloEsquerdo>Data do Documento</TD>
    <TD colspan=4 class=BoletoTituloEsquerdo>Número do Documento</TD>
    <TD class=BoletoTituloEsquerdo>Espécie</TD>
    <TD class=BoletoTituloEsquerdo>Aceite</TD>
    <TD class=BoletoTituloEsquerdo>Data do Processamento</TD>
    <TD class=BoletoTituloDireito>Nosso Número</TD>
  </TR>
  <TR>
    <TD colspan=3 class=BoletoValorEsquerdo>03/12/2019</TD>
    <TD colspan=4 class=BoletoValorEsquerdo>2</TD>
    <TD class=BoletoValorEsquerdo>RC</TD>
    <TD class=BoletoValorEsquerdo>N</TD>
    <TD class=BoletoValorEsquerdo>03/12/2019</TD>
    <TD class=BoletoValorDireito>85520082089</TD>
  </TR>  
  <TR>
    <TD colspan=3 class=BoletoTituloEsquerdo>Uso do Banco</TD>
    <TD colspan=2 class=BoletoTituloEsquerdo>Carteira</TD>
    <TD colspan=2 class=BoletoTituloEsquerdo>Moeda</TD>
    <TD colspan=2 class=BoletoTituloEsquerdo>Quantidade</TD>
    <TD class=BoletoTituloEsquerdo>(x) Valor</TD>
    <TD class=BoletoTituloDireito>(=) Valor do Documento</TD>
  </TR>
  <TR>
    <TD colspan=3 class=BoletoValorEsquerdo>&nbsp;</TD>
    <TD colspan=2 class=BoletoValorEsquerdo>SR</TD>
    <TD colspan=2 class=BoletoValorEsquerdo>R$</TD>
    <TD colspan=2 class=BoletoValorEsquerdo>&nbsp;</TD>
    <TD class=BoletoValorEsquerdo>&nbsp;</TD>
    <TD class=BoletoValorDireito><c:set var="total" value="${0}" /><c:set var="quantidade" value="${1}" /><c:if test="${not empty carrinho}"><c:forEach var="jogos" items="${carrinho}"><c:set var="total" value="${total + jogos.valor * quantidade}" /></c:forEach></c:if>R$<fmt:formatNumber type="number"
									maxFractionDigits="2" value="${total}" /></TD>
  </TR>  
  <TR>
    <TD colspan=10 class=BoletoTituloEsquerdo>Instrucoes</TD>
    <TD class=BoletoTituloDireito>(-) Desconto</TD>
  </TR>
  <TR>
    <TD colspan=10 rowspan=9 class=BoletoValorEsquerdo style='text-align: left; vertical-align:top; padding-left : 0.1cm'>Não receber após data de vencimento</TD>
    <TD class=BoletoValorDireito>&nbsp;</TD>
  </TR>  
  <TR>
    <TD class=BoletoTituloDireito>(-) Outras Deduções/Abatimento</TD>
  </TR>  
  <TR>
    <TD class=BoletoValorDireito>&nbsp;</TD>
  </TR>  
  <TR>
    <TD class=BoletoTituloDireito>(+) Mora/Multa/Juros</TD>
  </TR>  
  <TR>
    <TD class=BoletoValorDireito>&nbsp;</TD>
  </TR>  
  <TR>
    <TD class=BoletoTituloDireito>(+) Outros Acréscimos</TD>
  </TR>  
  <TR>
    <TD class=BoletoValorDireito>&nbsp;</TD>
  </TR>  
  <TR>
    <TD class=BoletoTituloDireito>(=) Valor Cobrado</TD>
  </TR>  
  <TR>
    <TD class=BoletoValorDireito>&nbsp;</TD>
  </TR>                
  <TR>
    <TD rowspan=3 Class=BoletoTituloSacado>Sacado:</TD>
    <TD colspan=8 Class=BoletoValorSacado>${logado.nome}</TD>
    <TD colspan=2 Class=BoletoValorSacado>${logado.cpfCliente}</TD>
  </TR> 
  <TR>
    <TD colspan=10 Class=BoletoValorSacado>${endereco.rua} ${logado.numero} ${endereco.bairro}</TD>
  </TR>
  <TR>
    <TD colspan=10 Class=BoletoValorSacado>${endereco.cidade} ${endereco.estado}&nbsp;${endereco.cep}</TD>
  </TR>  
  <TR>
    <TD colspan=2 Class=BoletoTituloSacador>Sacador / Avalista:</TD>
    <TD colspan=9 Class=BoletoValorSacador>${logado.nome}</TD>
  </TR>
  <TR>
    <TD colspan=11 class=BoletoTituloDireito style='text-align: right; padding-right: 0.1cm'>Ficha de Compensação - Autenticação Mecânica</TD>
  </TR>
  <TR>
    <TD colspan=11 height=60 valign=top><img src='Imagens/codbar.jpg'></TD>
  </TR>
  <tr><td colspan=11 class=BoletoPontilhado>&nbsp;</td></tr>  
  </TABLE>

</BODY>
</HTML>
