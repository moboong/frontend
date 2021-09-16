package kr.ac.kopo.exchange.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.exchange.vo.ExchangeVO;

@Repository
public class ExchangeDAOImpl implements ExchangeDAO {

	//@Autowired
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlsessionTemplate;
	
	
	public String getSeq() {
		String latest = sqlsessionTemplate.selectOne("exchange.ExchangeDAO.getSeq");
		return latest;
	}
	
	
	public int insertAll(List<ExchangeVO> exchangeVOs) {
		int result = sqlsessionTemplate.insert("exchange.ExchangeDAO.insertAll", exchangeVOs);
		return result;
	}
	
	public int insertOne(ExchangeVO exchangeVO) {
		int result = sqlsessionTemplate.insert("exchange.ExchangeDAO.insertOne", exchangeVO);
		return result;	
	}

	public List<ExchangeVO> searchAll() {
		List<ExchangeVO> list = sqlsessionTemplate.selectList("exchange.ExchangeDAO.selectAll");
		return list;
	}
	
	
	public List<ExchangeVO> searchYear() {
		List<ExchangeVO> list = sqlsessionTemplate.selectList("exchange.ExchangeDAO.selectYear");
		return list;
	}
}
