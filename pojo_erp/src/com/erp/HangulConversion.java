package com.erp;
/*
 * Post방식으로 전송시 사용함. - 한글 깨지는것 방지
 */
public class HangulConversion {
	public static String toUTF(String en) {
		if (en==null) return null;
		try {
			return new String(en.getBytes("8859_1"),"UTF-8");
		} catch (Exception e) {
			return en;
		}
	}
}