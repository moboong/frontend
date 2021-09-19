package kr.ac.kopo.reply.service;

import java.util.List;

import kr.ac.kopo.reply.vo.ReplyVO;

public interface ReplyService {
	
	List<ReplyVO> selectAllReply(int boardNo);
	
	int deleteOneReply(int no);
	
	int insertOneReply(ReplyVO replyVO);
	
	List<ReplyVO> getNotice(String id);
}
