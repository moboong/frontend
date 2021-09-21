package kr.ac.kopo.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(MemberVO memberVO) {
		MemberVO userVO = memberDAO.login(memberVO);
		return userVO;
	}

	@Override
	public int setStruct(MemberVO memberVO) {
		int result = memberDAO.setStruct(memberVO);
		return result;
	}

	@Override
	public String getStruct(MemberVO memberVO) {
		String result = memberDAO.getStruct(memberVO);
		return result;
	}
	
	@Override
	public int signup(MemberVO memberVO) {
		int result = memberDAO.signup(memberVO);
		return result;
	}
	
	@Override
	public List<String> getAllStruct() {
		List<String> list = memberDAO.getAllStruct();
		return list;
	}
	
	@Override
	public MemberVO getMypage(String id) {
		MemberVO mypageVO = memberDAO.getMypage(id);
		return mypageVO;
	}
	
	@Override
	public int updateMypage(MemberVO memberVO) {
		int result = memberDAO.updateMypage(memberVO);
		return result;
	}
}
