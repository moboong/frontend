package kr.ac.kopo.exchange.service;

import java.util.List;

import kr.ac.kopo.exchange.vo.ExchangeVO;

public interface ExchangeService {
	
	String getSeq();
	
	int insertAllExchange(List<ExchangeVO> exchangeVOs);
	
	int insertOneExchange(ExchangeVO exchangeVO);
	
	List<ExchangeVO> searchAllExchange();
	
	List<ExchangeVO> searchYearExchange();
	
	int insertTest();
}
