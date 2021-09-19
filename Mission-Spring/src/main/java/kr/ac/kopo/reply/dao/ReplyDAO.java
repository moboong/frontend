package kr.ac.kopo.reply.dao;

import java.util.List;

import kr.ac.kopo.reply.vo.ReplyVO;

public interface ReplyDAO {
	
	/**
	 * 해당 게시번호에 따른 댓글 전부 가져오기
	 * @return ReplyVO 리스트 반환
	 */
	List<ReplyVO> searchAll(int boardNo);
	
	/**
	 * 댓글 삭제
	 * @param no : 댓글번호
	 * @return 성공여부
	 */
	int deleteOne(int no);
	
	/**
	 * 댓글 추가
	 * @param replyVO : 입력폼에서 받은 댓글VO
	 * @return 성공여부
	 */
	int insertOne(ReplyVO replyVO);
	
	/**
	 * 최근 notice 리스트 가져오기
	 * @param id
	 * @return list
	 */
	List<ReplyVO> getNotice(String id);
}
