package kr.ac.kopo.inmemory.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.inmemory.service.InmemoryService;
import kr.ac.kopo.inmemory.vo.NoticeVO;

@Controller
public class InmemoryController {

	@Autowired
	private InmemoryService service;
	
	@GetMapping("/inmemory/selectAll")
	public ModelAndView selectAll() {
		ModelAndView mav = new ModelAndView("ajax/inmemorytable");
		List<ExchangeVO> exchangeVOs = service.searchAllExchange();
		mav.addObject("exchangeList", exchangeVOs);
		
		return mav;
	}
	

	@RequestMapping("/inmemory/insertAll")
	@ResponseBody
	public String insertAll() {

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

			while (element.hasNext()) {
				
				//하락 or 상승 구분하기
				Element e1 = element.next();
				
				String str = e1.text();
				String[] strlist = str.split(" ");
				String regDate = strlist[0].replaceAll("회", "");
				double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
				double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));

				ExchangeVO exchangeVO = new ExchangeVO();
				exchangeVO.setRegDate(regDate);
				exchangeVO.setStdRate(stdRate);
				if(e1.attr("class").equals("down")) {
					variation = variation * -1;
				}
				exchangeVO.setVariation(variation);
				
				list.add(exchangeVO);
			}
			page++;
		}
		
		//고시회차 전체 삽입
		result = service.insertAllExchange(list);

		String msg = "삽입된 열의 개수: " + result;

		return msg;
	}

	
	//이녀석은 넣음과 동시에 체크하는 모듈임.
	//따라서 5이상으로 할지, 10개 연속으로 할지 동적으로 관리자가 조절할 수 있어야함.
	//상위 10개가 변동 5이상인지
	//궁극적으로 POST처리하고 일단은 GET으로 테스트
	@RequestMapping("/inmemory/1/{top}/{var}")
	@ResponseBody
	public List<NoticeVO> insertOne(@PathVariable("top") int top, @PathVariable("var") int var) {
		
		//여기부터 인메모리에 적재.
		int latestNum = service.getSeq();
		String latest = Integer.toString(latestNum);
		System.out.println("저장된 가장 최근 회차 : " + latest);
		
		int result = 0;
		// 추가로 불러오기
		int firstpage = 1;
		loop: while (true) {
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
			
			while (element.hasNext()) {
				
				//하락 or 상승 구분하기
				Element e1 = element.next();
				
				String str = e1.text();
				String[] strlist = str.split(" ");
				String regDate = strlist[0].replaceAll("회", "");
				double stdRate = Double.parseDouble(strlist[1].replaceAll(",", ""));
				double variation = Double.parseDouble(strlist[2].replaceAll(",", ""));
				if(e1.attr("class").equals("down")) {
					variation = variation * -1;
				}
				
				// 230회부터 들어올거고 228만나면 정지
				if (regDate.equals(latest)) {
					break loop;
				}
				
				ExchangeVO exchangeVO = new ExchangeVO();
				exchangeVO.setRegDate(regDate);
				exchangeVO.setStdRate(stdRate);
				exchangeVO.setVariation(variation);
				
				// 하나씩 넣기
				result += service.insertOneExchange(exchangeVO);
				System.out.println("추가된 레코드 : " + exchangeVO);
			}
			firstpage++;
		}

		String msg = "삽입된 열의 개수: " + result;
		System.out.println(msg);
		//여기까지 인메모리에 적재 끝.
		
		
		
		//상위 10개 변동이 5이상이면 알람.
		List<ExchangeVO> vlist = service.checkExchange(top);
		
		System.out.println("최근 " + top + "개 레코드 -> " + vlist);
		int flag = 0;
		for(int i = 0; i < vlist.size(); i++) {
			if( Math.abs(vlist.get(i).getVariation()) >= var) {
				flag++;
			}
		}
		System.out.println(flag + " / " + vlist.size());
		
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		//10개 다 5이상이면?
		if(flag == vlist.size()) {
			System.out.println("알람 때리기");
			//이 함수의 시작은 ajax일거임 왜냐면 이거 한다고 페이지를 넘기지 않을 거거든. 
			//그 녀석이 이리로 넘어오고 반환값으로 뭔가를 보내면 그 녀석을
			//ajax success쪽에서 판단하고 알림을 열거나 내리거나 판단하면 될듯.
			//댓글의 경우 앞단에서 리플 다는 행위 발생시 웹소켓으로 'reply'를 달고 메세지를 보내고
			//뒷단에서 세션 파악하고 그 세션에 해당하는 녀석이 로그인 중이라면 메세지를 보낸다. 그 들어가고 나오는 통로가 모든 페이지에
			//있기때문에 이런게 가능.
			//만약에 감지를 한다치면 앞에서 감지하는 건 아니지만, 예정대로 뒷단에서 일이 진행되고 이 결과를 앞단에 전하고 "공지 때리셈"
			//다시 앞단 부터 시작해서 그러면 전체 공지를 날리는 식
			// 개별 공지를 하고 싶으면 
			//이곳 감지하는 곳에서 "messi10에게 공지 때리셈으로 보내줘야겠지"
			//그럼 이곳 감지단에서는 아이디별로 설정한 목표치를 일일이 검증하는 절차를 추가해줘야겠구만.
			//ㅇㅇ 할 수 있을 듯.
			//개인의 목표를 검증해주는 이곳에는 hsql과 oralce의 혼용이 예상되겠군.
			
			
			//프로토콜 : (all, 환율, 상승)   ->   (받는 사람, 종류, 상승 or 하락)
			NoticeVO noticeVO = new NoticeVO("all", "01", "001");
			noticeList.add(noticeVO);
		}
		
		
		
		return noticeList;
	}

}
