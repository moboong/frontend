package kr.ac.kopo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.exchange.vo.ExchangeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/config/spring/spring-mvc.xml")
public class HsqlTest {

	@Resource(name = "hsqlSessionTemplate")
	private SqlSessionTemplate hsqlsessionTemplate;
	
	
	@Test
	public void test() {

		// select
		List<ExchangeVO> elist = hsqlsessionTemplate.selectList("exchange.ExchangeDAO.elist");
		System.out.println(elist);

		
		
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

			//List<ExchangeVO> list = new ArrayList<ExchangeVO>();
			while (element.hasNext()) {

				String str = element.next().text();
				String[] strlist = str.split(" ");
				String regDate = strlist[0].replaceAll("회", "");
				double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
				double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));

				ExchangeVO exchangeVO = new ExchangeVO();
				exchangeVO.setRegDate(regDate);
				exchangeVO.setStdRate(stdRate);
				exchangeVO.setVariation(variation);

				list.add(exchangeVO);
				
				//하나씩 넣기
				//hsqlsessionTemplate.insert("exchange.ExchangeDAO.insertOne", exchangeVO);
			}
			page++;
		}
		//크롤링 출력
		System.out.println("그냥" + list);
		result = hsqlsessionTemplate.update("exchange.ExchangeDAO.insertAll", list);
		System.out.println("입력된 열: "+ result);
		
		//inmemory에서 가져오기
		List<ExchangeVO> elist2 = hsqlsessionTemplate.selectList("exchange.ExchangeDAO.elist");
		System.out.println("in-memory" + elist2);
		
		
		int latestNum = hsqlsessionTemplate.selectOne("exchange.ExchangeDAO.getSeq");
		String latest = Integer.toString(latestNum);
		System.out.println("저장된 가장 최근 회차" + latest);
		
		
		
		// 추가로 불러오기
		int firstpage = 1;
		loop:while (true) {
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
			
			int enterCnt = 1;
			while (element.hasNext()) {

				String str = element.next().text();
				String[] strlist = str.split(" ");
				String regDate = strlist[0].replaceAll("회", "");
				double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
				double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));
				
				//230회부터 들어올거고 228만나면 정지
				if(regDate.equals(latest)) {
					break loop;
				}
				
				ExchangeVO exchangeVO = new ExchangeVO();
				exchangeVO.setRegDate(regDate);
				exchangeVO.setStdRate(stdRate);
				exchangeVO.setVariation(variation);
				
				//하나씩 넣기
				hsqlsessionTemplate.insert("exchange.ExchangeDAO.insertOne", exchangeVO);
				System.out.println("추가하기 : " + enterCnt);
				enterCnt++;
			}
			firstpage++;
		}
		System.out.println("끝:" + firstpage);
		
		
		List<ExchangeVO> vlist = hsqlsessionTemplate.selectList("exchange.ExchangeDAO.check");
		System.out.println(vlist);
	}
}
