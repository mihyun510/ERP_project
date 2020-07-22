package com.erp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ConferenceLogic {
	ConferenceDao cdao = null;
	Logger logger = Logger.getLogger(ConferenceLogic.class);
	
	public ConferenceLogic() {
		logger.info("ConferenceLogic 호출 성공");
		cdao = new ConferenceDao();
	}
	
	public String conAddRoom(Map<String, Object> pMap) {
		//회의실예약 버튼 이벤트
		logger.info("ConferenceLogic => 회의실예약");
		String result = cdao.conAddRoom(pMap);
		return result;
	}

	public int conDelRoom(Map<String, Object> pMap) {
		//회의실 삭제 이벤트
		logger.info("ConferenceLogic => 회의실삭제");
		int result = cdao.conDelRoom(pMap);
		return result;
	}

	public List<Map<String, Object>> allRes(Map<String, Object> pMap) {
		//전체 회의실 예약 정보 가져오기
		logger.info("ConferenceLogic => 전체 회의실 예약리스트");
		List<Map<String, Object>> rList = new ArrayList<>();
		rList = cdao.allRes(pMap);
		return rList;
	}

	public String conUpdRoom(Map<String, Object> pMap) {
		logger.info("ConferenceLogic => 회의실예약 수정");
		String result = cdao.conUpdRoom(pMap);
		return result;
	}

}
