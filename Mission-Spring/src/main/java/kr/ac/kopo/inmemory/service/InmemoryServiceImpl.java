package kr.ac.kopo.inmemory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.inmemory.dao.InmemoryDAO;

@Service
public class InmemoryServiceImpl implements InmemoryService {

	@Autowired
	private InmemoryDAO inmemoryDAO;

	public int getSeq() {
		int latest = inmemoryDAO.getSeq();
		return latest;
	}

	public List<ExchangeVO> searchAllExchange() {
		List<ExchangeVO> elist = inmemoryDAO.searchAllExchange();
		return elist;
	}

	public int insertAllExchange(List<ExchangeVO> exchangeVOs) {
		int result = inmemoryDAO.insertAllExchange(exchangeVOs);
		return result;
	}

	public int insertOneExchange(ExchangeVO exchangeVO) {
		int result = inmemoryDAO.insertOneExchange(exchangeVO);
		return result;
	}
	
	public List<ExchangeVO> checkExchange() {
		List<ExchangeVO> vlist = inmemoryDAO.checkExchange();
		return vlist;
	}

}
