package kr.ac.kopo.kospi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.kospi.dao.KospiDAO;
import kr.ac.kopo.kospi.vo.KospiVO;

@Service
public class KospiServiceImpl implements KospiService {
	
	@Autowired
	private KospiDAO kospiDAO;
	
	@Override
	public String getSeq() {
		String latest = kospiDAO.getSeq();
		return latest;
	}
	
	@Override
	public int insertAllKospi(List<KospiVO> kospiVOs) {
		int result = kospiDAO.insertAll(kospiVOs);
		return result;
	}
	
	@Override
	public int insertOneKospi(KospiVO kospiVO) {
		int result = kospiDAO.insertOne(kospiVO);
		return result;
	}
	
	@Override
	public List<KospiVO> searchAllKospi() {
		List<KospiVO> kospiVOs = kospiDAO.searchAll();
		return kospiVOs;
	}

	@Override
	public List<KospiVO> searchYearKospi() {
		List<KospiVO> kospiVOs = kospiDAO.searchYear();
		return kospiVOs;
	}

}
