package kr.ac.kopo.exchange.dao;

import java.util.List;

import kr.ac.kopo.exchange.vo.ExchangeVO;

public interface ExchangeDAO {
	
	String getSeq();
	
	/**
	 * 환율정보 크롤링 후 디비저장
	 * @param exchangeVOs
	 * @return 성공여부
	 */
	int insertAll(List<ExchangeVO> exchangeVOs);
	
	int insertOne(ExchangeVO exchangeVO);
	
	/**
	 * 전체 환율 조회
	 * @return DB에서 조회된 ExchangeVO List
	 */
	List<ExchangeVO> searchAll();
	
	/**
	 * 1년 환율 조회
	 * @return DB에서 조회된 ExchangeVO List
	 */
	List<ExchangeVO> searchYear();
}
