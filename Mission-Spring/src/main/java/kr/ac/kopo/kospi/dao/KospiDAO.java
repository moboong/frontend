package kr.ac.kopo.kospi.dao;

import java.util.List;

import kr.ac.kopo.kospi.vo.KospiVO;

public interface KospiDAO {
	
	String getSeq();
	
	/**
	 * 코스피정보 크롤링 후 디비저장
	 * @param kospiVOs
	 * @return 성공여부
	 */
	int insertAll(List<KospiVO> kospiVOs);
	
	int insertOne(KospiVO kospiVO);
	
	/**
	 * 전체 코스피 조회
	 * @return DB에서 조회된 KospiVO List
	 */
	List<KospiVO> searchAll();
	
	/**
	 * 1년 코스피 조회
	 * @return DB에서 조회된 KospiVO List
	 */
	List<KospiVO> searchYear();
	
	
}
