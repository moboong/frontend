package kr.ac.kopo.exchange.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.exchange.dao.ExchangeDAO;
import kr.ac.kopo.exchange.vo.ExchangeVO;

@Service
public class ExchangeServiceImpl implements ExchangeService {

	@Autowired
	private ExchangeDAO exchangeDAO;
	
	@Override
	public String getSeq() {
		String latest = exchangeDAO.getSeq();
		return latest;
	}
	
	@Override
	public int insertAllExchange(List<ExchangeVO> exchangeVOs) {
		int result = exchangeDAO.insertAll(exchangeVOs);
		return result;
	}
	
	@Override
	public int insertOneExchange(ExchangeVO exchangeVO) {
		int result = exchangeDAO.insertOne(exchangeVO);
		return result;
	}
	
	@Override
	public List<ExchangeVO> searchAllExchange() {
		List<ExchangeVO> exchangeVOs = exchangeDAO.searchAll();
		return exchangeVOs;
	}
	
	@Override
	public List<ExchangeVO> searchYearExchange() {
		List<ExchangeVO> exchangeVOs = exchangeDAO.searchYear();
		return exchangeVOs;
	}
}
