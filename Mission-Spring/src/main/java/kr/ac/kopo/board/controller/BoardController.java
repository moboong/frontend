package kr.ac.kopo.board.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;

@SessionAttributes({ "msg" })
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	ServletContext servletContext;
	
	//전체 게시판 리스트 출력
	@RequestMapping("/board")
	public ModelAndView selectAll() {
		List<BoardVO> boardList = service.selectAllBoard();
		
		ModelAndView mav = new ModelAndView("board/list");
		mav.addObject("list", boardList);
		
		return mav;
	}
	
	//게시글 상세보기
	@RequestMapping("/board/{no}")
	public ModelAndView selectByNo(@PathVariable("no") int no) {
		
		System.out.println(no + "번 상세게시글(/23 방식)");
		
		BoardVO board = service.selectOneBoard(no);
		
		ModelAndView mav = new ModelAndView("board/detail");
		mav.addObject("board", board);
		
		return mav;
	}
	
	//게시글 삭제
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
		
		//이건 request영역 등록 X, session영역 등록 O
		mav.addObject("msg", msg);
		
		return mav;
	}
	
	//글쓰기 폼 이동
	@GetMapping("/board/write")
	public String writeForm(Model model) {
		
		model.addAttribute("boardVO", new BoardVO());
		
		return "board/write";
	}
		
	//백엔드로 유효성 검사하기(편하게) + Valid어노테이션 사용하기. + VO에 NotEmpty어노테이션
	@PostMapping("/board/write")
	public String write(@Valid BoardVO board, Errors error, HttpSession session, MultipartHttpServletRequest mRequest) throws Exception {	
		
		System.out.println(board); //알아서 매핑돼서 입력받은 값이 board포장됨.
				
		if(error.hasErrors()) {
			System.out.println("게시물 생성 오류발생!!!");
			return "board/write";
		}
		
		//동일한 board 시퀀스 가져와서 board와 file에 넣기
		int board_no = service.getSeq();
		board.setNo(board_no);
		
		//board 등록
		String msg = "";
		int result = service.insertOneBoard(board);
		
		if(result == 0) {
			msg = "게시글 등록 실패했습니다.";
		} else {
			msg = "게시글 등록 완료했습니다.";
		}
		
		session.setAttribute("msg", msg);
		
		
		
		BoardFileVO file = new BoardFileVO(); //이제 만들어갈 file.
		file.setBoardNo(board_no);
		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload/" + board.getWriter() + "/");
		System.out.println(uploadDir);
		
		Iterator<String> iter = mRequest.getFileNames();
		while(iter.hasNext()) {
			
			String formFileName = iter.next();
			// 폼에서 파일을 선택하지 않아도 객체 생성됨
			MultipartFile mFile = mRequest.getFile(formFileName);
			
			// 원본 파일명
			String oriFileName = mFile.getOriginalFilename();
			System.out.println("원본 파일명 : " + oriFileName);
			file.setFileOriName(oriFileName);
			
			if(oriFileName != null && !oriFileName.equals("")) {
			
				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치 
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}
				
				// 파일 사이즈
				long fileSize = mFile.getSize();
				System.out.println("파일 사이즈 : " + fileSize);
				file.setFileSize(fileSize);
				
				// 고유한 파일명 만들기	
				String saveFileName = "mlec-" + UUID.randomUUID().toString() + ext; //확장자까지 붙이기
				System.out.println("저장할 파일명 : " + saveFileName);
				file.setFileSaveName(saveFileName);
			
				// 임시저장된 파일을 원하는 경로에 저장
				mFile.transferTo(new File(uploadDir + saveFileName));
				System.out.println("파일VO 체크 : " + file);
				//fileVO 디비에 저장
				int bool = service.insertFile(file);
				if(bool != 0) {
					System.out.println("파일 등록 성공");
				} else {
					System.out.println("파일 등록 실패 or 파일없음");
				}
			} 
		} 
		
		
		
		return "redirect:/board";
	}
}