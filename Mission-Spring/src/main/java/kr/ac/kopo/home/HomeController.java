package kr.ac.kopo.home;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping("/")
	public ModelAndView home(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("index");
		
		String msg = (String)session.getAttribute("msg");
		if (msg != null) {
			session.removeAttribute("msg");
			mav.addObject("msg", msg);
		}

		return mav;
	}
}
