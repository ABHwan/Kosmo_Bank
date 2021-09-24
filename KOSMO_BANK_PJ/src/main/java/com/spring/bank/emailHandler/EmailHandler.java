package com.spring.bank.emailHandler;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class EmailHandler extends Authenticator {
	
	  @Override
	   protected PasswordAuthentication getPasswordAuthentication() {
	      
	      return new PasswordAuthentication("wekosmo88@gmail.com", "kosmo@88");
	   }
}
