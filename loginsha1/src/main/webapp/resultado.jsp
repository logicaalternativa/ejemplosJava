<%@ page import= "com.logicaalternativa.ejemplos.loginsha1.*" %> 
<%
/*
 *      resultado.jsp
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

	
	
	String usuario = request.getParameter( "usu" );
	String token = request.getParameter( "token" );
		
	String tokenSesion =  session.getAttribute( "tokenSesion" ) != null
								? session.getAttribute( "tokenSesion" ).toString()
									: null;	
	session.setAttribute( "tokenSesion", null );	
	
	
	// Usuarios	
	AccesoDummy miAccesoDummy = new AccesoDummy();
	
	// Se obtiene la contraseña del usuario
	String contra = miAccesoDummy.dameContrasena( usuario );
	
	// Se calcula el token
	String tokenCalculado = UtilCripto.obtenerSHA1( "" + tokenSesion + contra );	
	
	String texto = "";
	
	if ( contra != null && ! "".equals( contra )
				&& tokenCalculado.equals( token ) ){
		
		texto = "Acceso correcto";
	//	session_destroy();
	//	session_start();
		// Aquí se hace lo necesario obtener las propiedades del usuario y cargarlo en sesión
		
		
	} else {
		
		texto = "<font color=\"#ff0000\">Acceso incorrecto</font>";
		
	}
	
	
%>
<html>
<head>
<title>[LogicaAlternativa.com] Ejemplo de securización acceso sha1</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>

<body>
	<div align="center">
		<p>[<b>LogicaAlternativa.com</b>] Ejemplo de securización acceso sha1</p> 
		<p>Para más información leé el <a href="http://wwww.logicaalternativa.com/java-securizacion-de-formulario-de-acceso-con-sha-1">POST</a>. También puedes ver el <a href="https://github.com/logicaalternativa/ejemplosJava/blob/master/loginsha1/src/main/webapp/resultado.jsp" target="_blank">código</a></p>
	</div>

	<div align="center">
	<br>
	  <h2><%= texto %></h2>  
	<h3>Datos que llegan del formulario</h3>
	  <p>Usuario: <em><%= usuario %></em></p>
	  <p>Token: <em><%= token %></em></p>
	  <p>tokenCalculado: <em><%= tokenCalculado %></em></p>
	  <p>Contraseña: <em><%= request.getParameter( "contra" ) %></em></p> 
	  <p><a href= "index.jsp">volver</a></p>
	</div>

</body>
</html>
