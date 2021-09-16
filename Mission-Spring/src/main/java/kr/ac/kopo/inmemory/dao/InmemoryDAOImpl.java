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
	
	public String getSeq() {
		String latest = hsqlsessionTemplate.selectOne("exchange.ExchangeDAO.getSeq");
		return latest;
	}

	
	public List<ExchangeVO> searchAllExchange() {
		List<ExchangeVO> elist = hsqlsessionTemplate.selectList("exchange.ExchangeDAO.elist");
		return elist;
	}

	
	public int insertAllExchange(List<ExchangeVO> exchangeVOs) {
		int result = hsqlsessionTemplate.update("exchange.ExchangeDAO.insertAll", exchangeVOs);
		return result;
	}

	
	public int insertOneExchange(ExchangeVO exchangeVO) {
		int result = hsqlsessionTemplate.insert("exchange.ExchangeDAO.insertOne", exchangeVO);
		return result;
	}

}
