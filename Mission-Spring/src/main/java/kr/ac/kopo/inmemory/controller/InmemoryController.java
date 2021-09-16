package kr.ac.kopo.inmemory.controller;

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

import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.inmemory.service.InmemoryService;

@Controller
public class InmemoryController {

	@Autowired
	private InmemoryService service;
	
	@RequestMapping("/inmemory/selectAll")
	@ResponseBody
	public List<ExchangeVO> selectAll() {
		List<ExchangeVO> exchangeVOs = service.searchAllExchange();
		return exchangeVOs;
	}
	

	@RequestMapping("/inmemory/insertAll")
	@ResponseBody
	public String insertAll() {

		// insertAll
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

				String str = element.next().text();
				String[] strlist = str.split(" ");
				String regDate = strlist[0];
				double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
				double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));

				ExchangeVO exchangeVO = new ExchangeVO();
				exchangeVO.setRegDate(regDate);
				exchangeVO.setStdRate(stdRate);
				exchangeVO.setVariation(variation);

				list.add(exchangeVO);
			}
			page++;
		}
		
		//고시회차 전체 삽입
		result = service.insertAllExchange(list);

		String msg = "삽입된 열의 개수: " + result;

		return msg;
	}

	

	@RequestMapping("/inmemory/insertOne")
	@ResponseBody
	public String insertOne() {

		String latest = service.getSeq();
		System.out.println("저장된 가장 최근 회차" + latest);
		
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
				
				//하락 or 상승 구분하기
				//element.next().attr("class");
				String str = element.next().text();
				String[] strlist = str.split(" ");
				String regDate = strlist[0];
				double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
				double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));
				
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
				
			}
			firstpage++;
		}
		System.out.println("다음페이지 갔나?(1이면 안간거):" + firstpage);

		String msg = "삽입된 열의 개수: " + result;
		
		//상위 5개 변동이 5이상이면 알람.
		
		
		
		return msg;
	}

}
