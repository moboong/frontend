package kr.ac.kopo.scheduler.scrap;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import kr.ac.kopo.kospi.vo.KospiVO;

public class ScrapAndSave4 {

	public static void main(String[] args) {
		
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
		String last = strArr[strArr.length-1];
		int lastpage = Integer.parseInt(last);
		
		while(true) {
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
			
			//service.insertAllKospi(list);
			
			if( page == lastpage ) {
				break;
			} else {
				page++;
			}
		}
	}

}
