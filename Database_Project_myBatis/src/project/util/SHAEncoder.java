package project.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHAEncoder {

	public static String doSHAEncode(String raw) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		md.update(raw.getBytes());
		String hex = String.format("%064x", new BigInteger(1, md.digest()));
		return hex;
	}
}
