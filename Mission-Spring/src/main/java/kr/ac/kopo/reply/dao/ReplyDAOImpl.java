package kr.ac.kopo.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
	public List<ReplyVO> searchAll(int boardNo) {
		List<ReplyVO> list = sqlsessionTemplate.selectList("reply.ReplyDAO.selectAllByBoardNo", boardNo);
		return list;
	}

	public int deleteOne(int no) {
		int result = sqlsessionTemplate.delete("reply.ReplyDAO.deleteByNo", no);
		return result;
	}
	
	public int insertOne(ReplyVO replyVO) {
		int result = sqlsessionTemplate.insert("reply.ReplyDAO.insertOne", replyVO);
		return result;
	}

}
