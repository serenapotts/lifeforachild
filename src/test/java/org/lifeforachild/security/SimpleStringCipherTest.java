package org.lifeforachild.security;

import org.junit.Test;

public class SimpleStringCipherTest {

	@Test
	public void testSingleCharacterEncryptDecrypt() throws Exception {
		SimpleStringCipher cipher = new SimpleStringCipher();
		String enc = cipher.encrypt("k");
		String dec = cipher.decrypt(enc);
		assert(dec.equals("k"));
	}
}
