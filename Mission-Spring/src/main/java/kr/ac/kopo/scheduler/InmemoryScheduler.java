package kr.ac.kopo.scheduler;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.ac.kopo.admin.ExampleClient;
import kr.ac.kopo.admin.service.AdminService;
import kr.ac.kopo.admin.vo.ConditionVO;
import kr.ac.kopo.email.Email;
import kr.ac.kopo.email.EmailSender;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.inmemory.service.InmemoryService;
import kr.ac.kopo.kospi.vo.KospiVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Component
public class InmemoryScheduler {

	@Autowired
	private InmemoryService hsqlService;

	@Autowired
	private AdminService oracleService;

	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;
	@Autowired
	private JavaMailSender mailSender;

	// 매일 9시에
	@Scheduled(cron = "0 1 9 * * *")
	public void insertAll() {

		int result = 0;
		int page = 1;
		List<ExchangeVO> list = new ArrayList<ExchangeVO>();

		while (true) {

			String url = "https://finance.naver.com/marketindex/exchangeDegreeCountQuote.nhn?marketindexCd=FX_USDKRW&page="
					+ page;
			Document doc = null;
			try {
				doc = Jsoup.connect(url).get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			Elements elements = doc.select("table[class='tbl_exchange today']>tbody");
			if (elements.text().length() == 0) {
				break;
			}

			Iterator<Element> element = elements.select("tr").iterator();

			while (element.hasNext()) {

				// 하락 or 상승 구분하기
				Element e1 = element.next();

				String str = e1.text();
				String[] strlist = str.split(" ");
				String regDate = strlist[0].replaceAll("회", "");
				double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
				double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));

				ExchangeVO exchangeVO = new ExchangeVO();
				exchangeVO.setRegDate(regDate);
				exchangeVO.setStdRate(stdRate);
				if (e1.attr("class").equals("down")) {
					variation = variation * -1;
				}
				exchangeVO.setVariation(variation);

				list.add(exchangeVO);
			}
			page++;
		}

		// 고시회차 전체 삽입
		result = hsqlService.insertAllExchange(list);

		String msg = "삽입된 열의 개수: " + result;
		System.out.println(msg);

	}

	// 1분마다
	@Scheduled(cron = "0 0/1 * * * *")
	public void insertOne() {

		// 여기부터 인메모리에 적재.
		try {
			int latestNum = hsqlService.getSeq();

			String latest = Integer.toString(latestNum);
			System.out.println("저장된 가장 최근 회차 : " + latest);

			int result = 0;
			// 추가로 불러오기
			int firstpage = 1;
			loop: while (true) {
				String url = "https://finance.naver.com/marketindex/exchangeDegreeCountQuote.nhn?marketindexCd=FX_USDKRW&page="
						+ firstpage;
				Document doc = null;
				try {
					doc = Jsoup.connect(url).get();
				} catch (Exception e) {
					e.printStackTrace();
				}
				Elements elements = doc.select("table[class='tbl_exchange today']>tbody");
				if (elements.text().length() == 0) {
					break;
				}

				Iterator<Element> element = elements.select("tr").iterator();

				while (element.hasNext()) {

					// 하락 or 상승 구분하기
					Element e1 = element.next();

					String str = e1.text();
					String[] strlist = str.split(" ");
					String regDate = strlist[0].replaceAll("회", "");
					double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
					double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));
					if (e1.attr("class").equals("down")) {
						variation = variation * -1;
					}

					// 230회부터 들어올거고 228만나면 정지
					if (regDate.equals(latest)) {
						break loop;
					}

					ExchangeVO exchangeVO = new ExchangeVO();
					exchangeVO.setRegDate(regDate);
					exchangeVO.setStdRate(stdRate);
					exchangeVO.setVariation(variation);

					// 하나씩 넣기
					result += hsqlService.insertOneExchange(exchangeVO);
					System.out.println("추가된 레코드 : " + exchangeVO);
				}
				firstpage++;
			}

			String msg = "삽입된 열의 개수: " + result;
			System.out.println(msg);
			// 여기까지 인메모리에 적재 끝.

			// 위기감지하기
			checkThreat();

		} catch (Exception e) {
			e.printStackTrace();
			insertAll();
		}

	}

	// 매일 9시에
	@Scheduled(cron = "0 1 9 * * *")
	public void insertAllKospi() {

		int page = 1;

		String urlTemp = "https://finance.naver.com/sise/sise_index.naver?code=KOSPI";
		Document docTemp = null;
		try {
			docTemp = Jsoup.connect(urlTemp).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Elements eleTemp = docTemp.select("iframe[name='time']");

		String paramUrl = "https://finance.naver.com" + eleTemp.attr("src") + "&page=";
		String url = paramUrl + 1;

		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		Elements eleTemp2 = doc.select("a:contains(맨뒤)");
		String strlast = eleTemp2.attr("href");
		String[] strArr = strlast.split("=");
		String last = strArr[strArr.length - 1];
		int lastpage = Integer.parseInt(last);

		while (true) {
			String url3 = paramUrl + page;
			Document doc3 = null;
			try {
				doc3 = Jsoup.connect(url3).get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			Elements elements = doc3.select("td[class='date']");

			String[] str = elements.text().split(" ");

			List<KospiVO> list = new ArrayList<KospiVO>();
			for (int i = 0; i < str.length; i++) {
				KospiVO kospiVO = new KospiVO();
				String regDate = str[i];

				kospiVO.setRegDate(regDate);

				elements = doc3.select("tr:contains(" + str[i] + ")");

				double variation = Double.parseDouble(elements.text().split(" ")[2].replaceAll(",", ""));

				Elements e1 = elements.select("img");
				if (e1.attr("alt").equals("하락")) {
					variation = variation * -1;
				}

				kospiVO.setEndPrice(Double.parseDouble(elements.text().split(" ")[1].replaceAll(",", "")));
				kospiVO.setVariation(variation);

				System.out.println(kospiVO);
				list.add(kospiVO);
			}

			hsqlService.insertAllKospi(list);

			if (page == lastpage) {
				break;
			} else {
				page++;
			}
		}

	}

	// 위기 감지 메소드
	private void checkThreat() throws Exception {

		// 알림 조건 룰 가져와서 적용하기
		ConditionVO conditionVO = new ConditionVO();
		conditionVO.setCode("미국-달러환율");
		ConditionVO condition = oracleService.selectOneExchange(conditionVO);

		int top = condition.getTop();
		int var = condition.getVar();

		List<ExchangeVO> vlist = hsqlService.checkExchange(top);

		System.out.println("최근 " + top + "개 레코드 -> " + vlist);
		int flag = 0;
		for (int i = 0; i < vlist.size(); i++) {
			if (Math.abs(vlist.get(i).getVariation()) >= var) {
				flag++;
			}
		}
		System.out.println(flag + " / " + vlist.size());
		if (flag == vlist.size()) {
			System.out.println("위기 감지 알람");

			// 소켓알림보내기
			broadcast();

			// SMS문자알림
			// sendSMS();

			// Email알림
			// sendEmail();

			// 카카오알림
			// sendKakao();
		}
	}

	// 소켓 전체알림 메소드
	private void broadcast() throws URISyntaxException {
		ExampleClient c = new ExampleClient(new URI("ws://localhost:9999/Mission-Spring/replyEcho"));
		c.connect();
	}

	@SuppressWarnings("unused")
	// email 보내기 메소드
	private void sendEmail() throws Exception {

		email.setContent("[환율] : 미국달러 환율에서 주목할만한 변동을 보였습니다. 어서 스톡시그널을 확인해보세요!"); // 내용
		email.setReceiver("luffy333@naver.com");
		email.setSubject("<하나 스톡시그널 위기감지 알림>"); // 제목
		emailSender.SendEmail(mailSender, email); // 보내기!
	}

	@SuppressWarnings("unused")
	// 문자 보내기 메소드
	private void sendSMS() {
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
