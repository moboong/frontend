package kr.ac.kopo.board.service;

import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;

public interface BoardService {
	
	List<BoardVO> selectAllBoard();
	
	BoardVO selectOneBoard(int no);
	
	int deleteOneBoard(int no);
	
	int insertOneBoard(BoardVO boardVO);
	
//	List<BoardVO> selectAllBoardHsql();
	
}
