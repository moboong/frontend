package kr.ac.kopo.scheduler.scrap;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import kr.ac.kopo.exchange.vo.ExchangeVO;

public class ScrapAndSave2 {

	public static void main(String[] args) {

		//int result = 0;
		int page = 1;

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
			//result = result + service.insertAllExchange(list);
		}
		
	}

}
