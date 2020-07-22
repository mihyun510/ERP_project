package com.erp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class WorkLogic {
	WorkDao workDao = null;
	Logger logger = Logger.getLogger(WorkLogic.class);
	public WorkLogic() {
		workDao = new WorkDao();
	}
	public List<Map<String, Object>> personManageMent(Map<String, Object> pMap) {
		//인사 insert here
		logger.info("Logic : 인사조직도 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.personManageMent(pMap);
		return rlist;
	}
	public List<Map<String, Object>> smySign(Map<String, Object> pMap) {
		//내결재함(보낸 결재)
		logger.info("Logic : 전자결재 호출 성공");
		List<Map<String,Object>> slist = new ArrayList<Map<String,Object>>();
		slist = workDao.smySign(pMap);
		return slist;
	}
	public List<Map<String, Object>> rmySign(Map<String, Object> rMap) {
		//내결재함(받은 결재)
		logger.info("Logic : 전자결재 호출 성공");
		List<Map<String,Object>> rlist = new ArrayList();
		rlist = workDao.rmySign(rMap);
		return rlist;
	}
	public List<Map<String,Object>> signForm(Map<String,Object> pMap) {
		//결재양식 탭 이벤트
		logger.info("Logic : 전자결재 양식 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.signForm(pMap);
		return rlist;
	}
	public List<Map<String, Object>> empList(Map<String, Object> pMap) {
		//사원조회 탭
		logger.info("Logic : 사원관리 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.empList(pMap);
		return rlist;
	}
	public List<Map<String, Object>> empRetire(Map<String, Object> pMap) {
		//퇴직사원조회 이벤트 탭
		logger.info("Logic : 퇴직사원관리 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.empRetire(pMap);
		return rlist;
	}
	public List<Map<String, Object>> branchList(Map<String, Object> pMap) {
		//지사관리 이벤트 탭
		logger.info("Logic : 지사관리 호출 성공");
		List<Map<String,Object>> rlist = new ArrayList<Map<String,Object>>();
		rlist = workDao.branchList(pMap);
		return rlist;
	}
	public List<Map<String, Object>> deptSchedule(Map<String,Object> pMap) {
		//부서일정 이벤트 탭
		logger.info("Logic : 부서일정 호출 성공");
		List<Map<String,Object>> rlist = new ArrayList<Map<String,Object>>();
		rlist = workDao.deptSchedule(pMap);
		return rlist;
		
	}
	public List<Map<String, Object>> Manager(Map<String, Object> pMap) {
		//관리자 모드 이벤트 탭
		logger.info("Logic : 관리자모드 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.Manager(pMap);
		return rlist;
	}
/////////////////////////////////cud 작업/////////////////////////////////////
	public List<Map<String, Object>> workSelectSearchSign(Map<String, Object> pMap) {
		//내결제함 조회이벤트 탭 insert here
		logger.info("Logic : 내결제함 조회 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.workSelectSearchSign(pMap);
		return rlist;
	}
	public int workAddDocument(Map<String, Object> pMap) {
		//결제양식 작성 insert here
		logger.info("Logic : 결제양식 호출 성공");
		int result = 0 ;
		result = workDao.workAddDocument(pMap);
		return result;
	}
	public String workAgree(Map<String, Object> pMap) {
		//결재 승인 이벤트 insert here
		logger.info("Logic : 결재 승인 호출 성공");
		String result = workDao.workAgree(pMap);
		return result;
	}
	public String workDeny(Map<String, Object> pMap) {
		//결재 기각 이벤트 insert here
		logger.info("Logic : 결재 기각 호출 성공");
		String result = workDao.workDeny(pMap);
		return result;
	}
	public String workAddSendDoc(Map<String, Object> pMap) {
		//결재 신청 이벤트 탭 insert here
		logger.info("Logic : 결재 신청 호출 성공");
		String result = workDao.workAddSendDoc(pMap);
		return result;
	}
	public List<Map<String, Object>> workSelectOverView(Map<String, Object> pMap) {
		//내결재함 오버뷰 insert here
		logger.info("Logic : 내결재함 오버뷰 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.SelectOverView(pMap);
		return rlist;
	}
	public List<Map<String, Object>> workSelectSearchEmp(Map<String, Object> pMap) {
		//사원조회 이벤트 탭 insert here
		logger.info("Logic : 사원조회 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.workSelectSearchEmp(pMap);
		return rlist;
	}
	public List<Map<String, Object>> workSelectEmp(Map<String, Object> pMap) {
		//정보수정 이벤트 탭 insert here
		logger.info("Logic : 정보수정 이벤트 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.workSelectEmp(pMap);
		return rlist;
		
	}
	public int workUpdEmp(Map<String, Object> pMap) {
		//정보수정 저장 버튼 눌렀을 경우 insert here
		int result = 0;
		result = workDao.workUpdEmp(pMap);
		return result;
	}
	public int workAddEmp(Map<String, Object> pMap) {
		//신규사원 등록 이벤트 탭 insert here
		logger.info("Logic : 신규사원 등록 호출 성공");
		int result = 0;
		result = workDao.workAddEmp(pMap);
		return result;
	}
	public String workUpdPw(Map<String, Object> pMap) {
		//인사탭 비밀번호 변경 insert here
		logger.info("Logic : 재직사원 비밀번호 변경 호출 성공");
		String result = null;
		result = workDao.workUpdPw(pMap);
		return result;
	}
	public List<Map<String, Object>> workSelectSearchRetire(Map<String, Object> pMap) {
		//퇴직사원 조회 insert here
		logger.info("Logic : 퇴직사원 조회 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.workSelectSearchRetire(pMap);
		return rlist;
	}
	public List<Map<String, Object>> workSelectSearchDispatcher(Map<String, Object> pMap) {
		//파견사원 조회 insert here
		logger.info("Logic : 파견사원 조회 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.workSelectSearchDispatcher(pMap);
		return rlist;
	}
	public String workDelBranch(Map<String, Object> pMap) {
		//지사 삭제 insert here
		logger.info("Logic : 지사 삭제 호출 성공");
		String result = null; 
		result = workDao.workDelBranch(pMap);
		return result;
	}
	public int workAddBranch(Map<String, Object> pMap) {
		//지사 등록 insert here
		logger.info("Logic : 지사 등록 호출 성공");
		int result = 0 ; 
		result = workDao.workAddBranch(pMap);
		return result;
	}
	public List<Map<String,Object>> workSelMapView(Map<String, Object> pMap) {
		List<Map<String,Object>> rlist = null;
		rlist = workDao.workSelMapView(pMap);
		return rlist;
	}
	public String deptAddSchedule(Map<String, Object> pMap) {
		//부서일정 추가하기
		logger.info("workDao => 부서 일정 추가  호출");
		String result = "";
		result = workDao.deptAddSchedule(pMap);
		return result;
	}
	public String deptUpdSchedule(Map<String, Object> pMap) {
		//부서일정 수정하기
		logger.info("workDao => 부서 일정 수정  호출");
		String result = "";
		result = workDao.deptUpdSchedule(pMap);
		return result;
	}
	public int deptDelSchedule(Map<String, Object> pMap) {
		//일정삭제 버튼 이벤트
		logger.info("workDao => 부서 일정 삭제  호출");
		int result = 0;
		result = workDao.deptDelSchedule(pMap);
		return result;
	}
	public int workAddDoc(Map<String, Object> pMap) {
		//결재신청 이벤트 - 결재테이블 등록
		logger.info("workDao => 결제 신청버튼 호출");
		int result = 0;
		result = workDao.workAddDoc(pMap);
		return result;
	}
	public List<Map<String, Object>> outsideWorker() {
		logger.info("Logic : 파견사원 조회 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = workDao.outsideWorker();
		return rlist;
	}
	public List<Map<String, Object>> outsideSEL(Map<String, Object> pMap) {
		logger.info("Logic : 파견사원 조회 버튼 호출 성공");
		List<Map<String,Object>> rlist = new ArrayList<Map<String,Object>>();
		rlist = workDao.outsideSEL(pMap);
		return rlist;
	}
	public List<Map<String, Object>> deptEmp(Map<String, Object> pMap) {
		logger.info("Logic : 부서 일정 부서사원이름 호출 성공");
		List<Map<String,Object>> rlist = new ArrayList<Map<String,Object>>();
		rlist = workDao.deptEmp(pMap);
		return rlist;
	}
	//받은 결재함 
	public List<Map<String, Object>> app_get(Map<String, Object> pMap) {
		logger.info("Logic :app_get 호출 성공");
		List<Map<String,Object>> applist = new ArrayList<>();
		applist = workDao.app_get(pMap);
		return applist;
	}
	//보낸 결재함
	public List<Map<String, Object>> app_set(Map<String, Object> pMap) {
		logger.info("Logic :app_set 호출 성공");
		List<Map<String,Object>> applist = null;
		applist = workDao.app_set(pMap);
		return applist;
	}
	//결재자 순서대로 +1 
	public int getSeqAr() {
		int seq_ar = 0;
		seq_ar = workDao.getSeqAr();
		return seq_ar;
	}
	public List<Map<String, Object>> nowempList(Map<String, Object> pMap) {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = workDao.nowempList(pMap);
		return list;
	}
	/*
	 * public List<Map<String, Object>> emp_receiver(Map<String, Object> pMap) { //
	 * TODO Auto-generated method stub List<Map<String,Object>> list = new
	 * ArrayList<Map<String,Object>>(); list = workDao.emp_receiver(pMap); return
	 * list; } public List<Map<String, Object>> emp_recstate(Map<String, Object>
	 * pMap) { // TODO Auto-generated method stub List<Map<String,Object>> list =
	 * new ArrayList<Map<String,Object>>(); list = workDao.emp_recstate(pMap);
	 * return list; }
	 */
	public List<Map<String, Object>> log(Map<String, Object> pMap) {
		List<Map<String,Object>> list = new ArrayList();
		list = workDao.log(pMap);
		return list; 
	}


}
