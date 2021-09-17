package kr.ac.kopo.scheduler.scrap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import kr.ac.kopo.kospi.vo.KospiVO;

public class ScrapAndSave3 {

	public static void main(String[] args) {

		String url = "https://finance.naver.com/sise/sise_index_day.nhn?code=KOSPI&page=" + 1;
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Elements elements = doc.select("td[class='date']");
		
		String[] str = elements.text().split(" ");

		for(int i = 0; i < str.length; i++) {
			KospiVO kospiVO = new KospiVO();
			String regDate = str[i].replace('.', '-');
			
			kospiVO.setRegDate(regDate);
			
			elements = doc.select("tr:contains(" + str[i] + ")");
			
			double variation = Double.parseDouble(elements.text().split(" ")[2].replaceAll(",", ""));

			Elements e1 = elements.select("img");
			if(e1.attr("alt").equals("하락")){
				variation = variation * -1;	
			}
			
			kospiVO.setEndPrice(Double.parseDouble(elements.text().split(" ")[1].replaceAll(",", "")));
			kospiVO.setVariation(variation);
			
			System.out.println(kospiVO);
		}
		
	}

}
