package kr.ac.kopo.member.service;

import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberService {
	
	MemberVO login(MemberVO member);
	
	int setStruct(MemberVO memberVO);
	
	String getStruct(MemberVO memberVO);
	
	int signup(MemberVO memberVO);
	
	List<String> getAllStruct();
	
	MemberVO getMypage(String id);
	
	int updateMypage(MemberVO memberVO);
}
