package kr.ac.kopo.member.dao;

import java.util.List;

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
	
	/**
	 * 회원가입
	 * @param memberVO
	 * @return 성공여부
	 */
	int signup(MemberVO memberVO);
	
	
	/**
	 * 지표 픽 데이터 전부 가져오기
	 * @return lists
	 */
	List<String> getAllStruct();
	
	
	/**
	 * 마이페이지 가져오기
	 * @param id
	 * @return mypage정보 (MemberVO)
	 */
	MemberVO getMypage(String id);
	
	
	/**
	 * 개인정보 수정
	 * @param memberVO
	 * @return 수정여부
	 */
	int updateMypage(MemberVO memberVO);
}
