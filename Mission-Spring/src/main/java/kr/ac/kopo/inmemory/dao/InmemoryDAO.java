package kr.ac.kopo.inmemory.dao;

import java.util.List;

import kr.ac.kopo.exchange.vo.ExchangeVO;

public interface InmemoryDAO {

	int getSeq();

	List<ExchangeVO> searchAllExchange();

	int insertAllExchange(List<ExchangeVO> exchangeVOs);

	int insertOneExchange(ExchangeVO exchangeVO);
	
	List<ExchangeVO> checkExchange();
}
