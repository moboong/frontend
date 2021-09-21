package kr.ac.kopo.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	//@Autowired
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public MemberVO login(MemberVO memberVO) {
		MemberVO userVO = sqlSessionTemplate.selectOne("member.MemberDAO.login", memberVO);
		return userVO;
	}
	
	@Override
	public String getStruct(MemberVO memberVO) {
		String result = sqlSessionTemplate.selectOne("member.MemberDAO.getStruct", memberVO);
		return result;
	}

	@Override
	public int setStruct(MemberVO memberVO) {
		int result = sqlSessionTemplate.update("member.MemberDAO.setStruct", memberVO);
		return result; 
	}
	
	@Override
	public int signup(MemberVO memberVO) {
		int result = sqlSessionTemplate.insert("member.MemberDAO.signup", memberVO);
		return result;
	}
	
	@Override
	public List<String> getAllStruct() {
		List<String> list = sqlSessionTemplate.selectList("member.MemberDAO.getAllStruct");
		return list;
	}
	
	@Override
	public MemberVO getMypage(String id) {
		MemberVO mypageVO = sqlSessionTemplate.selectOne("member.MemberDAO.getMypage", id);
		return mypageVO;
	}
	
	@Override
	public int updateMypage(MemberVO memberVO) {
		int result = sqlSessionTemplate.update("member.MemberDAO.updateMypage", memberVO);
		return result;
	}
}
