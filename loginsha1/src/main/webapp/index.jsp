<%@ page import= "com.logicaalternativa.ejemplos.loginsha1.UtilCripto" %> 
<%
/*
 *      index.jsp
 *      
 *      Copyright 2013 Miguel Rafael Esteban Martín <miguel.esteban@logicaalternativa.com>
 *      
 *      This program is free software; you can redistribute it and/or modify
 *      it under the terms of the GNU General Public License as published by
 *      the Free Software Foundation; either version 2 of the License, or
 *      (at your option) any later version.
 *      
 *      This program is distributed in the hope that it will be useful,
 *      but WITHOUT ANY WARRANTY; without even the implied warranty of
 *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *      GNU General Public License for more details.
 *      
 *      You should have received a copy of the GNU General Public License
 *      along with this program; if not, write to the Free Software
 *      Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 *      MA 02110-1301, USA.
 
 */


	// Se calcula la cadena aleatoria
	String tokenSesion =  "" + (
									UtilCripto.obtenerNumeroAleatorio( 1, 9 ) * 1000000 +
									+ UtilCripto.obtenerNumeroAleatorio( 0, 10 ) * UtilCripto.obtenerNumeroAleatorio( 0, 10000 )
								)
							;
	
	// Se mete en sesión
	session.setAttribute( "tokenSesion", tokenSesion );	


%>

<html>
<head>
<title>[LogicaAlternativa.com] Ejemplo de securización acceso sha1</title><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="https://raw.github.com/kvz/phpjs/master/functions/xml/utf8_encode.js"></script>
<script language="JavaScript" src="https://raw.github.com/kvz/phpjs/master/functions/strings/sha1.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function acceder(){

	var contra = document.forms.formularioAcceso.contra.value + '';
	
	var token= sha1('<%=tokenSesion%>' + contra);
		
	document.forms.formularioAcceso.contra.value = '';
	document.forms.formularioAcceso.token.value = token;
	
	return true;
}

function sf(){

	document.forms.formularioAcceso.usu.focus();
	
}
-->
</script>

</head>

<body onLoad="javaScript:sf();">
<div align="center">
	<p>[<b>LogicaAlternativa.com</b>] Ejemplo de securización acceso sha1</p>	
	<p>Para más información leé el <a href="http://wwww.logicaalternativa.com/java-securizacion-de-formulario-de-acceso-con-sha-1">POST</a>. También puedes ver el <a href="https://github.com/logicaalternativa/ejemplosJava/blob/master/loginsha1/src/main/webapp/index.jsp" target="_blank">código</a></p>
</div>

<br/>

<form name="formularioAcceso" method="post" action="resultado.jsp" onSubmit="return acceder()">

   <input name="token" type="hidden" value="">
    
  <table width="500" border="0" align="center" cellpadding="6" cellspacing="0">
    <tr> 
      <td><div align="right">Usuario:</div></td>
      <td> <input name="usu" type="text" id="usu" value=""> </td>
    </tr>
    <tr> 
      <td><div align="right">Contrase&ntilde;a:</div></td>
      <td><input name="contra" type="password" id="contra"></td>
    </tr>
    <tr> 
      <td colspan="2"><div align="center"> 
          <input type="reset" name="Reset" value="Cancelar">
          &nbsp 
          <input name="entrar" type="submit" id="entrar" value="         Entrar         ">
        </div></td>
    </tr>
  </table>
  <br>
    </form>
   <br/>
   <div align="center">
  <p>Usuarios de prueba</p> 
    <table width="0" border="0" cellpadding="6" cellspacing="0">
    <tr> 
      <th><div align="right">Usuario</div></th>
      <th><div align="left">Contraseña</div></th>
    </tr>
    <tr> 
      <td><div align="right">usu1</div></td>
      <td><div align="left">contra1</div></td>
    </tr>
    <tr> 
      <td><div align="right">usu1</div></td>
      <td><div align="left">contra2</div></td>
    </tr>
	</table>
 </div>
</body>
</html>

