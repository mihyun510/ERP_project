package com.erp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class MyServiceLogic {
	
	Logger logger = Logger.getLogger(MyServiceLogic.class);
	MyServiceDao myServiceDao = null;
	public MyServiceLogic() {
		logger.info("MyServiceLogic 호출 성공");
		this.myServiceDao=new MyServiceDao();
	}
 
	public List<Map<String, Object>> inOutManager(Map<String,Object> pMap) {
		//출퇴관리 탭 이벤트
		logger.info("MyServiceLogic => 출퇴관리 호출");
		List<Map<String, Object>> rList = new ArrayList<>();
		rList = myServiceDao.myInOutInfo(pMap); //today에 대한 내 정보
		return rList;
	}
	
	public List<Map<String, Object>> weekInOutInfo(Map<String,Object> pMap) {
		//출퇴관리 탭 이벤트
		logger.info("MyServiceDao => 주 단위 출퇴 리스트"); 
		List<Map<String, Object>> rList = new ArrayList<>();
		rList = myServiceDao.weekInOutInfo(pMap); //today에 대한 내 정보
		return rList;
	}

	public List<Map<String, Object>> monthPay(Map<String, Object> pMap) {
		//당월급여 조회 탭 이벤트
		logger.info("MyServiceLogic => 당월 급여 호출");
		List<Map<String, Object>> rList = new ArrayList<>();
		rList = myServiceDao.monthPay(pMap);		
		return rList;
	}

	public List<Map<String, Object>> allPay(Map<String, Object> pMap) {
		//전체 급여 조회 탭 이벤트
		logger.info("MyServiceLogic => 전체급여 호출");
		List<Map<String, Object>> rList = new ArrayList<>();
		rList = myServiceDao.allPay(pMap);		
		return rList; 
	}

	public List<Map<String, Object>> myScheduleChart(Map<String, Object> pMap) {
		//내 일정 관리 탭 이벤트
		logger.info("MyServiceLogic => 개인 일정  호출");
		List<Map<String, Object>> rList = new ArrayList<Map<String,Object>>();
		rList = myServiceDao.myScheduleChart(pMap);
		return rList;
	}
	public List<Map<String, Object>> mySchedule(Map<String, Object> pMap) {
		//내 일정 관리 탭 이벤트
		logger.info("MyServiceLogic => 개인 일정  호출");
		List<Map<String, Object>> rList = null;
		rList = myServiceDao.mySchedule(pMap);
		return rList;
	}
	public String myGoWork(Map<String, Object> pMap) {
		//출근 버튼 이벤트 탭 이벤트
		logger.info("MyServiceLogic => 출근 버튼  호출");
		String result = "";
		result = myServiceDao.myGoWork(pMap);
		return result;
		
	}
	public String myGoHome(Map<String, Object> pMap) {
		//퇴근 버튼 이벤트 탭 이벤트
		logger.info("MyServiceLogic => 퇴근 버튼  호출");
		String result = "";
		result = myServiceDao.myGoHome(pMap);
		return result;
		
	}
	public String myGoOut(Map<String, Object> pMap) {
		//외출 버튼 이벤트
		logger.info("MyServiceLogic => 외출 버튼 호출");
		String result ="";
		result = myServiceDao.myGoOut(pMap);
		return result;
	}
	public String myComBack(Map<String, Object> pMap) {
		//외출복귀 버튼 이벤트
		logger.info("MyServiceLogic => 외출복귀 버튼 호출");
		String result ="";
		result = myServiceDao.myComBack(pMap);
		return result;
	}
	

	public String myAddSchedule(Map<String, Object> pMap) {
		//일정추가 버튼 이벤트
		logger.info("MyServiceLogic => 개인 일정 추가  호출");
		String result = "";
		result = myServiceDao.myAddSchedule(pMap);
		return result;
	}

	public String myUpdSchedule(Map<String, Object> pMap) {
		//일정수정 버튼 이벤트
		logger.info("MyServiceLogic => 개인 일정 수정  호출");
		String result = "";
		result = myServiceDao.myUpdSchedule(pMap);
		return result;
	}

	public int myDelSchedule(Map<String, Object> pMap) {
		//일정삭제 버튼 이벤트
		logger.info("MyServiceLogic => 개인 일정 삭제  호출");
		int result = 0;
		result = myServiceDao.myDelSchedule(pMap);
		return result;
	}
	public Map<String, Object> gowork() {
		//출근 지역 가져오기 (안드로이드)
				logger.info("EmpLogic 출근지 가져오기");
				Map<String, Object> rMap = null;
				rMap = myServiceDao.gowork();
				return rMap;
	}
	public String myAddScheduleAndroid(Map<String, Object> pMap) {
		//안드로이드 일정추가 버튼 이벤트
				logger.info("MyServiceLogic => 개인 일정 추가  호출");
				String result = "";
				result = myServiceDao.myAddScheduleAndroid(pMap);
				return result;
	}

	public String myUpdScheduleAndroid(Map<String, Object> pMap) {
		logger.info("MyServiceLogic => 개인 일정 수정 안드로이드  호출");
		String result = "";
		result = myServiceDao.myUpdScheduleAndroid(pMap);
		return result;
	}

	public int myDelScheduleAndroid(Map<String, Object> pMap) {
		//일정삭제 안드로이드 버튼 이벤트
				logger.info("MyServiceLogic => 개인 일정 삭제 안드로이드 호출");
				int result = 0;
				result = myServiceDao.myDelScheduleAndroid(pMap);
				return result;
	}

	

}
