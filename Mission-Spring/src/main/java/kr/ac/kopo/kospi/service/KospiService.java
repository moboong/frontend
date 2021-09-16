package kr.ac.kopo.kospi.service;

import java.util.List;

import kr.ac.kopo.kospi.vo.KospiVO;

public interface KospiService {
	
	String getSeq();
	
	int insertAllKospi(List<KospiVO> kospiVOs);
	
	int insertOneKospi(KospiVO kospiVO);
	
	List<KospiVO> searchAllKospi();
	
	List<KospiVO> searchYearKospi();
}
