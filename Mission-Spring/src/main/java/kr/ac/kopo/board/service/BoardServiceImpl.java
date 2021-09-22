package kr.ac.kopo.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> selectAllBoard() {
		List<BoardVO> boardList = boardDAO.searchAll();
		return boardList;
	}
	
	@Override
	public BoardVO selectOneBoard(int no) {
		BoardVO board = boardDAO.searchOne(no);
		return board;
	}
	
	@Override
	public int deleteOneBoard(int no) {
		int result = boardDAO.deleteOne(no);
		return result;
	}
	
	@Override
	public int insertOneBoard(BoardVO boardVO) {
		int result = boardDAO.insertOne(boardVO);
		return result;
	}
	
	@Override
	public int getSeq() {
		int seq = boardDAO.getSeq();
		return seq;
	}
	
	@Override
	public int insertFile(BoardFileVO boardFileVO) {
		int result = boardDAO.insertFile(boardFileVO);
		return result;
	}
	
	@Override
	public void increaseViewCnt(int no) {
		boardDAO.increaseViewCnt(no);
	}
	
	@Override
	public int updateBoard(BoardVO boardVO) {
		int result = boardDAO.updateBoard(boardVO);
		return result;
	}
	
	@Override
	public int updateFile(BoardFileVO boardFileVO) {
		int result = boardDAO.updateFile(boardFileVO);
		return result;
	}
}
