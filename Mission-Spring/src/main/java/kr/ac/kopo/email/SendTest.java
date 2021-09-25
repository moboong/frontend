package kr.ac.kopo.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SendTest {
	
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;
	@Autowired
    private JavaMailSender mailSender;
	
	@RequestMapping("/email")
	public void EmailTest() throws Exception {
		System.out.println(emailSender);
		System.out.println(email);
		System.out.println(mailSender);
		
		email.setContent("내용"); // 내용
		email.setReceiver("12132139@inha.edu");
		email.setSubject("제목"); // 제목
		emailSender.SendEmail(mailSender, email); // 보내기!
	}
	
}
