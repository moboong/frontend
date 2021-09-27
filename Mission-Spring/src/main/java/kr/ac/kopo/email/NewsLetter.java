package kr.ac.kopo.email;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
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
	
	
	@RequestMapping("/newsLetterhtml")
	public void EmailhtmlTest(HttpSession session) throws Exception {
		
		HtmlEmail mail = new HtmlEmail();
		mail.setHostName("smtp.gmail.com");
		mail.setCharset("utf-8"); //인코딩 설정
		mail.setDebug(true); //메일 전송 과정 추적해서 콘솔에 띄워줌
		
		mail.setAuthentication("luffy0318@gmail.com", "fnvl125!"); //로그인하기 위해 정보 입력
		mail.setSSLOnConnect(true); //입력한 정보로 로그인 요청
		
		try {
			mail.setFrom("luffy0318@gmail.com", "관리자");	//보내는 사람 메일 / 이름 설정
			mail.addTo("luffy333@naver.com", "황준호"); //받는 사람 메일 / 이름, 회원가입 페이지에에서 가져온다.
			//mail.addTo("받을 메일", "수신자"); //복수의 사람 지정 가능
			
			mail.setSubject("[하나 스톡시그널 데일리 뉴스레터]");
			
			StringBuffer msg = new StringBuffer();
			msg.append("<div style=\"background:#ffffff;margin:0;padding:0;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;\">\r\n"
					+ "    <div style=\"background:#ffffff;margin:0 auto;padding:0;width:100%;max-width:600px;letter-spacing:-1px;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;box-sizing:border-box;-webkit-text-size-adjust:none;\">\r\n"
					+ "        <table width=\"100%\" style=\"margin:0;padding:0;max-width:600px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
					+ "            <tbody><!-- header --><tr><td height=\"37\" style=\"margin:0;padding:0;text-align:center;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;\">\r\n"
					+ "                    <table style=\"margin:0;padding:0;width:100%;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
					+ "                        <tbody><tr><td align=\"left\" valign=\"bottom\" width=\"112\" height=\"37\"><a href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=http%3A%2F%2Fwww.saramin.co.kr%2F%3Futm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dheader_logo&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" target=\"_blank\" rel=\"noreferrer noopener\"></a></td><td align=\"right\" valign=\"bottom\" style=\"color:#888;line-height:12px;font-family:Malgun Gothic, '맑은고딕', '돋움',AppleSDGothicNeo-Regular, dotum, sans-serif;font-size:14px;letter-spacing:-0.5px;\">2021. 09. 27 (월)</td></tr></tbody>\r\n"
					+ "                    </table>\r\n"
					+ "                </td></tr><tr><td height=\"12\"></td></tr><!-- //header --><!-- container --><tr><td style=\"background:#f6f7fb;border-radius:20px 20px 0 0;padding:0 16px\">\r\n"
					+ "                    <table width=\"100%\" style=\"margin:0;padding:0\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
					+ "                        <tbody><tr><td height=\"64\"></td></tr><tr><td style=\"text-align:center;margin:0;padding:0;font-size:24px;line-height:32px;letter-spacing:-1px;color:#222;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;\">\r\n"
					+ "                                <strong style=\"display:inline-block;\">손흥민님,</strong> [하나 스톡시그널] 데일리<br>\r\n"
					+ "                                뉴스레터입니다.\r\n"
					+ "                            </td></tr><tr><td height=\"48\"></td></tr><tr><td style=\"background:#fff;border-radius:10px;padding:24px 20px 48px\">\r\n"
					+ "                                <table width=\"100%\" style=\"margin:0;padding:0;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
					+ "                                    <tbody><tr><td>\r\n"
					+ "                                                                                                    <p style=\"margin:8px 0 0 0;padding:0;text-align:center\">\r\n"
					+ "                                                        \r\n"
					+ "                                                    </p>\r\n"
					+ "                                                                                                <div style=\"padding:24px 0 40px 0;color:#222;font-size:13px;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;line-height:18px\">\r\n"
					+ "                                                    <p style=\"margin:0;padding:0px 0px 5px\">\r\n"
					+ "                                                        \r\n"
					+ "                                                    </p>\r\n"
					+ "                                                    <p style=\"margin:0;padding:0 0 4px;font-size:16px;font-weight:bold;line-height:20px;text-align:left;letter-spacing:-1px\">\r\n"
					+ "                                                        <a style=\"color:#222; text-decoration: none;\" target=\"_blank\" href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=http%3A%2F%2Fwww.saramin.co.kr%2Fzf_user%2Fjobs%2Fview%3Frec_idx%3D41056174%26utm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dcustomized_recruit&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" rel=\"noreferrer noopener\">환율 시그널 : 미국 달러 환율 동향</a>\r\n"
					+ "                                                    </p>\r\n"
					+ "                                                    \r\n"
					+ "                                                    <p style=\"margin:0;padding:0;color:#555;font-size:13px;line-height:19px;letter-spacing:-0.5px;text-align:left\">\r\n"
					+ "                                                         <span>2021-09-24일 종가 : 1178.70원</span>\r\n"
					+ "                                                    </p><p style=\"margin:0;padding:0 0 4px;font-size:16px;font-weight:bold;line-height:20px;text-align:left;letter-spacing:-1px\">\r\n"
					+ "                                                        <a style=\"color:#222; text-decoration: none;\" target=\"_blank\" href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=http%3A%2F%2Fwww.saramin.co.kr%2Fzf_user%2Fjobs%2Fview%3Frec_idx%3D41056174%26utm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dcustomized_recruit&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" rel=\"noreferrer noopener\">금리 시그널 : 콜금리 동향</a>\r\n"
					+ "                                                    </p><p style=\"margin:0;padding:0;color:#555;font-size:13px;line-height:19px;letter-spacing:-0.5px;text-align:left\">\r\n"
					+ "                                                         <span>2021-09-24일 종가 : 1178.70원</span>\r\n"
					+ "                                                    </p><p style=\"margin:0;padding:0 0 4px;font-size:16px;font-weight:bold;line-height:20px;text-align:left;letter-spacing:-1px\">\r\n"
					+ "                                                        <a style=\"color:#222; text-decoration: none;\" target=\"_blank\" href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=http%3A%2F%2Fwww.saramin.co.kr%2Fzf_user%2Fjobs%2Fview%3Frec_idx%3D41056174%26utm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dcustomized_recruit&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" rel=\"noreferrer noopener\">유가 시그널 : 두바이유 동향</a>\r\n"
					+ "                                                    </p><p style=\"margin:0;padding:0;color:#555;font-size:13px;line-height:19px;letter-spacing:-0.5px;text-align:left\">\r\n"
					+ "                                                         <span>2021-09-24일 종가 : 1178.70원</span>\r\n"
					+ "                                                    </p><p style=\"margin:0;padding:0 0 4px;font-size:16px;font-weight:bold;line-height:20px;text-align:left;letter-spacing:-1px\">\r\n"
					+ "                                                        <a style=\"color:#222; text-decoration: none;\" target=\"_blank\" href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=http%3A%2F%2Fwww.saramin.co.kr%2Fzf_user%2Fjobs%2Fview%3Frec_idx%3D41056174%26utm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dcustomized_recruit&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" rel=\"noreferrer noopener\">원자재 시그널 : 구리 동향</a>\r\n"
					+ "                                                    </p><p style=\"margin:0;padding:0;color:#555;font-size:13px;line-height:19px;letter-spacing:-0.5px;text-align:left\">\r\n"
					+ "                                                         <span>2021-09-24일 종가 : 1178.70원</span>\r\n"
					+ "                                                    </p><p style=\"margin:0;padding:0 0 4px;font-size:16px;font-weight:bold;line-height:20px;text-align:left;letter-spacing:-1px\">\r\n"
					+ "                                                        <a style=\"color:#222; text-decoration: none;\" target=\"_blank\" href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=http%3A%2F%2Fwww.saramin.co.kr%2Fzf_user%2Fjobs%2Fview%3Frec_idx%3D41056174%26utm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dcustomized_recruit&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" rel=\"noreferrer noopener\">금속 시그널 : 국제 금 동향</a>\r\n"
					+ "                                                    </p><p style=\"margin:0;padding:0;color:#555;font-size:13px;line-height:19px;letter-spacing:-0.5px;text-align:left\">\r\n"
					+ "                                                         <span>2021-09-24일 종가 : 1178.70원</span>\r\n"
					+ "                                                    </p><p style=\"margin:0;padding:0 0 4px;font-size:16px;font-weight:bold;line-height:20px;text-align:left;letter-spacing:-1px\">\r\n"
					+ "                                                        <a style=\"color:#222; text-decoration: none;\" target=\"_blank\" href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=http%3A%2F%2Fwww.saramin.co.kr%2Fzf_user%2Fjobs%2Fview%3Frec_idx%3D41056174%26utm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dcustomized_recruit&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" rel=\"noreferrer noopener\">주가지수 시그널 : 나스닥종합 동향</a>\r\n"
					+ "                                                    </p>\r\n"
					+ "                                                    \r\n"
					+ "                                                    <p style=\"margin:0;padding:0;color:#555;font-size:13px;line-height:19px;letter-spacing:-0.5px;text-align:left\">\r\n"
					+ "                                                         <span>2021-09-24일 종가 : 1178.70원</span>\r\n"
					+ "                                                    </p>\r\n"
					+ "                                                    \r\n"
					+ "                                                </div>\r\n"
					+ "                                            </td></tr></tbody>\r\n"
					+ "                                </table>\r\n"
					+ "                                <table width=\"100%\" style=\"margin:0;padding:0;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
					+ "    <tbody><tr><td align=\"center\" style=\"padding:40px 0 24px;border-top:1px solid #dee1ea;color:#222;font-size:16px;font-weight:bold;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;line-height:24px;letter-spacing:-0.5px;\">꼭 읽어보셔야 할 TIP</td></tr><tr><td style=\"padding:0 0 24px 0\">\r\n"
					+ "                <strong style=\"color:#222;font-size:14px;line-height:24px;letter-spacing:-0.5px\">전문가의 이론</strong>\r\n"
					+ "                <p style=\"margin:0 0 8px 0;color:#444;font-size:14px;line-height:20px;letter-spacing:-0.5px\">하나 스톡시그널에서 제공하는 장기투자전문 투자정보 지금바로 만나보세요! 매일 아침 일어나는 여러 거시경제지표 이슈 단번에 해결해드리겠습니다.</p>\r\n"
					+ "                <a href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=https%3A%2F%2Fwww.saramin.co.kr%2Fzf_user%2Fcompany-review-qst-and-ans%2Fdetail-page%3Fqust_idx%3D8313%26utm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dqna&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" target=\"_blank\" style=\"color:#888;font-size:12px;line-:16px;letter-spacing:-0.5px\" rel=\"noreferrer noopener\">더보기 &gt;</a>\r\n"
					+ "            </td></tr><tr><td style=\"padding:0 0 40px 0\">\r\n"
					+ "                <strong style=\"color:#222;font-size:14px;line-height:24px;letter-spacing:-0.5px\">기업리뷰</strong>\r\n"
					+ "                <p style=\"margin:0 0 8px 0;color:#444;font-size:14px;line-height:20px;letter-spacing:-0.5px\">사람들과 분위기가 너무 좋았어요</p>\r\n"
					+ "                <a href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=https%3A%2F%2Fwww.saramin.co.kr%2Fzf_user%2Fcompany-review%2F%3Futm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dcompany_review&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" target=\"_blank\" style=\"color:#888;font-size:12px;line-:16px;letter-spacing:-0.5px\" rel=\"noreferrer noopener\">더보기 &gt;</a>\r\n"
					+ "            </td></tr></tbody>\r\n"
					+ "</table>\r\n"
					+ "                                <table width=\"100%\" style=\"margin:0;padding:0;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
					+ "        <tbody><tr></tr><tr><td style=\"padding:0 0 34px 0;font-size:0;text-align:center\">\r\n"
					+ "                <!-- 기업정보 3개 일때 -->\r\n"
					+ "                                    \r\n"
					+ "                            <!-- 기업정보 4개 일때 -->\r\n"
					+ "                            </td></tr><tr><td style=\"padding:0 0 40px 0;font-size:0;text-align:left\">\r\n"
					+ "            <p style=\"margin:0;padding:0 0 2px;text-align:left\">\r\n"
					+ "                \r\n"
					+ "            </p>\r\n"
					+ "                            \r\n"
					+ "                            \r\n"
					+ "                            \r\n"
					+ "                    </td></tr><tr><td style=\"padding:0;text-align:center\">\r\n"
					+ "                \r\n"
					+ "                <p style=\"margin:0;padding:24px 0 0 0;text-align:center\"><a href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=https%3A%2F%2Fwww.saramin.co.kr%2Fzf_user%2Fcompany-info%2Fview%3Fcsn%3D1208113002%26utm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dcompany_info&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" rel=\"noreferrer noopener\" target=\"_blank\"><span style=\"display:inline-block;width:190px;height:48px;border-radius:24px;line-height:46px;font-size:16px;color:#ffffff;text-decoration:none;letter-spacing:-1px;background-color:#4876ef;box-shadow:0 6px 8px 0 rgba(71, 103, 130, 0.1);vertical-align:top;\">스톡시그널 더보기</span></a></p>\r\n"
					+ "            </td></tr></tbody>\r\n"
					+ "    </table>\r\n"
					+ "                            </td></tr><tr><td height=\"24\"></td></tr><tr><td style=\"text-align:center\">\r\n"
					+ "                                <img src=\"http://www.saraminimage.co.kr/sri/mail/person/img_know_illust04.png\" alt=\"다른 기업도 확인해보세요\" style=\"margin:0;width:100%;max-width:262px;border:0;vertical-align:top\">\r\n"
					+ "                                \r\n"
					+ "                                \r\n"
					+ "                            </td></tr><tr><td height=\"64\"></td></tr></tbody></table>\r\n"
					+ "                </td></tr><!-- //content --><!-- footer --><tr><td bgcolor=\"#8d919e\">\r\n"
					+ "                    <table style=\"margin:0;padding:0;width:100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
					+ "                        <tbody><tr><td height=\"48\"></td></tr><tr><td align=\"center\">\r\n"
					+ "                                <div style=\"padding:0;font-size:0\">\r\n"
					+ "                                    \r\n"
					+ "                                    \r\n"
					+ "                                    <a href=\"https://ko-kr.facebook.com/saramin.dream\" target=\"_blank\" rel=\"noreferrer noopener\"><img src=\"http://www.saraminimage.co.kr/sri/mail/person/icon_facebook.png\" alt=\"페이스북\" style=\"margin:0 12px 0 0;width:30px;border:0;vertical-align:top\"></a>\r\n"
					+ "                                    <a href=\"https://blog.naver.com/saraminapp\" target=\"_blank\" rel=\"noreferrer noopener\"><img src=\"http://www.saraminimage.co.kr/sri/mail/person/icon_blog.png\" alt=\"블로그\" style=\"width:30px;border:0;vertical-align:top\"></a>\r\n"
					+ "                                </div>\r\n"
					+ "                            </td></tr><tr><td height=\"32\"></td></tr><tr><td style=\"padding:0 16px;font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;font-size:11px;color:#e6e9f2;line-height:16px;letter-spacing:-1px;text-align:left;\">\r\n"
					+ "                                회원님은 2021/09/13 현재 메일수신에 동의하셨기에 본 메일을 발송합니다.<br>\r\n"
					+ "                                추후 메일 수신을 원하지 않으시면 여기<a href=\"http://crm3.saramin.co.kr/mcheck_utm.php?url=http%3A%2F%2Fwww.saramin.co.kr%2Fzf_user%2Fhelp%2Fmail%2Freject%3Fkey%3DbWVtX2lkeD0xMzA3OTI5MSZtYWlsX2NvZGU9c2FyYW1pbl9wZXJfZmF2b3JfY29tcGFueSZtYWlsX2lkeD0wJnNhdmVfaWR4PTAmcmVqZWN0X2tleT0xZDJjMDNkYTc0ODdiYTkwN2RjNmI0ZjZkZWU2NzkxYg%253D%253D%26utm_source%3Dregular_favor_company_close%26utm_medium%3Dmail%26utm_campaign%3D20210913%26utm_term%3Dunsubscription&amp;uid=13079291&amp;skey=7d12db379639fd0d1cea639acf12293a&amp;ix=876838\" target=\"_blank\" style=\"font-family:AppleSDGothicNeo-Regular,Malgun Gothic, '맑은고딕', '돋움', dotum, sans-serif;font-size:11px;color:#e6e9f2;text-decoration:underline;\" rel=\"noreferrer noopener\">[수신거부]</a>를 클릭하여 주시기 바랍니다.<br>\r\n"
					+ "                            </td></tr><tr><td height=\"16\"></td></tr><tr></tr><tr><td height=\"48\"></td></tr></tbody></table>\r\n"
					+ "                </td></tr><!-- //footer --></tbody>\r\n"
					+ "        </table>\r\n"
					+ "    </div>\r\n"
					+ "</div>");

			mail.setHtmlMsg(msg.toString());
			
//			EmailAttachment file = new EmailAttachment();
//			file.setPath(session.getServletContext().getRealPath("assets/css/style.css"));
//			mail.attach(file);
			
//			file = new EmailAttachment();
//			file.setURL(new URL("https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"));
//			mail.attach(file);
			
			mail.send();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
	
}
