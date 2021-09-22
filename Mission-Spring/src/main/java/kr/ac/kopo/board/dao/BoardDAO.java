package kr.ac.kopo.board.dao;

import java.util.List;

import kr.ac.kopo.board.vo.BoardFileVO;
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
	 * @param no
	 * @return 성공여부
	 */
	int deleteOne(int no);
	
	
	/**
	 * 게시글 추가
	 * @param boardVO
	 * @return 성공여부
	 */
	int insertOne(BoardVO boardVO);
	
	
	/**
	 * 게시판 seq 번호
	 * @return 제일 마지막 일련번호
	 */
	int getSeq();
	
	
	/**
	 * 첨부파일 정보 저장
	 * @return 성공여부
	 */
	int insertFile(BoardFileVO boardFileVO);
	
	
	/**
	 * 조회수 증가
	 * @param no
	 */
	void increaseViewCnt(int no);
	
	
	/**
	 * 게시글 수정
	 * @param boardVO
	 * @return 성공여부
	 */
	int updateBoard(BoardVO boardVO);
	
	
	/**
	 * 파일정보 수정
	 * @param boardFileVO
	 * @return 성공여부
	 */
	int updateFile(BoardFileVO boardFileVO);
}
