package kr.ac.kopo.custom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.ac.kopo.custom.vo.CustomVO;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

//@Controller
public class CustomController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/custom/userpage")
	public ModelAndView getStruct(HttpSession session) {
		
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		System.out.println(userVO);
		
		MemberVO member = new MemberVO();
		member.setId("messi10");
		
		String struct = service.getStruct(member);
		Gson gson = new Gson();
		List<CustomVO> list = gson.fromJson(struct, new TypeToken<List<CustomVO>>(){}.getType());

		ModelAndView mav = new ModelAndView("custom/userpage/struct-default");
		mav.addObject("list", list);

		return mav;
	}
	
	@PostMapping("/custom/userpage")
	@ResponseBody
	public String setStruct(@RequestParam("struct") String struct, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("userVO");
		member.setStruct(struct);
		
		//서비스 불러서 디비 드가서 등록하고 int 로 반환하기
		int result = service.setStruct(member); 
		
		String msg = "";
		if(result != 0) {
			msg = "저장 성공";
		} else {
			msg = "저장 실패";
		}
		
		return msg;
	}
	
	@GetMapping("/custom/graph/{value}")
	public ModelAndView getGraph(@PathVariable("value") String value) {
		
		ModelAndView mav = new ModelAndView("custom/graph/" + value);
		
		return mav;
	}
}
