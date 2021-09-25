package com.spring.bank.emailHandler;

import java.security.MessageDigest;

public class SHA256 {

	public static String getEncrypt(String rawPassword, String salt) {
	      
	      String result = "";
	      byte[] b = (rawPassword + salt).getBytes();
	      
	      try {
	         
	         MessageDigest md = MessageDigest.getInstance("SHA-256");
	         md.update(b);
	         
	         byte[] bResult = md.digest();
	         
	         for(byte data : bResult) {
	            
	            System.out.println(data + " ");
	            
	         }
	         System.out.println();
	         
	         StringBuffer sb = new StringBuffer();
	         for (byte data : bResult) {
	            sb.append(Integer.toString(data & 0xff, 16));
	         }
	         
	         result = sb.toString();
	         
	         System.out.println(result);
	         
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	      return result;
	      
	   }

}
