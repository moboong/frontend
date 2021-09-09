package kr.ac.kopo.exchange.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.exchange.vo.ExchangeVO;

@Repository
public class ExchangeDAOImpl implements ExchangeDAO {

	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
	@Override
	public int insertAll(List<ExchangeVO> exchangeVOs) {
		int result = sqlsessionTemplate.insert("exchange.ExchangeDAO.insertAll", exchangeVOs);
		return result;
	}
	
	@Override
	public List<ExchangeVO> searchAll() {
		List<ExchangeVO> list = sqlsessionTemplate.selectList("exchange.ExchangeDAO.selectAll");
		return list;
	}
	
	@Override
	public List<ExchangeVO> searchYear() {
		List<ExchangeVO> list = sqlsessionTemplate.selectList("exchange.ExchangeDAO.selectYear");
		return list;
	}
}
