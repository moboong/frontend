package kr.ac.kopo.kospi.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.kospi.vo.KospiVO;

@Repository
public class KospiDAOImpl implements KospiDAO {
	
	//@Autowired
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlsessionTemplate;
	
	public String getSeq() {
		String latest = sqlsessionTemplate.selectOne("kospi.KospiDAO.getSeq");
		return latest;
	}
	
	
	public int insertAll(List<KospiVO> kospiVOs) {
		int result = sqlsessionTemplate.insert("kospi.KospiDAO.insertAll", kospiVOs);
		return result;
	}
	
	public int insertOne(KospiVO kospiVO) {
		int result = sqlsessionTemplate.insert("kospi.KospiDAO.insertOne", kospiVO);
		return result;	
	}
	
	public List<KospiVO> searchAll() {
		List<KospiVO> list = sqlsessionTemplate.selectList("kospi.KospiDAO.selectAll");
		return list;
	}

	
	public List<KospiVO> searchYear() {
		List<KospiVO> list = sqlsessionTemplate.selectList("kospi.KospiDAO.selectYear");
		return list;
	}

}
