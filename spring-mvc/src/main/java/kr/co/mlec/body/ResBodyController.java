package kr.co.mlec.body;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mlec.form.MemberVO;

@Controller
@RequestMapping("/ajax")
public class ResBodyController {

	@RequestMapping("/resBody.do")
	@ResponseBody // 얘가 없잖아? 그럼 [/WEB-INF/jsp/OK, 성공.jsp] 이렇게 돼.
	public String resStringBody() {

		return "OK, 성공";
	}
	// 예전에는 request불러서 공유영역에 "msg"로 등록하고 그러고 jsp가서 ${ msg }이렇게 사용했는데
	// 지금은 주소적는 칸에 msg를 넣고 @ResponseBody어노를 하면 포워드 안하고 바로 응답시키라는 의미가 돼.
	// 근데 한글이 잘 출력 안돼.(xml파일을 고치면 돼. 메세지컨버터 / 빈/ property로 set한다.)

	@RequestMapping("/resBody.json") // web.xml가서 매핑 추가해줘야함.
	@ResponseBody
	public Map<String, String> resJsonBody() {
		Map<String, String> result = new HashMap<String, String>();
		result.put("id", "hong");
		result.put("name", "홍길동");
		result.put("addr", "서울");
		return result; // 단순 문자열일 때는 그냥 인식했는데 Json이니까 또 인식 못함
		// 아까 한글 인식 못한거랑 똑같이 처리하면 돼
		// 그리고 디펜던시도 추가해줘야함 1.Jackson Databind 2.Jackson Core 3.Jackson Annotations
	}

	@RequestMapping("/resVOBody.json")
	@ResponseBody
	public MemberVO resJsonVOBody() {

		MemberVO vo = new MemberVO();
		vo.setId("hong");
		vo.setName("홍길동");
		vo.setPassword("1234");

		return vo;
	}

	@RequestMapping("/resStringListBody.json")
	@ResponseBody
	public List<String> resJsonStringListBody() {
		List<String> list = new ArrayList<String>();
		for (int i = 1; i <= 4; i++) {
			list.add(String.valueOf(i));
		}

		return list;
	}

	@RequestMapping("/resVOListBody.json")
	@ResponseBody
	public List<MemberVO> resJsonVOListBody() {

		List<MemberVO> list = new ArrayList<MemberVO>();
		for (int i = 0; i < 4; i++) {

			MemberVO vo = new MemberVO();
			vo.setId("hong");
			vo.setName("홍길동");
			vo.setPassword("1234");

			list.add(vo);
		}

		return list;
	}

	@CrossOrigin
	@RequestMapping("/jsonList.json")
	@ResponseBody
	public List<ExchangeVO> jsonList() {

		List<ExchangeVO> list = new ArrayList<ExchangeVO>();
		for (int i = 1; i <= 31; i++) {

			String date = "2021-01-" + i;

			ExchangeVO vo = new ExchangeVO();
			vo.setDate(date);
			double num = Math.pow(-1, i);
			vo.setValue(1160 + 2 * i * num);

			list.add(vo);
		}
		for (int i = 1; i <= 28; i++) {

			String date = "2021-02-" + i;

			ExchangeVO vo = new ExchangeVO();
			vo.setDate(date);
			double num = Math.pow(-1, i);
			vo.setValue(1360 + 2 * i * num);

			list.add(vo);
		}
		for (int i = 1; i <= 31; i++) {

			String date = "2021-03-" + i;

			ExchangeVO vo = new ExchangeVO();
			vo.setDate(date);
			double num = Math.pow(-1, i);
			vo.setValue(1430 + 2 * i * num);

			list.add(vo);
		}
		for (int i = 1; i <= 30; i++) {

			String date = "2021-04-" + i;

			ExchangeVO vo = new ExchangeVO();
			vo.setDate(date);
			double num = Math.pow(-1, i);
			vo.setValue(1290 + 2 * i * num);

			list.add(vo);
		}
		for (int i = 1; i <= 31; i++) {

			String date = "2021-05-" + i;

			ExchangeVO vo = new ExchangeVO();
			vo.setDate(date);
			double num = Math.pow(-1, i);
			vo.setValue(1032 + 2 * i * num);

			list.add(vo);
		}
		for (int i = 1; i <= 30; i++) {

			String date = "2021-06-" + i;

			ExchangeVO vo = new ExchangeVO();
			vo.setDate(date);
			double num = Math.pow(-1, i);
			vo.setValue(1333 + 2 * i * num);

			list.add(vo);
		}
		for (int i = 1; i <= 31; i++) {

			String date = "2021-07-" + i;

			ExchangeVO vo = new ExchangeVO();
			vo.setDate(date);
			double num = Math.pow(-1, i);
			vo.setValue(999 + 2 * i * num);

			list.add(vo);
		}
		for (int i = 1; i <= 31; i++) {

			String date = "2021-08-" + i;

			ExchangeVO vo = new ExchangeVO();
			vo.setDate(date);
			double num = Math.pow(-1, i);
			vo.setValue(1560 + 2 * i * num);

			list.add(vo);
		}
		for (int i = 1; i <= 30; i++) {

			String date = "2021-09-" + i;

			ExchangeVO vo = new ExchangeVO();
			vo.setDate(date);
			double num = Math.pow(-1, i);
			vo.setValue(960 + 2 * i * num);

			list.add(vo);
		}
		for (int i = 1; i <= 31; i++) {

			String date = "2021-10-" + i;

			ExchangeVO vo = new ExchangeVO();
			vo.setDate(date);
			double num = Math.pow(-1, i);
			vo.setValue(1160 + 2 * i * num);

			list.add(vo);
		}

		return list;
	}

}
