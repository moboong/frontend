package kr.ac.kopo.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// @Component
@Controller
public class NewsLetter {
	
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;
	@Autowired
    private JavaMailSender mailSender;
	
	
//	@Autowired
//	private KospiService kospiservice;
//	@Autowired
//	private ExchangeService exchangeservice;
	
	
	// 매일 9시에
	// @Scheduled(cron = "0 0 9 * * *")
	@RequestMapping("/newsLetter")
	public void EmailTest() throws Exception {
		
		String content = "최근 3일 시세...";
		
		
		
		
		email.setContent(content); // 내용
		email.setReceiver("12132139@inha.edu");
		email.setSubject("[하나 스톡시그널 데일리 시장지표 알림]"); // 제목
		emailSender.SendEmail(mailSender, email); // 보내기!
	}
	
}
