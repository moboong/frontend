package kr.ac.kopo.admin;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class ExampleSend {
	
	public static void main(String[] args) {
		String api_key = "NCSPABXT2R8TK227";
		String api_secret = "Y2BPDNR8YPKA0XHXDEQDSH9SCZ8SMIPL";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01036676373");
		params.put("from", "01036676373");
		params.put("type", "SMS");
		params.put("text", "Coolsms Testing Message!");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}