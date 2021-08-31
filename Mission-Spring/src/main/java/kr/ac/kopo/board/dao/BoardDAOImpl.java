package kr.ac.kopo.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.board.vo.BoardVO;

@Repository
//컴포넌트스캔할 때 만들어져야하니까 리파지토리
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
	public List<BoardVO> searchAll() {
		List<BoardVO> list = sqlsessionTemplate.selectList("board.BoardDAO.selectAll");
		return list;
	}
	
	public BoardVO searchOne(int no) {
		BoardVO board = sqlsessionTemplate.selectOne("board.BoardDAO.selectByNo", no);
		return board;
	}
	
	public int deleteOne(int no) {
		int result = sqlsessionTemplate.delete("board.BoardDAO.deleteByNo", no);
		return result;
	}
	
	public int insertOne(BoardVO boardVO) {
		int result = sqlsessionTemplate.insert("board.BoardDAO.insertOne", boardVO);
		return result;
	}
}
