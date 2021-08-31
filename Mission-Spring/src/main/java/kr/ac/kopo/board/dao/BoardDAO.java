package kr.ac.kopo.board.dao;

import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;

public interface BoardDAO {
	
	/**
	 * 전체게시글 조회
	 * @return DB에서 조회된 BoardVO List
	 */
	List<BoardVO> searchAll();
	
	
	/**
	 * 상세게시글 조회
	 * @return DB에서 조회된 BoardVO board
	 */
	BoardVO searchOne(int no);
	
	
	/**
	 * 상세게시글 삭제
	 * @return DB에서 조회된 BoardVO board
	 */
	int deleteOne(int no);
	
	/**
	 * 게시글 추가
	 * @return DB에 BoardVO board 삽입
	 */
	int insertOne(BoardVO boardVO);
}
