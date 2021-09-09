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

	@RequestMapping("/insert/exchange")
	@ResponseBody
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

				String str = element.next().text();
				String[] strlist = str.split(" ");
				String regDate = strlist[0].replace('.', '-');
				double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
				double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));

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
	
	//@CrossOrigin
	@RequestMapping("/show/exchange")
	@ResponseBody
	public List<ExchangeVO> selectAll() {
		//안에 코스피 바인드 돼있음.
		List<ExchangeVO> exchangeVOs = service.searchAllExchange();
		return exchangeVOs;
	}
	
	@RequestMapping("/show/exchange/year")
	@ResponseBody
	public List<ExchangeVO> selectYear() {
		List<ExchangeVO> exchangeVOs = service.searchYearExchange();
		return exchangeVOs;
	}
}