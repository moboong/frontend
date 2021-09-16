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
	
	// 일별 코스피 주기적으로 넣기(주기적으로 사용)
	@RequestMapping("/insertOne/kospi")
	@ResponseBody
	public String insertOne() {
		
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

			for(int i = 0; i < str.length; i++) {
				KospiVO kospiVO = new KospiVO();
				String regDate = str[i].replace('.', '-');
				
				if(regDate.equals(latest)) {
					break loop;
				}
				
				kospiVO.setRegDate(regDate);
				
				elements = doc.select("tr:contains(" + str[i] + ")");
				
				kospiVO.setEndPrice(Double.parseDouble(elements.text().split(" ")[1].replaceAll(",", "")));
				kospiVO.setVariation(Double.parseDouble(elements.text().split(" ")[2].replaceAll(",", "")));
				
				result += service.insertOneKospi(kospiVO);
			}
			
			page++;
		}
		
		
		String msg = "삽입된 열의 개수: " + result;
		
		return msg;
	}
	
	
	// 전체 일별 코스피 넣기(1회용)
	//@RequestMapping("/insertAll/kospi")
	//@ResponseBody
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
			
			String[] str = elements.text().split(" ");
			
			List<KospiVO> list = new ArrayList<KospiVO>();
			for(int i = 0; i < str.length; i++) {
				KospiVO kospiVO = new KospiVO();
				String regDate = str[i].replace('.', '-');
				
				kospiVO.setRegDate(regDate);
				
				elements = doc2.select("tr:contains(" + str[i] + ")");
				kospiVO.setEndPrice(Double.parseDouble(elements.text().split(" ")[1].replaceAll(",", "")));
				kospiVO.setVariation(Double.parseDouble(elements.text().split(" ")[2].replaceAll(",", "")));
				
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
	
	@RequestMapping("/show/kospi")
	@ResponseBody
	public List<KospiVO> selectAll() {
		List<KospiVO> kospiVOs = service.searchAllKospi();
		return kospiVOs;
	}
	
	@RequestMapping("/show/kospi/year")
	@ResponseBody
	public List<KospiVO> selectYear() {
		List<KospiVO> kospiVOs = service.searchYearKospi();
		return kospiVOs;
	}
}
