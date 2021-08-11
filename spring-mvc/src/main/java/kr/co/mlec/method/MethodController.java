package kr.co.mlec.method;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MethodController {
	
	@RequestMapping(value="/method/method.do", method = RequestMethod.GET)
	public String callGet() {
		return "method/methodForm";
	}
	
	@RequestMapping(value="/method/method.do", method = RequestMethod.POST)
	public String callPost() {
		return "method/methodProcess";
	}
	
}


//이 녀석을 보면 흠.. 그냥 포워드만 해주는 컨트롤러 잖아? 기분나빠. 굳이 컨트롤러 만들어야해?
//그래서 컨트롤러 없이 페이지 매핑하는 방법 등장