package kr.ac.kopo.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping("/")
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView("index");
		
//		String msg = (String)session.getAttribute("msg");
//		if (msg != null) {
//			session.removeAttribute("msg");
//			mav.addObject("msg", msg);
//		}
		//메세지 인터셉터에 이 코드 있음

		return mav;
	}
}
