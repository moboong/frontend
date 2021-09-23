package kr.ac.kopo.inmemory.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.exchange.vo.ExchangeVO;

@Repository
public class InmemoryDAOImpl implements InmemoryDAO {

	@Resource(name="hsqlSessionTemplate")
	private SqlSessionTemplate hsqlsessionTemplate;
	
	@Override
	public int getSeq() {
		int latest = hsqlsessionTemplate.selectOne("exchange.ExchangeDAO.getSeq");
		return latest;
	}

	@Override
	public List<ExchangeVO> searchAllExchange() {
		List<ExchangeVO> elist = hsqlsessionTemplate.selectList("exchange.ExchangeDAO.elist");
		return elist;
	}

	@Override
	public int insertAllExchange(List<ExchangeVO> exchangeVOs) {
		int result = hsqlsessionTemplate.update("exchange.ExchangeDAO.insertAll", exchangeVOs);
		return result;
	}

	@Override
	public int insertOneExchange(ExchangeVO exchangeVO) {
		int result = hsqlsessionTemplate.insert("exchange.ExchangeDAO.insertOne", exchangeVO);
		return result;
	}
	
	@Override
	public List<ExchangeVO> checkExchange(int top) {
		List<ExchangeVO> vlist = hsqlsessionTemplate.selectList("exchange.ExchangeDAO.check", top);
		return vlist;
	}
	

}
