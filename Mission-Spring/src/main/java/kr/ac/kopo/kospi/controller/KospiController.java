package kr.ac.kopo.kospi.controller;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.kospi.service.KospiService;
import kr.ac.kopo.kospi.vo.KospiVO;

@Controller
public class KospiController {

	@Autowired
	private KospiService service;

	@RequestMapping("/insert/kospi")
	@ResponseBody
	public String insertAll() {
		
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
		int lastpage = Integer.parseInt(strlast.substring(leng-4, leng)); 
		
		
		while (true) {
			String url2 = "https://finance.naver.com/sise/sise_index_day.nhn?code=KOSPI&page=" + page;
			Document doc2 = null;
			try {
				doc2 = Jsoup.connect(url2).get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			elements = doc2.select("td[class='date']");
			//System.out.println(elements.text());
			
			String[] str = elements.text().split(" ");
			//System.out.println(str.length);
			
			List<KospiVO> list = new ArrayList<KospiVO>();
			//System.out.println("담기전 : " + list);
			for(int i = 0; i < str.length; i++) {
				KospiVO kospiVO = new KospiVO();
				String regDate = str[i].replace('.', '-');
				
				kospiVO.setRegDate(regDate);
				
				elements = doc2.select("tr:contains(" + str[i] + ")");
				//System.out.println(elements.text());
				kospiVO.setEndPrice(Double.parseDouble(elements.text().split(" ")[1].replaceAll(",", "")));
				kospiVO.setVariation(Double.parseDouble(elements.text().split(" ")[2].replaceAll(",", "")));
				
				//System.out.println(kospiVO);
				list.add(kospiVO);
			}
			
			System.out.println("담은 후 : " + list);
			result = result + service.insertAllKospi(list);
			
			if( page == lastpage ) {
				break;
			} else {
				page++;
			}
		}
		
		String msg = "삽입된 열의 개수: " + result;
		
		return msg;
	}
	
	public static void main(String[] args) {
		KospiController controller = new KospiController();
		controller.insertAll();
	}
}
