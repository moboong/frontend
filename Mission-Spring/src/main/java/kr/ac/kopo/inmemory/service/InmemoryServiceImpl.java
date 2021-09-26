package kr.ac.kopo.inmemory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.inmemory.dao.InmemoryDAO;
import kr.ac.kopo.kospi.vo.KospiVO;
import kr.ac.kopo.signal.vo.ForeignVO;

@Service
public class InmemoryServiceImpl implements InmemoryService {

	@Autowired
	private InmemoryDAO inmemoryDAO;
	
	@Override
	public int getSeq() {
		int latest = inmemoryDAO.getSeq();
		return latest;
	}
	
	@Override
	public List<ExchangeVO> searchAllExchange() {
		List<ExchangeVO> elist = inmemoryDAO.searchAllExchange();
		return elist;
	}

	@Override
	public int insertAllExchange(List<ExchangeVO> exchangeVOs) {
		int result = inmemoryDAO.insertAllExchange(exchangeVOs);
		return result;
	}

	@Override
	public int insertOneExchange(ExchangeVO exchangeVO) {
		int result = inmemoryDAO.insertOneExchange(exchangeVO);
		return result;
	}
	
	@Override
	public List<ExchangeVO> checkExchange(int top) {
		List<ExchangeVO> vlist = inmemoryDAO.checkExchange(top);
		return vlist;
	}
	
	@Override
	public int insertAllKospi(List<KospiVO> kospiVOs) {
		int result = inmemoryDAO.insertAllKospi(kospiVOs);
		return result;
	}
	
	@Override
	public List<KospiVO> searchAllKospi() {
		List<KospiVO> list = inmemoryDAO.searchAllKospi();
		return list;
	}
	
	@Override
	public int insertAllForeign(List<ForeignVO> foreignVOs) {
		int result = inmemoryDAO.insertAllForeign(foreignVOs);
		return result;
	}
	
	@Override
	public List<ForeignVO> searchAllForeign() {
		List<ForeignVO> list = inmemoryDAO.searchAllForeign();
		return list;
	}
	

}
