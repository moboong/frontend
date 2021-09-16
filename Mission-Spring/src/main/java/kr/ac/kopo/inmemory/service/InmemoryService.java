package kr.ac.kopo.inmemory.service;

import java.util.List;

import kr.ac.kopo.exchange.vo.ExchangeVO;

public interface InmemoryService {
	
	String getSeq();
	
	List<ExchangeVO> searchAllExchange();
	
	int insertAllExchange(List<ExchangeVO> exchangeVOs);
	
	int insertOneExchange(ExchangeVO exchangeVO);
}