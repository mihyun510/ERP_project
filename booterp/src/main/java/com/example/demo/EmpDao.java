package com.example.demo;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpDao {
	Logger logger = LoggerFactory.getLogger(EmpDao.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSessionTemplate = null;

	int result = 0 ;
	
	public List<Map<String, Object>> empLogin(Map<String, Object> pMap) {
		logger.info("EmpDao : login 메소드 호출 성공");
		List<Map<String,Object>> list = new ArrayList<>();
		sqlSessionTemplate.selectOne("proc_empLogin44",pMap);
		list = (List<Map<String,Object>>)pMap.get("key");
		logger.info("list.size() " + list.size());
		return list;
	}
	
	public List<Map<String, Object>> login(Map<String, Object> loginMap) {
		//로그인 이벤트
		logger.info("EmpDao() => 로그인"); 
		List<Map<String, Object>> rMap = new ArrayList<>();
		System.out.println("loginMap.get(\"emp_no\") => "+loginMap.get("emp_no"));
		System.out.println("loginMap.get(\"emp_pw\") => "+loginMap.get("emp_pw"));
		sqlSessionTemplate.selectOne("proc_empLogin44",loginMap);
		rMap = (List<Map<String,Object>>) loginMap.get("key");
		System.out.println("rMap.get(0).get(\"EMP_NO\") => "+rMap.get(0).get("EMP_NO"));
		System.out.println("rMap.get(0).get(\"EMP_NAME\") => "+rMap.get(0).get("EMP_NAME"));
		return rMap;
	}
   
	public List<Map<String, Object>> inoutList(Map<String, Object> pMap) {
		//오늘 출근정보 담기
		logger.info("EmpDao() => 메인페이지 오늘 출근 정보 담기"); 
		List<Map<String, Object>> inoutList = new ArrayList<>();
		sqlSessionTemplate.selectList("proc_commute",pMap);
		inoutList=(List<Map<String,Object>>)pMap.get("key");
		return inoutList;
	}

	public List<Map<String, Object>> commuteList(Map<String, Object> pMap) {
		//오늘 일정 얻어오기
		logger.info("EmpDao() => 오늘 업무시간 리스트"); 
		List<Map<String, Object>> todayTaskList = new ArrayList<>();
		sqlSessionTemplate.selectList("proc_taskTime",pMap);
		todayTaskList=(List<Map<String,Object>>)pMap.get("key");
		return todayTaskList;
	}

	public List<Map<String, Object>> roomList(Map<String, Object> pMap) {
		//오늘 회의실 예약일정 얻어오기
		logger.info("EmpDao() => 메인페이지 회의실 예약 정보 담기"); 
		List<Map<String, Object>> roomList = new ArrayList<>();
		sqlSessionTemplate.selectList("proc_todaycfr",pMap);
		roomList = (List<Map<String,Object>>) pMap.get("key");
		return roomList;
	}

	public int myUpdImformation(Map<String, Object> pMap) {
		//내 정보 수정     저장 버튼
		logger.info("EmpDao() => 내 정보 수정 저장버튼"); 
		result = sqlSessionTemplate.update("myUpdImformation",pMap);
		logger.info("result: "+result);
		return result;
	}

	public List<Map<String, Object>> myInfoMap(Map<String, Object> pMap) {
		//내 정보 리스트 가져오기
		logger.info("EmpDao() => 내 정보 설정 리스트 가져오기"); 
		List<Map<String, Object>> myInfoList = new ArrayList<Map<String,Object>>();
		sqlSessionTemplate.selectOne("PROC_EMPTEST",pMap);//pMap = 10001
		myInfoList=(List<Map<String, Object>>)pMap.get("key");
		return myInfoList;
	}

	public String newPassword(Map<String, Object> pMap) {
		//비밀번호 재설정
		logger.info("EmpDao => 내 정보 리스트 => password 설정");
		sqlSessionTemplate.selectOne("proc_newPassword",pMap);
		String result = pMap.get("msg").toString();
		return result;
	}

	public List<Map<String, Object>> reMain(Map<String, Object> pMap) {
		logger.info("EmpDao() => reMain 가져오기"); 
		List<Map<String, Object>> reMainList = new ArrayList<Map<String,Object>>();
		sqlSessionTemplate.selectOne("proc_taskTime",pMap);
		reMainList=(List<Map<String, Object>>)pMap.get("key");
		return reMainList;
	}

	public List<Map<String, Object>> loginAnd(Map<String, Object> loginMap) {
		//안드로이드 로그인 이벤트
		logger.info("EmpDao() => 로그인"); 
		List<Map<String, Object>> rMap = new ArrayList<>();
		System.out.println("loginMap.get(\"emp_no\") => "+loginMap.get("emp_no"));
		System.out.println("loginMap.get(\"emp_pw\") => "+loginMap.get("emp_pw"));
		sqlSessionTemplate.selectOne("proc_empLogin",loginMap);
		rMap = (List<Map<String,Object>>) loginMap.get("key");
		System.out.println("rMap.get(0).get(\"EMP_NO\") => "+rMap.get(0).get("EMP_NO"));
		System.out.println("rMap.get(0).get(\"EMP_NAME\") => "+rMap.get(0).get("EMP_NAME"));
		return rMap;
	}

}
