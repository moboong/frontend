package kr.ac.kopo.reply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.reply.service.ReplyService;
import kr.ac.kopo.reply.vo.ReplyVO;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	@GetMapping("/reply/{boardNo}")
	public ModelAndView selectAll(@PathVariable("boardNo") int boardNo) {
		
		ModelAndView mav = new ModelAndView("ajax/replylist");
		
		List<ReplyVO> replyList = service.selectAllReply(boardNo);
		
		mav.addObject("replyList", replyList);
		
		return mav;
	}
	
	@RequestMapping("/reply/delete/{no}")
	@ResponseBody
	public String deleteByNo(@PathVariable("no") int no) {
		int result = service.deleteOneReply(no);
		
		String msg = "";
		if(result == 0) {
			msg = "댓글 삭제 실패했습니다.";
		} else {
			msg = "댓글 삭제 완료했습니다.";
		}
		
		return msg;
	}
	
	@PostMapping("/reply/write")
	@ResponseBody
	public String insertByNo(@Valid ReplyVO replyVO, Errors error) {
		int result = service.insertOneReply(replyVO);
		
		if(error.hasErrors()) {
			return "댓글 등록 실패했습니다.(필수항목 누락)";
		}
		
		String msg = "";
		if(result == 0) {
			msg = "댓글 등록 실패했습니다.";
		} else {
			msg = "댓글 등록 완료했습니다.";
		}
		
		return msg;
	}
	
	@RequestMapping("/reply/notice")
	public ModelAndView getNotice(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("ajax/noticelist");
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO");
		if(userVO != null) {
			List<ReplyVO> noticeList = service.getNotice(userVO.getId());
			mav.addObject("noticeList", noticeList);			
		}
		
		return mav;
	}
}
