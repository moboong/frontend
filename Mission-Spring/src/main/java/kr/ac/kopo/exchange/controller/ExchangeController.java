package kr.ac.kopo.exchange.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.exchange.service.ExchangeService;
import kr.ac.kopo.exchange.vo.ExchangeVO;

@Controller
public class ExchangeController {

	@Autowired
	private ExchangeService service;

	// 일별 환율 주기적으로 넣기(주기적으로 사용)
	@RequestMapping("/insertOne/exchange")
	@ResponseBody
	public String insertOne() {

		String latest = service.getSeq();
		System.out.println("저장된 가장 최근 날짜" + latest);

		int result = 0;
		// 추가로 불러오기
		int firstpage = 1;
		loop: while (true) {
			String url = "https://finance.naver.com/marketindex/exchangeDailyQuote.nhn?marketindexCd=FX_USDKRW&page="
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
				
				//하락 or 상승 구분하기
				Element e1 = element.next();
				
				String str = e1.text();
				String[] strlist = str.split(" ");
				String regDate = strlist[0].replace('.', '-');
				double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
				double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));

				// 230회부터 들어올거고 228만나면 정지
				if (regDate.equals(latest)) {
					break loop;
				}

				ExchangeVO exchangeVO = new ExchangeVO();
				exchangeVO.setRegDate(regDate);
				exchangeVO.setStdRate(stdRate);
				if(e1.attr("class").equals("down")) {
					variation = variation * -1;
				}
				exchangeVO.setVariation(variation);

				// 하나씩 넣기
				result += service.insertOneExchange(exchangeVO);

			}
			firstpage++;
		}
		

		String msg = "삽입된 열의 개수: " + result;

		return msg;
	}

	// 전체 일별 환율 넣기(1회용)
	// @RequestMapping("/insertAll/exchange")
	// @ResponseBody
	public String insertAll() {

		int result = 0;
		int page = 1;

		while (true) {

			String url = "https://finance.naver.com/marketindex/exchangeDailyQuote.nhn?marketindexCd=FX_USDKRW&page="
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

			List<ExchangeVO> list = new ArrayList<ExchangeVO>();
			while (element.hasNext()) {
				
				//하락 or 상승 구분하기
				Element e1 = element.next();
				
				String str = e1.text();
				String[] strlist = str.split(" ");
				String regDate = strlist[0].replace('.', '-');
				double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
				double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));
				if(e1.attr("class").equals("down")) {
					variation = variation * -1;
				}
				
				ExchangeVO exchangeVO = new ExchangeVO();
				exchangeVO.setRegDate(regDate);
				exchangeVO.setStdRate(stdRate);
				exchangeVO.setVariation(variation);

				list.add(exchangeVO);
			}
			page++;
			System.out.println(list);
			result = result + service.insertAllExchange(list);
		}

		String msg = "삽입된 열의 개수: " + result;

		return msg;
	}

	
	@RequestMapping("/show/exchange")
	@ResponseBody
	public List<ExchangeVO> selectAll() {
		// 안에 코스피 바인드 돼있음.
		List<ExchangeVO> exchangeVOs = service.searchAllExchange();
		return exchangeVOs;
	}

	@RequestMapping("/show/exchange/year")
	@ResponseBody
	public List<ExchangeVO> selectYear() {
		List<ExchangeVO> exchangeVOs = service.searchYearExchange();
		return exchangeVOs;
	}
	
	@RequestMapping("/insertTest/oracle")
	@ResponseBody
	public String insertTest() {
		
		long beforeTime = System.currentTimeMillis();
        
		int cnt = 0;
		for(int i = 0; i < 100000; i++) {
			cnt = cnt + service.insertTest();			
		}

		long afterTime = System.currentTimeMillis();
		double secDiffTime = (afterTime - beforeTime)/(double)1000; //두 시간에 차 계산
		String result = "시간차이(m) : " + secDiffTime + "초\n개수: " + cnt;
		System.out.println(result);
		
		return result;
	}
}