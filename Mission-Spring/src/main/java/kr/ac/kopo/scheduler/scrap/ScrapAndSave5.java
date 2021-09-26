package kr.ac.kopo.scheduler.scrap;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import kr.ac.kopo.signal.vo.ForeignVO;

public class ScrapAndSave5 {

	public static void main(String[] args) {
		
		String urlTemp = "https://finance.naver.com/sise/investorDealTrendTime.naver?bizdate=20210924&page=1";
		Document docTemp = null;
		try {
			docTemp = Jsoup.connect(urlTemp).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Elements eleTemp = docTemp.select("a:contains(맨뒤)");
		String strlast = eleTemp.attr("href");
		String[] strArr = strlast.split("=");
		String last = strArr[strArr.length - 1];
		int lastpage = Integer.parseInt(last);
		
		
		int page = 1;
		while(true) {
			
			String url = "https://finance.naver.com/sise/investorDealTrendTime.naver?bizdate=20210924&page=" + page;
			Document doc = null;
			try {
				doc = Jsoup.connect(url).get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Elements elements = doc.select("td[class='date2']");
			String[] str = elements.text().split(" ");
			
			List<ForeignVO> list = new ArrayList<ForeignVO>();
			for(int i = 0; i < str.length; i++) {
				elements = doc.select("tr:contains(" + str[i] + ")");

				String regDate = elements.text().split(" ")[0];
				int retail = Integer.parseInt(elements.text().split(" ")[1].replace(",", ""));
				int foreign = Integer.parseInt(elements.text().split(" ")[2].replace(",", ""));
				int institutional = Integer.parseInt(elements.text().split(" ")[3].replace(",", ""));
				ForeignVO foreignVO = new ForeignVO(regDate, retail, foreign, institutional);
				
				System.out.println(foreignVO);
				list.add(foreignVO);
			}
			
			//service.insertAllForeign(list);
			
			if (page == lastpage) {
				break;
			} else {
				page++;
			}
			
		}
		
	}

}
