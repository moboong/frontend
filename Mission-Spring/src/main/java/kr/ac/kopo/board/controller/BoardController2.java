package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

@SessionAttributes({ "msg" })
//@Controller
public class BoardController2 {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/board")
	public ModelAndView selectAll() {
		List<BoardVO> boardList = service.selectAllBoard();
		
		ModelAndView mav = new ModelAndView("board/list");
		mav.addObject("list", boardList);
		
		return mav;
	}
	
	/*//1번방식
	 * @RequestMapping("/board/detail") 
	 * public void selectByNo(HttpServletRequest request) { 
	 * 		int no = Integer.parseInt(request.getParameter("no"));
	 * 		System.out.println(no + "번 상세게시글"); 
	 * }
	 */
	
	/* //2번방식
	 * @RequestMapping("/board/detail") public void selectByNo(@RequestParam("no") int no) {
	 * 		System.out.println(no + "번 상세게시글(?no=23 방식)"); 
	 * }
	 */
	
	//3번방식
	@RequestMapping("/board/{no}")
	public ModelAndView selectByNo2(@PathVariable("no") int no) {
		
		System.out.println(no + "번 상세게시글(/23 방식)");
		
		BoardVO board = service.selectOneBoard(no);
		
		ModelAndView mav = new ModelAndView("board/detail");
		mav.addObject("board", board);
		
		return mav;
	}
	
	
	@DeleteMapping("/board/delete/{no}")
	public ModelAndView deleteByNo(@PathVariable("no") int no) {
		
		int result = service.deleteOneBoard(no);
		System.out.println(result);
		
		String msg = "";
		ModelAndView mav;
		if(result == 0) {
			msg = "삭제에 실패했습니다.";
			mav = new ModelAndView("redirect:/board/" + no);
		} else {
			msg = no + "번 게시물을 삭제했습니다.";
			mav = new ModelAndView("redirect:/board");
		}
		
		mav.addObject("msg", msg);
		
		return mav;
	}
	
	
	
//	//@RequestMapping(value="/board/write", method = RequestMethod.GET)
//	@GetMapping("/board/write")
//	public String writeFrom() {
//		System.out.println("GET 폼 입장");
//		return "board/write";
//	}
	
	
//	//@RequestMapping(value="/board/write", method = RequestMethod.POST)
//	@PostMapping("/board/write")
//	public String write(BoardVO board) {	//그냥 BoardVO 넣어주면 알아서 넣어줌...
//		System.out.println("POST /board/write");
//		System.out.println(board);
//		
//		//백엔드로 유효성 검사하기
//		if(board.getTitle() == null || board.getTitle().equals("")) {
//			return "board/write";
//		}
//		return "redirect:/board";
//	}
//	//void일 경우 uri와 똑같은 경로를 return해. /board/write 이게 포워드 됨.
//	//"4.3이후" 새로운 어노테이션(GET, POST 쉽게 지정하기)
	
	@GetMapping("/board/write")
	public String writeForm(Model model) {
		
		model.addAttribute("boardVO", new BoardVO());
		
		return "board/write";
	}
		
	//백엔드로 유효성 검사하기(편하게) + Valid어노테이션 사용하기. + VO에 NotEmpty어노테이션
	@PostMapping("/board/write")
	public String write(@Valid BoardVO board, Errors error, HttpSession session) {	//그냥 BoardVO 넣어주면 알아서 넣어줌... //붙어있으어햠. 에러
		
		//System.out.println(board); //알아서 매핑돼서 입력받은 값이 board포장됨.
		
		//error.hasErrors() 귀찮은 조건식 나열? ㄴㄴ 이거 하나면 충분.
		if(error.hasErrors()) {
			System.out.println("게시물 생성 오류발생!!!");
			return "board/write";
		}
		
		String msg = "";
		int result = service.insertOneBoard(board);
		if(result == 0) {
			msg = "게시글 등록 실패했습니다.";
		} else {
			msg = "게시글 등록 완료했습니다.";
		}
		
		session.setAttribute("msg", msg);
		return "redirect:/board";
	}
}