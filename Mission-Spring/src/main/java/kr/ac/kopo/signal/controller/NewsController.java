package kr.ac.kopo.signal.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.signal.vo.NewsVO;

@Controller
public class NewsController {
	
	@RequestMapping("/news/{keyword}/{page}")
	public ModelAndView exchangeNews(@PathVariable("keyword") String keyword, @PathVariable("page") int page) {
		
		ModelAndView mav = new ModelAndView("ajax/newslist");
		
		String url = "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=" + keyword + "&start=" + page;
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Elements elements = doc.select("ul[class='list_news'] div[class='news_wrap api_ani_send']");
		
		//최근 시간 출력
		String latestTime = elements.select("span[class='info']").get(0).text();
		
		//공유영역 등록하기
		System.out.println("최근 시간 : " + latestTime);
		mav.addObject("latestTime", latestTime);
		mav.addObject("keyword", keyword);
		
		
		//항목별 출력
		Iterator<Element> title = elements.select("a[class='news_tit']").iterator();
		Iterator<Element> contents = elements.select("a[class='api_txt_lines dsc_txt_wrap']").iterator();
		Iterator<Element> aTitle = elements.select("a[class='news_tit']").iterator();
		Iterator<Element> aImg = elements.select("img[class='thumb api_get']").iterator();
		
		List<NewsVO> newsList = new ArrayList<NewsVO>(); 
		while (title.hasNext()) {
						
			NewsVO newsVO = new NewsVO();
			newsVO.setTitle(title.next().text());
			newsVO.setContents(contents.next().text());
			newsVO.setLink(aTitle.next().attr("href"));
			if(aImg.hasNext() == true){
				newsVO.setImgSrc(aImg.next().attr("src"));			
			} else {
				newsVO.setImgSrc("https://search.pstatic.net/common/?src=https%3A%2F%2Fimgnews.pstatic.net%2Fimage%2Forigin%2F5003%2F2021%2F09%2F10%2F1683490.jpg&type=ff264_180&expire=2&refresh=true");
			}
			
			newsList.add(newsVO);
		}
		
		//공유영역 등록하기
		System.out.println(newsList);
		mav.addObject("newsList", newsList);
		

		return mav;
	}
	
}
