package kr.ac.kopo.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;

//컴포넌트스캔할 때 만들어져야하니까 리파지토리
@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlsessionTemplate;
	
	@Override
	public List<BoardVO> searchAll() {
		List<BoardVO> list = sqlsessionTemplate.selectList("board.BoardDAO.selectAll");
		return list;
	}
	
	@Override
	public BoardVO searchOne(int no) {
		BoardVO board = sqlsessionTemplate.selectOne("board.BoardDAO.selectByNo", no);
		return board;
	}
	
	@Override
	public int deleteOne(int no) {
		int result = sqlsessionTemplate.delete("board.BoardDAO.deleteByNo", no);
		return result;
	}
	
	@Override
	public int insertOne(BoardVO boardVO) {
		int result = sqlsessionTemplate.insert("board.BoardDAO.insertOne", boardVO);
		return result;
	}
	
	@Override
	public int getSeq() {
		int seq = sqlsessionTemplate.selectOne("board.BoardDAO.getSeq");
		return seq;
	}
	
	@Override
	public int insertFile(BoardFileVO boardFileVO) {
		int result = sqlsessionTemplate.insert("board.BoardDAO.insertFile", boardFileVO);
		return result;
	}
	
	@Override
	public void increaseViewCnt(int no) {
		sqlsessionTemplate.update("board.BoardDAO.increaseViewCnt", no);
	}
	
	@Override
	public int updateBoard(BoardVO boardVO) {
		int result = sqlsessionTemplate.update("board.BoardDAO.updateBoard", boardVO);
		return result;
	}
	
	@Override
	public int updateFile(BoardFileVO boardFileVO) {
		int result = sqlsessionTemplate.update("board.BoardDAO.updateFile", boardFileVO);
		return result;
	}
}
