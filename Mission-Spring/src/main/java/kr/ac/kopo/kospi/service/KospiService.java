package kr.ac.kopo.kospi.service;

import java.util.List;

import kr.ac.kopo.kospi.vo.KospiVO;

public interface KospiService {
	
	int insertAllKospi(List<KospiVO> kospiVOs);

	List<KospiVO> searchAllKospi();
	
	List<KospiVO> searchYearKospi();
}
