package kr.ac.kopo.inmemory.dao;

import java.util.List;

import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.kospi.vo.KospiVO;
import kr.ac.kopo.signal.vo.ForeignVO;

public interface InmemoryDAO {

	int getSeq();

	List<ExchangeVO> searchAllExchange();

	int insertAllExchange(List<ExchangeVO> exchangeVOs);

	int insertOneExchange(ExchangeVO exchangeVO);
	
	List<ExchangeVO> checkExchange(int top);
	
	int insertAllKospi(List<KospiVO> kospiVOs);
	
	List<KospiVO> searchAllKospi();
	
	int insertAllForeign(List<ForeignVO> foreignVOs);
	
	List<ForeignVO> searchAllForeign();
}
