package com.lumodiem.common.filter;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PassWordEncodingWrapper extends HttpServletRequestWrapper {

	public PassWordEncodingWrapper(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String name) {
		if(name.contains("pw") && name != null) {
			String ori = super.getParameter(name);
			String enc = getSHA512(ori);
			return enc;
		}
		return super.getParameter(name);
	}

	private String getSHA512(String str) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] strByte = str.getBytes();
		md.update(strByte);
		byte[] encryptByte = md.digest();
		return Base64.getEncoder().encodeToString(encryptByte);
	}
	
}
