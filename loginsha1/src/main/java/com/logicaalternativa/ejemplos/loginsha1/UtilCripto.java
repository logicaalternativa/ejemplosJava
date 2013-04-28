/*
 *      UtilCripto.java
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
package com.logicaalternativa.ejemplos.loginsha1;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.security.MessageDigest;

public class UtilCripto {
	
/*
 * 
 * Representa en hexadecimal el array de bytes
 */
	private static String pasarHexadecimal( byte[] bytes ) {
		
		StringBuffer sb = new StringBuffer();
		
        for (int i = 0; i < bytes.length; i++) {
        
          sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
          
        }
        
        return sb.toString();

		
	}
	
	/*
	 * 
	 * Obtiene un número aleatorio
	 */
	public static int obtenerNumeroAleatorio(int desde, int hasta) throws Exception {
		
		if ( hasta <= desde ) {
				
			new Exception ( "El valor hasta es menor o igual que el desde" );
			
		}
		
		SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
		
		int valor = random.nextInt( ( hasta + 1 ) - desde);
		
		return  desde + valor;
		
	}
	
	/*
	 * 
	 *Obtiene el SHA-1 de la cadena
	 */
	public static String obtenerSHA1( String cadena ) {
		
		if (cadena == null) {
			
			return null;
		}
		
		try {
			
			MessageDigest miMessageDigest = MessageDigest.getInstance("SHA-1");
			
			miMessageDigest.reset();
			byte[] bytes = cadena.getBytes();
			miMessageDigest.update( bytes );
			
			return pasarHexadecimal( miMessageDigest.digest() );
			
		} catch (Exception e ) {
			
			e.printStackTrace();
			return null;
			
		}		
		
	}
	
	
}
