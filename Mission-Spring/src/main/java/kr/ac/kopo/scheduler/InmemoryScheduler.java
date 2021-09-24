package kr.ac.kopo.scheduler;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.inmemory.service.InmemoryService;

@Component
public class InmemoryScheduler {

	@Autowired
	private InmemoryService service;
	
	//매일 9시에
	@Scheduled(cron = "0 0 9 * * *")
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
		result = service.insertAllExchange(list);

		String msg = "삽입된 열의 개수: " + result;
		System.out.println(msg);

	}
	
	//1분마다
	@Scheduled(cron = "0 0/1 * * * *")
	public void insertOne() {

		// 여기부터 인메모리에 적재.
		try {
			int latestNum = service.getSeq();

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
					result += service.insertOneExchange(exchangeVO);
					System.out.println("추가된 레코드 : " + exchangeVO);
				}
				firstpage++;
			}

			String msg = "삽입된 열의 개수: " + result;
			System.out.println(msg);
			// 여기까지 인메모리에 적재 끝.
			
			
			//위기감지하기
			//checkThreat();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			insertAll();
		}

	}
	
	

}
