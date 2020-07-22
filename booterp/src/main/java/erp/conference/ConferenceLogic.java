package erp.conference;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConferenceLogic {
	@Autowired(required=false)
	private ConferenceDao cdao = null;
	Logger logger = LoggerFactory.getLogger(ConferenceController.class);	
		
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
