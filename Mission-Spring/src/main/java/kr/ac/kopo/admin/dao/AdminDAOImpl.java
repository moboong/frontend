package kr.ac.kopo.admin.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.admin.vo.ConditionVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlsessionTemplate;
	
	@Override
	public List<ConditionVO> selectExchange(ConditionVO conditionVO){
		List<ConditionVO> list = sqlsessionTemplate.selectList("admin.AdminDAO.select01", conditionVO);
		return list;
	}
	
	@Override
	public int insertExchange(ConditionVO conditionVO) {
		int result = sqlsessionTemplate.insert("admin.AdminDAO.insert01", conditionVO);
		return result;
	}
	
	@Override
	public int updateExchange(ConditionVO conditionVO) {
		int result = sqlsessionTemplate.update("admin.AdminDAO.update01", conditionVO);
		return result;
	}
	
	@Override
	public ConditionVO selectOneExchange(ConditionVO conditionVO){
		ConditionVO condition = sqlsessionTemplate.selectOne("admin.AdminDAO.select01inOne", conditionVO);
		return condition;
	}
}
