package kr.ac.kopo.scheduler;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import kr.ac.kopo.kospi.service.KospiService;
import kr.ac.kopo.kospi.vo.KospiVO;

//@Component
public class KospiScheduler {

	@Autowired
	private KospiService service;
	
	//새벽 1시
	@Scheduled(cron = "0 0 1 * * *")
	public void insertOne() {

		String latest = service.getSeq();
		System.out.println("저장된 가장 최근 날짜" + latest);

		int page = 1;
		int result = 0;
		loop: while (true) {
			String url = "https://finance.naver.com/sise/sise_index_day.nhn?code=KOSPI&page=" + page;
			Document doc = null;
			try {
				doc = Jsoup.connect(url).get();
			} catch (Exception e) {
				e.printStackTrace();
			}

			Elements elements = doc.select("td[class='date']");

			String[] str = elements.text().split(" ");

			for (int i = 0; i < str.length; i++) {
				KospiVO kospiVO = new KospiVO();
				String regDate = str[i].replace('.', '-');

				if (regDate.equals(latest)) {
					break loop;
				}

				kospiVO.setRegDate(regDate);

				elements = doc.select("tr:contains(" + str[i] + ")");

				double variation = Double.parseDouble(elements.text().split(" ")[2].replaceAll(",", ""));

				Elements e1 = elements.select("img");
				if (e1.attr("alt").equals("하락")) {
					variation = variation * -1;
				}

				kospiVO.setEndPrice(Double.parseDouble(elements.text().split(" ")[1].replaceAll(",", "")));
				kospiVO.setVariation(variation);

				result += service.insertOneKospi(kospiVO);
			}

			page++;
		}

		String msg = "삽입된 열의 개수: " + result;
		System.out.println(msg);
	}

	
	//이거는 초기화 1회용@Scheduled
	public void insertAll() {

		int page = 1;
		int result = 0;

		String url = "https://finance.naver.com/sise/sise_index_day.nhn?code=KOSPI&page=" + page;
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		Elements elements = doc.select("a:contains(맨뒤)");
		String strlast = elements.attr("href");
		int leng = strlast.length();
		int lastpage = Integer.parseInt(strlast.substring(leng - 4, leng));

		while (true) {
			String url2 = "https://finance.naver.com/sise/sise_index_day.nhn?code=KOSPI&page=" + page;
			Document doc2 = null;
			try {
				doc2 = Jsoup.connect(url2).get();
			} catch (Exception e) {
				e.printStackTrace();
			}

			elements = doc2.select("td[class='date']");

			String[] str = elements.text().split(" ");

			List<KospiVO> list = new ArrayList<KospiVO>();
			for (int i = 0; i < str.length; i++) {
				KospiVO kospiVO = new KospiVO();
				String regDate = str[i].replace('.', '-');

				kospiVO.setRegDate(regDate);

				elements = doc2.select("tr:contains(" + str[i] + ")");

				double variation = Double.parseDouble(elements.text().split(" ")[2].replaceAll(",", ""));

				Elements e1 = elements.select("img");
				if (e1.attr("alt").equals("하락")) {
					variation = variation * -1;
				}

				kospiVO.setEndPrice(Double.parseDouble(elements.text().split(" ")[1].replaceAll(",", "")));
				kospiVO.setVariation(variation);

				list.add(kospiVO);
			}

			System.out.println("담은 후 : " + list);
			result = result + service.insertAllKospi(list);

			if (page == lastpage) {
				break;
			} else {
				page++;
			}
		}

		String msg = "삽입된 열의 개수: " + result;
		System.out.println(msg);
	}
}
