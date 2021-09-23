package kr.ac.kopo.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.admin.service.AdminService;
import kr.ac.kopo.admin.vo.ConditionVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	@RequestMapping("/admin")
	public String admin() {

		return "admin/adminpage";
	}

	// selectAll(환율)
	@GetMapping("/admin/show/{type}")
	public ModelAndView showCondition(@PathVariable("type") String type) {

		ModelAndView mav = new ModelAndView("ajax/conditionlist");
		ConditionVO conditionVO = new ConditionVO();
		conditionVO.setType(type);
		List<ConditionVO> conditionList = service.selectExchange(conditionVO);
		mav.addObject("conditionList", conditionList);

		return mav;
	}

	// update
	@PostMapping("/admin/edit/{no}")
	public ModelAndView editCondition(@PathVariable("no") int no, @RequestBody ConditionVO conditionVO) {

		ModelAndView mav = new ModelAndView("ajax/conditionlist");
		int result = service.updateExchange(conditionVO);
		if (result != 0) {
			List<ConditionVO> conditionList = service.selectExchange(conditionVO);
			mav.addObject("conditionList", conditionList);
		}

		return mav;
	}

	// insert
	@PostMapping("/admin/setCondition")
	public String setCondition(@RequestBody String condition) {

		System.out.println(condition);

		// 조건들이 어떻게 DB에 저장되는가
		// type, code, top, var
		// String result = "";

		return condition;
	}
}
