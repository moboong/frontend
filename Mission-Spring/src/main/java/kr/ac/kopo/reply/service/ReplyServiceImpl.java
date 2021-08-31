package kr.ac.kopo.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.reply.dao.ReplyDAO;
import kr.ac.kopo.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	
	public List<ReplyVO> selectAllReply(int boardNo) {
		List<ReplyVO> list = replyDAO.searchAll(boardNo);
		return list;
	}

	public int deleteOneReply(int no) {
		int result = replyDAO.deleteOne(no);
		return result;
	}

	public int insertOneReply(ReplyVO replyVO) {
		int result = replyDAO.insertOne(replyVO);
		return result;
	}

}
