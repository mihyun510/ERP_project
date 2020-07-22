package com.example.demo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpLogic {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired(required=false)
	private EmpDao empDao = null;
	
	private int result =0;
	
	public List<Map<String,Object>> login(Map<String,Object> pMap){
		List<Map<String,Object>> rlist = new ArrayList<>();
		rlist = empDao.empLogin(pMap);
		return rlist ;
	}

	public List<Map<String, Object>> inoutList(Map<String, Object> pMap) {
		//메인페이지 오늘 출근 정보
		logger.info("EmpLogic => 메인페이지 출근 정보");
		List<Map<String, Object>> rList = new ArrayList<>();
		rList = empDao.inoutList(pMap);
		return rList;
	}

	public List<Map<String, Object>> roomList(Map<String, Object> pMap) {
		//메인페이지 오늘 회의실예약 정보
		logger.info("EmpLogic => 메인페이지 회의실 예약 정보");
		List<Map<String, Object>> rList = new ArrayList<>();
		rList = empDao.roomList(pMap);
		return rList;
	}
	
	public List<Map<String, Object>> commuteList(Map<String, Object> pMap) {
		//메인페이지 오늘 업무시간 리스트
		logger.info("EmpLogic => 오늘 업무시간 리스트");
		List<Map<String, Object>> rList = new ArrayList<>();
		rList = empDao.commuteList(pMap);
		return rList;
	}

	public int myUpdImformation(Map<String, Object> pMap) {
		//내 정보 수정     저장 버튼
		logger.info("EmpLogic => 내정보 수정");
		result = empDao.myUpdImformation(pMap);
		return result;
	}

	public List<Map<String, Object>> myInfoMap(Map<String, Object> pMap) {
		//내 정보 리스트
		logger.info("EmpLogic => 내 정보 리스트");
		List<Map<String, Object>> rList= new ArrayList<>();
		rList = empDao.myInfoMap(pMap);
		return rList;
	}

	public String newPassword(Map<String, Object> pMap) {
		logger.info("EmpLogic => 내 정보 리스트 => password 설정");
		String result = empDao.newPassword(pMap);
		return result;
	}

	public List<Map<String, Object>> reMain(Map<String, Object> pMap) {
		logger.info("EmpLogic => reMain 리스트");
		List<Map<String, Object>> rList= new ArrayList<Map<String,Object>>();
		rList = empDao.reMain(pMap);
		return rList;
	}

	public List<Map<String, Object>> loginAnd(Map<String, Object> loginMap) {
		//로그인 이벤트 시작
		logger.info("EmpLogic => 로그인 버튼");
		List<Map<String, Object>> rList = new ArrayList<>();
		rList = empDao.loginAnd(loginMap);
		return  rList;
	}
}
