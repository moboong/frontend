package kr.co.mlec.body;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mlec.form.MemberVO;


//@ResponseBody -> 이건 자바로 응답한 녀석들을 json으로 바꿔주는데 반대로
//json으로 받은 녀석을 java로 변환해주는 녀석이 있어. 이런거 기억해.
//@RequestBody -> 파라미터 쪽에 붙을거야. 함수 안에 파라미터

//크로스 오리진에 대해 꼭 생각해봐. 플젝하다가 만나게 될 문제일 수도 있어.

@RestController
@RequestMapping("/ajax")
public class RestBodyController {

	@RequestMapping("/restBody.do")
	public String resStringBody() {

		return "OK, 성공"; 
	}
	
	@CrossOrigin
	@RequestMapping("/restBody.json")
	public Map<String, String> resJsonBody() {
		Map<String, String> result = new HashMap<String, String>();
		result.put("id", "hong");
		result.put("name", "홍길동");
		result.put("addr", "서울");
		return result;

	}
	
	
	@RequestMapping("/restVOBody.json")
	public MemberVO resJsonVOBody() {
		
		MemberVO vo = new MemberVO();
		vo.setId("hong");
		vo.setName("홍길동");
		vo.setPassword("1234");
		
		return vo;
	}
	
	
	@RequestMapping("/restStringListBody.json")
	public List<String> resJsonStringListBody() {
		List<String> list = new ArrayList<String>();
		for(int i = 1; i <= 4; i++) {
			list.add(String.valueOf(i));
		}
		
		return list;
	}
	
	@RequestMapping("/restVOListBody.json")
	public List<MemberVO> resJsonVOListBody() {
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		for(int i = 0; i < 4; i++) {
			
			MemberVO vo = new MemberVO();
			vo.setId("hong");
			vo.setName("홍길동");
			vo.setPassword("1234");
			
			list.add(vo);
		}
		
		
		return list;
	}
	
}
