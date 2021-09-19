package kr.ac.kopo.reply.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	//@Autowired
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlsessionTemplate;
	
	@Override
	public List<ReplyVO> searchAll(int boardNo) {
		List<ReplyVO> list = sqlsessionTemplate.selectList("reply.ReplyDAO.selectAllByBoardNo", boardNo);
		return list;
	}
	
	@Override
	public int deleteOne(int no) {
		int result = sqlsessionTemplate.delete("reply.ReplyDAO.deleteByNo", no);
		return result;
	}
	
	@Override
	public int insertOne(ReplyVO replyVO) {
		int result = sqlsessionTemplate.insert("reply.ReplyDAO.insertOne", replyVO);
		return result;
	}
	
	@Override
	public List<ReplyVO> getNotice(String id) {
		List<ReplyVO> list = sqlsessionTemplate.selectList("reply.ReplyDAO.getNotice", id);
		return list;
	}
}
