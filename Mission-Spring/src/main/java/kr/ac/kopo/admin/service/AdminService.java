package kr.ac.kopo.admin.service;

import java.util.List;

import kr.ac.kopo.admin.vo.ConditionVO;

public interface AdminService {

	List<ConditionVO> selectExchange(ConditionVO conditionVO);

	int insertExchange(ConditionVO conditionVO);

	int updateExchange(ConditionVO conditionVO);
	
	ConditionVO selectOneExchange(ConditionVO conditionVO);
}
