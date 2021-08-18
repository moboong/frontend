package kr.ac.kopo.board;

import java.util.List;

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
	
	private void selectAll(){
		List<BoardVO> list = session.selectList("board.BoardDAO.selectAll");
		
		for(BoardVO board : list) {
			System.out.println(board);
		}
	}
	
	
	private void insert() {
		BoardVO board = new BoardVO();
		board.setTitle("객체로 삽입...");
		board.setWriter("홍길동");
		board.setContent("삽입됐나???");
		
		session.insert("board.BoardDAO.newBoard", board);
		session.commit();
		
		System.out.println("삽입 완료...");
	}
}
