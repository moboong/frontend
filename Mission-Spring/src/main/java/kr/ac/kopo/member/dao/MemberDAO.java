package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {
	
	/**
	 * 로그인
	 * @param member
	 * @return id, pw 담긴 vo
	 */
	MemberVO login(MemberVO memberVO);
	
	/**
	 * 구조 저장
	 * @param jsonString, id를 담은 vo
	 * @return 성공여부
	 */
	int setStruct(MemberVO memberVO);
	
	/**
	 * 구조 가져오기(id로)
	 * @return DB에서 조회된 구조jsonString
	 */
	String getStruct(MemberVO memberVO);
}
