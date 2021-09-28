package kr.ac.kopo.email;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class SendTest {
	
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;
	@Autowired
    private JavaMailSender mailSender;
	
	@RequestMapping("/sendWarn")
	public void EmailTest() throws Exception {
		System.out.println(emailSender);
		System.out.println(email);
		System.out.println(mailSender);
		
		email.setContent("[환율] : 미국달러 환율에서 주목할만한 변동을 보였습니다. 어서 스톡시그널을 확인해보세요!"); // 내용
		email.setReceiver("luffy333@naver.com");
		email.setSubject("<하나 스톡시그널 위기감지 알림>"); // 제목
		emailSender.SendEmail(mailSender, email); // 보내기!
		
		String api_key = "NCSPABXT2R8TK227";
		String api_secret = "Y2BPDNR8YPKA0XHXDEQDSH9SCZ8SMIPL";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01036676373");
		params.put("from", "01036676373");
		params.put("type", "SMS");
		params.put("text", "[하나 스톡시그널] : 환율(미국달러) 이상 감지! 확인 요망");
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
