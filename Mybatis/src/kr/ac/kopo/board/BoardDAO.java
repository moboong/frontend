package kr.ac.kopo.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.MyConfig;

public class BoardDAO {
	
	private SqlSession session;
	
	public BoardDAO() {
		session = new MyConfig().getInstance();
		System.out.println("session(dao) : " + session);
	}
	
	public void work() {
		selectAll();
	}
	
	public void work2() {
		insert();
	}
	
	public void work3() {
		selectOne();
		selectOne2();
	}
	
	public void work4() {
		selectNos();
	}
	
	
	
	public void selectWhere() {
		//List<BoardVO> list = session.selectList("board.BoardDAO.selectWhere", "asd");
		
		BoardVO vo = new BoardVO();
		vo.setTitle("asd");
		vo.setWriter("ronaldo07");
		//이거 xml에 where태그의 if를 사용하면 레알 편해지는거 느껴지지?
		//제목이 없거나, 작성자가 없거나, 둘다 없어도 하나의 select태그로 처리 가능해졌어..!
		
		List<BoardVO> list = session.selectList("board.BoardDAO.selectWhere2", vo);
		for(BoardVO b : list) {
			System.out.println(b);
		}
		
	}
	
	private void selectNos() {
//		BoardVO board = new BoardVO();
//		board.setNos(new int[] {1,2,3,31,32,33});
//		
//		List<BoardVO> list = session.selectList("board.BoardDAO.selectNos", board);
//		for(BoardVO b : list) {
//			System.out.println(b);
//		}
		
		List<Integer> nos = new ArrayList<>();
		nos.add(1);
		nos.add(2);
		nos.add(3);
		nos.add(31);
		nos.add(32);
		nos.add(33);
		
		List<BoardVO> list = session.selectList("board.BoardDAO.selectNos2", nos);
		for(BoardVO b : list) {
			System.out.println(b);
		}
	}
	
	private void selectOne2() {
		BoardVO board = new BoardVO();
		board.setNo(301);
		
		Map<String, Object> map = session.selectOne("board.BoardDAO.selectOne4", board);
		
		Set<String> keys = map.keySet();
		for(String key : keys) {
			System.out.println(key + " : " + map.get(key));
		}
	}
	
	
	private void selectOne() {
		BoardVO board = new BoardVO();
		board.setNo(301);
		
		BoardVO result = session.selectOne("board.BoardDAO.selectOne3", 301);
		//BoardVO result = session.selectOne("board.BoardDAO.selectOne", board);//얜 알아서 넣어줌. 담는 그릇에 따라 동적으로
		//하나니까 리스트 아니야.
		System.out.println(result);
	}
	
	
	
	private void selectAll(){
		//List<BoardVO> list = session.selectList("board.BoardDAO.selectAll");
		List<BoardVO> list = session.selectList("board.BoardDAO.selectAllMap");

		
		for(BoardVO board : list) {
			System.out.println(board);
		}
	}
	
	
	private void insert() {
		BoardVO board = new BoardVO();
		board.setTitle("asd 삽입2...");
		board.setWriter("ronaldo07");
		board.setContent("삽입됐나???");
		
		session.insert("board.BoardDAO.newBoard", board);
		session.commit();
		
		System.out.println("삽입 완료...");
	}
}
