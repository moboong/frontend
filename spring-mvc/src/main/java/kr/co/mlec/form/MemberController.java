package kr.co.mlec.form;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/form")
public class MemberController {
	
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		
		return "form/joinForm";
	}
	
	@RequestMapping("/join.do")
	public String join(MemberVO member, Model model) { //http request 대신에 model을 준다?
		
		//아래는 모델을 내가 생성(new)해서 집어넣고 보냈지만 이건 아예 모델객체를 받아와서 썼어.(진짜 다양한 방법이 존재해..)
		model.addAttribute("member", member);
		
		return "form/memberInfo";
	}
	
	
//	@RequestMapping("/join.do")
//	public ModelAndView join(MemberVO member) {
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("form/memberInfo"); //뷰 설정
//		mav.addObject("member", member); //공유영역등록
//		
//		return mav;
//	}
	
	
	
//	@RequestMapping("/join.do")
//	public String join(@ModelAttribute("member") MemberVO member, HttpServletRequest request) { //이 어노테이션은 안써도 기능해
//		//알아서 들어가 단, name과 vo의 변수명이 같아야해(대신 이 규칙은 꼭 지켜)
//		
//		//헐, 적당히 해 공유영역에 등록하는 것도 알아서 해준다고?
//		//VO에 일일이 넣어주는것도 모자라서 공유영역에 등록까지??
//		//단, 클래스명의 소문자
//		//그런데, 내가 이름 정하고 싶어? 그럼 @ModelAttribute어노테이션 사용해서 변경해주면돼.
//		//request.setAttribute("memberVO", member);
//		
//		return "form/memberInfo";
//	}
	
//	@RequestMapping("/join.do")
//	public String join(
//			@RequestParam("id") String id, 
//			@RequestParam("password") String password, 
//			@RequestParam("name") String name, 
//			HttpServletRequest request
//			) {
//		//@RequestParam("id") -> request.getParameter("id"); 이 녀석을 어노테이션하면 dispatcher서블릿이 알아서 저렇게
//		//포장해서 보내줘. 겁나 편리하지? 이건 spring-framework이 제공하는 어노테이션이야.
//		
//		MemberVO member = new MemberVO();
//		member.setId(id);
//		member.setPassword(password);
//		member.setName(name);
//		
//		//꼭 모델앤 뷰로 안보내도 돼. 내가 리쿼
//		request.setAttribute("member", member);
//		
//		return "form/memberInfo";
//	}
	
//	@RequestMapping("/join.do")
//	public String join(HttpServletRequest request) {
//		
//		String id = request.getParameter("id");
//		String password = request.getParameter("password");
//		String name = request.getParameter("name");
//		
//		MemberVO member = new MemberVO();
//		member.setId(id);
//		member.setId(password);
//		member.setName(name);
//		
//		//꼭 모델앤 뷰로 안보내도 돼. 내가 리쿼
//		request.setAttribute("member", member);
//		
//		return "/form/memberInfo.do";
//	}

}
