package org.lifeforachild.util;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import java.util.Properties;

@Component
public class MailSender {

	private static final Log LOG = LogFactory.getLog(MailSender.class);
	
	private String host;
	private String port;
	private String tlsEnable;
	private String username;
	private String password;
	private String toAddress;
	private String fromAddress;
	private String subject;
	private String messageBody;
	
	public void send(boolean isCreate, String url) {
		
		Authenticator mailAuthenticator = null;
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        if (port != null && !port.trim().isEmpty()) {
        	properties.put("mail.smtp.port", port);
        }
        if (tlsEnable != null && !tlsEnable.trim().isEmpty()) {
        	properties.put("mail.smtp.starttls.enable", "true");
        }

        Session session;
        if (username != null && !username.trim().isEmpty() && password != null && !password.trim().isEmpty()) {
	        mailAuthenticator = new Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(username, password);
	            }
	        };
	        properties.setProperty("mail.smtp.auth", "true");
	        session = Session.getDefaultInstance(properties, mailAuthenticator);
        } else {
        	session = Session.getDefaultInstance(properties);
        }

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromAddress));
            message.addRecipients(Message.RecipientType.TO, toAddress);
            message.setSubject(subject);
            message.setText(messageBody);
            Transport.send(message);
            LOG.debug("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessageBody() {
		return messageBody;
	}

	public void setMessageBody(String messageBody) {
		this.messageBody = messageBody;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getTlsEnable() {
		return tlsEnable;
	}

	public void setTlsEnable(String tlsEnable) {
		this.tlsEnable = tlsEnable;
	}
}
