package kr.ac.kopo;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
//여기까지가 사실상 간이 서버를 실행한다는 느낌.(그래서 그 xml에서 지정한 템플릿이 생성된거야.)
public class BoardTest {
	
	@Autowired
	private BoardService boardService;
	
	
	//@Autowired
	//private BoardDAO boardDAO;
	//이녀석이 탈락하고 위에 녀석이 된 이유를 알겠지?
	
	
	//@Autowired
	//private SqlSessionTemplate sqlSessionTemplate;
	//이녀석이 탈락하고 위에 녀석이 된 이유를 알겠지?
	//-> 자동주입돼서 안에 sqlSessionTemplate이 이미 존재해 너가 만들필요 없어. 있는 거 사용해.
	
	
	@Test
	public void 전체게시글조회Test() throws Exception {
		List<BoardVO> list = boardService.selectAllBoard();
		//List<BoardVO> list = boardDAO.searchAll();
		//List<BoardVO> list = sqlSessionTemplate.selectList("board.BoardDAO.selectAll");
		
		for(BoardVO board : list) {
			System.out.println(board);
		}
	}
	
	
	//화면 구성하지 않아도 dao 테스트를 할 수 있다..!!
	//이거 진짜 중요해 이거 방법 잘 알아둬라.
}
