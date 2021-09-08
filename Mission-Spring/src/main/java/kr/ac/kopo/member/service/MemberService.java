package kr.ac.kopo.member.service;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberService {
	
	MemberVO login(MemberVO member);
	
	int setStruct(MemberVO memberVO);
	
	String getStruct(MemberVO memberVO);
}
