package kr.ac.kopo.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.admin.dao.AdminDAO;
import kr.ac.kopo.admin.vo.ConditionVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<ConditionVO> selectExchange(ConditionVO conditionVO) {
		List<ConditionVO> list = adminDAO.selectExchange(conditionVO);
		return list;
	}

	@Override
	public int insertExchange(ConditionVO conditionVO) {
		int result = adminDAO.insertExchange(conditionVO);
		return result;
	}

	@Override
	public int updateExchange(ConditionVO conditionVO) {
		int result = adminDAO.updateExchange(conditionVO);
		return result;
	}
	
	@Override
	public ConditionVO selectOneExchange(ConditionVO conditionVO){
		ConditionVO condition = adminDAO.selectOneExchange(conditionVO);
		return condition;
	}
}
