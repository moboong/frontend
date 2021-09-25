package kr.ac.kopo.admin.dao;

import java.util.List;

import kr.ac.kopo.admin.vo.ConditionVO;

public interface AdminDAO {
	
	List<ConditionVO> selectExchange(ConditionVO conditionVO);
	
	int insertExchange(ConditionVO conditionVO);
	
	int updateExchange(ConditionVO conditionVO);
	
	ConditionVO selectOneExchange(ConditionVO conditionVO);
}
