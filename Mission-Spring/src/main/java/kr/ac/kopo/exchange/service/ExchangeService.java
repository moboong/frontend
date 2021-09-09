package kr.ac.kopo.exchange.service;

import java.util.List;

import kr.ac.kopo.exchange.vo.ExchangeVO;

public interface ExchangeService {
	
	int insertAllExchange(List<ExchangeVO> exchangeVOs);

	List<ExchangeVO> searchAllExchange();
	
	List<ExchangeVO> searchYearExchange();
}
