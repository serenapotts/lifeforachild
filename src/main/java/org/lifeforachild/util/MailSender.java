package org.lifeforachild.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.ui.velocity.VelocityEngineFactory;
import org.springframework.ui.velocity.VelocityEngineUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

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
	
	public void send(final boolean isCreate, final boolean isChild, final String url) {
		ExecutorService executor = Executors.newFixedThreadPool(4);
		executor.submit(new Callable<Void>() {
	         public Void call() {
	        	 sendEmailViaTemplate(isCreate, isChild, url);
	        	 return null;
	         }});		
	}
	
	private Session getSession() {
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
        return session;
	}

	public void sendEmailViaTemplate(boolean isCreate, boolean isChild, final String url) {
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setSession(getSession());
		
		VelocityEngineFactory vef = new VelocityEngineFactory();
		Properties props = new Properties();
		props.put("resource.loader", "class");
		props.put("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
		vef.setVelocityProperties(props);
		
		final String type = isChild ? "Child" : "Visit";
        final String operation = isCreate ? "created" : "updated";
        
		try {
			final VelocityEngine velocityEngine = vef.createVelocityEngine();
			MimeMessagePreparator preparator = new MimeMessagePreparator() {
		        @SuppressWarnings({ "rawtypes", "unchecked" })
				public void prepare(MimeMessage mimeMessage) throws Exception {
		             MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		             message.setTo(InternetAddress.parse(toAddress));
		             message.setFrom(new InternetAddress(fromAddress));
		             message.setSubject(subject);
		             message.setSentDate(new Date());
		             
//		             InputStream imgStream = getClass().getResourceAsStream("/lfac-banner-graphic.png");
//		             if (imgStream != null) {
//			             InputStreamSource imageSource = new ByteArrayResource(
//			            		 IOUtils.toByteArray(imgStream));
//			             String contentType = message.getFileTypeMap().getContentType("lfac-banner-graphic.png");
//			             message.addInline("banner", imageSource, contentType);
//		             }

		             Map model = new HashMap();	
		             model.put("type", type);
		             model.put("operation", operation);
		             model.put("url", url);
		             
		             String text = VelocityEngineUtils.mergeTemplateIntoString(
		                velocityEngine, "velocity/childVisitCreated.vm", "UTF-8", model);
		             message.setText(text, true);
		          }
	       };
	       mailSender.send(preparator);
	       LOG.info("Email sent successfully for " + type + " " + operation + " on " + url);
		} catch (IOException ioe) {
			LOG.error("Unable to send email", ioe);
		} catch (MailException me) {
			LOG.error("Unable to send email for " + type + " " + operation + " on " + url, me);
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
