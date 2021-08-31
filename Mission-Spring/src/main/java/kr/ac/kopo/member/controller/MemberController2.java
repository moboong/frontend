package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

//@Controller
public class MemberController2 {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/login")
	public String loginForm() {
		
		System.out.println("GET 로그인폼 접속");
		
		return "login/login";
	}
	
	@PostMapping("/login")
	public String login(MemberVO member, Model model, HttpSession session) { //스프링에서는 그냥 세션객체 요구하면 그냥 줌.
		
		System.out.println("POST 로그인 프로세스");
		System.out.println(member);
		
		MemberVO userVO = service.login(member);
		
		String msg = "";
		String view = "";
		if(userVO == null) {
			msg = "아이디 또는 패스워드가 잘못되었습니다.";
			view = "login/login";
		} else {
			session.setAttribute("userVO", userVO);
			msg = "환영합니다. [000] 님";
			view = "redirect:/";
		}
		
		model.addAttribute("msg", msg);
		
		return view;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
}
