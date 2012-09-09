package org.lifeforachild.security;

import java.io.File;
import java.io.FileInputStream;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.lifeforachild.web.AppContext;
import org.springframework.context.i18n.LocaleContextHolder;

/**
 * A simple text cipher to encrypt/decrypt a string.
 * 
 * Source: http://herbertwu.wordpress.com/2010/03/06/a-simple-string-cipher-in-java-6/
 */
public class SimpleStringCipher {
	private static byte[] linebreak = {}; // Remove Base64 encoder default linebreak
	private static String secret;
	private static SecretKey key;
	private static Cipher cipher;
	private static Base64 coder;

	static {
		try {
			// load cipher key
			String userHomeDir = System.getProperty("user.home");
			System.out.println(userHomeDir);
			String path = userHomeDir + "/lifeforachild/settings.txt";
			File file = new File(path);
			byte fileContent[] = new byte[(int)file.length()];
			FileInputStream fis = new FileInputStream(file);
			fis.read(fileContent);
			secret = new String(fileContent);
			
			key = new SecretKeySpec(secret.getBytes(), "AES");
			cipher = Cipher.getInstance("AES/ECB/PKCS5Padding", "SunJCE");
			coder = new Base64(32,linebreak,true);
		} catch (Throwable t) {
			t.printStackTrace();
		}
	}

	public static synchronized String encrypt(String plainText) {
		try
		{
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byte[] cipherText = cipher.doFinal(plainText.getBytes());
			return new String(coder.encode(cipherText));
		}
		catch (Exception e)
		{
			System.err.print("Unable to encrypt");
			e.printStackTrace();
		}
		// return nothing as this couldn't be encrypted
		return "";
	}

	public static synchronized String decrypt(String codedText) throws Exception {
		byte[] encypted = coder.decode(codedText.getBytes());
		cipher.init(Cipher.DECRYPT_MODE, key);
		byte[] decrypted = cipher.doFinal(encypted);  
		return new String(decrypted);
	}
	
	public static void main(String[] args)
	{
		String userHomeDir = System.getProperty("user.home");
		System.out.println(userHomeDir);
	}

}

