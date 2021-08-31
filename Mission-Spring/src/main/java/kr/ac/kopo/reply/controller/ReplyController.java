package kr.ac.kopo.reply.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.reply.service.ReplyService;
import kr.ac.kopo.reply.vo.ReplyVO;

@RestController
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	@GetMapping("/reply/{boardNo}")
	public List<ReplyVO> selectAll(@PathVariable("boardNo") int boardNo) {
		List<ReplyVO> replyList = service.selectAllReply(boardNo);
		
		//String json = new Gson().toJson(replyList);
		//그냥 자바로 보내도 json이 됨.
		
		return replyList;
	}
	
	@RequestMapping("/reply/delete/{no}")
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
	public String insertByNo(@Valid ReplyVO replyVO, Errors error) {
		int result = service.insertOneReply(replyVO);
		
		if(error.hasErrors()) {
			System.out.println("댓글 오류발생!!!");
			return "/reply/" + replyVO.getBoardNo();
		}
		
		String msg = "";
		if(result == 0) {
			msg = "댓글 등록 실패했습니다.";
		} else {
			msg = "댓글 등록 완료했습니다.";
		}
		
		return msg;
	}
}
