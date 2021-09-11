package kr.ac.kopo.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.signal.vo.CustomVO;
import kr.ac.kopo.signal.vo.PickrateVO;

@SessionAttributes({ "userVO" }) // 이 어노테이션만 있으면, 리퀘스트가 아니라 세션에 올라가
@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	@GetMapping("/login")
	public String loginForm(HttpSession session) {

		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		if (userVO != null) {
			session.setAttribute("msg", "이미 로그인한 상태입니다.");
			return "redirect:/";
		}

		return "member/login";
	}

	@PostMapping("/login")
	public String login(MemberVO member, Model model, HttpSession session) { // 스프링에서는 그냥 세션객체 요구하면 그냥 줌.

		MemberVO userVO = service.login(member);

		String msg = "";
		String view = "";
		if (userVO == null) {
			msg = "아이디 또는 패스워드가 잘못되었습니다.";
			view = "member/login";
			model.addAttribute("msg", msg);
		} else {
			// 세션등록 새방법(세션등록마저 디스패처한테 짬 때릴래, 위에 어노테이션 붙이면 됨.)
			model.addAttribute("userVO", userVO);
			msg = "환영합니다. " + userVO.getName() + "님";
			session.setAttribute("msg", msg);

			// 이제 로그인 후에 그냥 가면 안되고 직전 페이지로 가게함.
			String dest = (String) session.getAttribute("dest");
			if (dest != null) {
				session.removeAttribute("dest");
				view = "redirect:" + dest;
			} else {
				view = "redirect:/";
			}
		}

		return view;
	}

	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus, HttpSession session) {
		// 세션어트리뷰트(어노)를 사용한 이상 내가 여기서 session을 직접 조작할 수 없어. sessionStatus를 사용해서 삭제
		System.out.println("세션삭제 전: " + sessionStatus.isComplete());
		sessionStatus.setComplete();
		System.out.println("세션삭제 후: " + sessionStatus.isComplete());

		session.setAttribute("msg", "안녕히가세요. 이용해주셔서 감사합니다.");

		return "redirect:/";
	}

	@GetMapping("/signup")
	public String signupForm(HttpSession session) {

		MemberVO userVO = (MemberVO) session.getAttribute("userVO");

		if (userVO != null) {
			session.setAttribute("msg", "이미 로그인한 상태입니다.");
			return "redirect:/";
		}

		return "member/signup";
	}

	@PostMapping("/signup")
	public String signup(@Valid MemberVO member, Errors error, HttpSession session) {

		// System.out.println(member);

		if (error.hasErrors()) {
			System.out.println("회원가입 오류발생!!!");
			return "member/signup";
		}

		String msg = "";
		int result = service.signup(member);
		if (result == 0) {
			msg = "회원등록 실패했습니다.";
		} else {
			msg = "회원등록 완료했습니다.";
		}

		session.setAttribute("msg", msg);
		return "redirect:/login";
	}

	@GetMapping("/custom/userpage")
	public ModelAndView getStruct(HttpSession session) {

		ModelAndView mav = new ModelAndView("custom/userpage/struct-default");

		MemberVO member = (MemberVO) session.getAttribute("userVO");

		if (member != null) {

			String struct = service.getStruct(member);
			Gson gson = new Gson();
			List<CustomVO> list = gson.fromJson(struct, new TypeToken<List<CustomVO>>() {
			}.getType());

			mav.addObject("list", list);

		}

		return mav;
	}

	@PostMapping("/custom/userpage")
	@ResponseBody
	public String setStruct(@RequestParam("struct") String struct, HttpSession session) {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("userVO");
		if (member != null) {
			member.setStruct(struct);
			// 서비스 불러서 디비 드가서 등록하고 int 로 반환하기
			result = service.setStruct(member);
		}

		String msg = "";
		if (result != 0) {
			msg = "저장 성공";
		} else {
			msg = "저장 실패 or 비로그인";
		}

		return msg;
	}

	@GetMapping("/custom/graph/{value}")
	public ModelAndView getGraph(@PathVariable("value") String value) {

		ModelAndView mav = new ModelAndView("custom/graph/" + value);

		return mav;
	}

	// 데이터분석: 전체 가져오기
	@GetMapping("/custom/pickrate")
	public ModelAndView getAllStruct() {

		Gson gson = new Gson();
		List<String> structList = service.getAllStruct();
		int all = structList.size(); // 전체 회원수
		System.out.println("전체 회원수:" + all);

		PickrateVO pickrateVO = new PickrateVO(0, 0, 0, 0, 0, 0, 0, 0, 0);

		for (int j = 0; j < all; j++) {

			String one = structList.get(j);
			List<CustomVO> list = gson.fromJson(one, new TypeToken<List<CustomVO>>() {
			}.getType());

			if (list != null) {

				for (int i = 0; i < list.size(); i++) {
					String no = list.get(i).getNo();
					switch (no) {
					case "1":
						pickrateVO.setG1(pickrateVO.getG1() + 1);
						break;
					case "2":
						pickrateVO.setG2(pickrateVO.getG2() + 1);
						break;
					case "3":
						pickrateVO.setG3(pickrateVO.getG3() + 1);
						break;
					case "4":
						pickrateVO.setG4(pickrateVO.getG4() + 1);
						break;
					case "5":
						pickrateVO.setG5(pickrateVO.getG5() + 1);
						break;
					case "6":
						pickrateVO.setG6(pickrateVO.getG6() + 1);
						break;
					case "7":
						pickrateVO.setG7(pickrateVO.getG7() + 1);
						break;
					case "8":
						pickrateVO.setG8(pickrateVO.getG8() + 1);
						break;
					case "9":
						pickrateVO.setG9(pickrateVO.getG9() + 1);
						break;
					default:
						System.out.println("이상값 발생");
						break;
					}
				}
			}
		}

		System.out.println("계산전:" + pickrateVO);
		pickrateVO.getRate(all);
		System.out.println("계산후:" + pickrateVO);

		ModelAndView mav = new ModelAndView("modal/addgraph");
		mav.addObject("pickrateVO", pickrateVO);

		return mav;
	}
}
