package com.erp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

public class WorkDao {
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	Logger logger = Logger.getLogger(WorkDao.class);
	public WorkDao() {
		sqlMapper = MyBatisCommonFactory.getSqlSessionFactory();
		sqlSes = sqlMapper.openSession(true);
	}
	public List<Map<String, Object>> personManageMent(Map<String, Object> pMap) {
		//인사 관리 탭 insert here
		logger.info("Dao : 인사조직도 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = sqlSes.selectList("personManageMent",pMap);
		return rlist;
	}
	public List<Map<String, Object>> smySign(Map<String, Object> pMap) {
		//내결재함(보낸 결재) insert here
		logger.info("Dao : 전자결재 호출 성공");
		List<Map<String,Object>> rlist = null;
		sqlSes.selectOne("proc_s_SignList",pMap);
		rlist = (List<Map<String,Object>>)pMap.get("key");
		logger.info("Dao에 smySign rlist.size() : " + rlist.size());
		return rlist;
	}
	public List<Map<String, Object>> rmySign(Map<String, Object> rMap) {
		//내결재함(받은 결재) insert here
		logger.info("Dao : 전자결재 호출 성공");
		List<Map<String,Object>> rlist = null;
	    sqlSes.selectOne("proc_r_SignList",rMap);
	    rlist = (List<Map<String,Object>>)rMap.get("key");
		logger.info("Dao에 rmySign rlist.size() : " + rlist.size());
		return rlist;
	}
	public List<Map<String, Object>> signForm(Map<String, Object> pMap) {
		//결재양식 이벤트 탭
		logger.info("WorkDao : 전자결재 양식 호출 성공");
		List<Map<String,Object>> rlist = null;
		sqlSes.selectOne("proc_SignForm",pMap);
		rlist = (List<Map<String,Object>>)pMap.get("key");
		logger.info("rlist : " + rlist.size());
		return rlist;
	}
	public List<Map<String, Object>> empList(Map<String, Object> pMap) {
		//사원조회 이벤트 탭
		logger.info("Dao : 사원관리 호출 성공");
		List<Map<String,Object>> rlist = null;
		sqlSes.selectOne("proc_empList",pMap);
		rlist = (List<Map<String,Object>>)pMap.get("key");
		logger.info("Dao empList rlist.size() : " + rlist.size()); 
		return rlist;
	}
	public List<Map<String, Object>> empRetire(Map<String, Object> pMap) {
		//퇴직사원 이벤트 탭
		logger.info("Dao : 퇴직사원관리 호출 성공");
		List<Map<String,Object>> rlist = null;
		sqlSes.selectOne("PROC_RETIREMENT",pMap);
		rlist = (List<Map<String,Object>>)pMap.get("key");
		logger.info("Dao empRetire rlist.size() : " + rlist.size());
		return rlist;
	}
	public List<Map<String, Object>> branchList(Map<String, Object> pMap) {
		//지사 관리 이벤트 탭
		logger.info("Dao : 지사관리 호출 성공");
		List<Map<String,Object>> rlist = new ArrayList<Map<String,Object>>();
		sqlSes.selectOne("PROC_BRANCHLIST",pMap);
		rlist = (List<Map<String,Object>>)pMap.get("key");
		logger.info("Dao branchList : " + rlist.size());
		return rlist;
	}
	public List<Map<String, Object>> deptSchedule(Map<String, Object> pMap) {
		//부서일정 이벤트 탭
		logger.info("Dao : 부서일정 호출 성공");
		List<Map<String,Object>> rlist = null;
		sqlSes.selectOne("proc_deptSchList",pMap);
		rlist=(List<Map<String,Object>>)pMap.get("key");
		return rlist;
	}
	public List<Map<String, Object>> Manager(Map<String, Object> pMap) {
		//관리자 모드 이벤트 탭
		logger.info("Dao : 관리자모드 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = sqlSes.selectList("ManagerList",pMap);
		return rlist;
	}
//////////////////////////////////cud작업//////////////////////////////////
	public List<Map<String, Object>> workSelectSearchSign(Map<String, Object> pMap) {
		//내결재함 조회 이벤트 탭 insert here
		logger.info("Dao : 내결제함 조회 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = sqlSes.selectList("workSelectSearchSignList",pMap);
		return rlist;
	}
	public int workAddDocument(Map<String, Object> pMap) {
		//결재양식 작성 이벤트 탭 insert here
		logger.info("Dao : 결제양식 호출 성공");
		int result = 0;
		result = sqlSes.insert("workAddDocument",pMap);
		return result;
	}
	public String workAgree(Map<String, Object> pMap) {
		//결재 승인 이벤트 insert here
		logger.info("Dao : 결재 승인 호출 성공");
		sqlSes.selectOne("proc_accept",pMap);
		String result = pMap.get("msg").toString();
		return result;
	}
	public String workDeny(Map<String, Object> pMap) {
		//결재 기각 이벤트 insert here
		logger.info("Dao : 결재 기각 호출 성공");
		sqlSes.selectOne("proc_reason",pMap);
		String result = pMap.get("msg").toString();
		return result;
	}
	/*********************************************************************
	 * ap_no를 채번하는 메소드 구현 
	 * @param pMap - 해당사항 없음
	 * @return 새로 채번한 숫자 select seq_ar.nextval from dual
	 * @author 이상현 2020-07-01
	 ********************************************************************/
	public int getSeqAr() {
		int seq_ar = 0;
		seq_ar = Integer.parseInt(sqlSes.selectOne("getSeqAr").toString());
		return seq_ar;
	}
	public String workAddSendDoc(Map<String, Object> pMap) {
		//결재 신청 이벤트 탭 insert here
		logger.info("Dao : 결재 신청 호출 성공" + pMap.get("emp_no")+","+pMap.get("ap_count"));
		sqlSes.selectOne("proc_addRev",pMap);
		String result = pMap.get("msg").toString();
		return result;
	}
	public List<Map<String, Object>> SelectOverView(Map<String, Object> pMap) {
		//내결재함 오버뷰 insert here
		logger.info("Dao : 내결재함 오버뷰 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = sqlSes.selectList("SelectOverView",pMap);
		return rlist;
	}
	public List<Map<String, Object>> workSelectSearchEmp(Map<String, Object> pMap) {
		//사원조회 이벤트 탭 insert here
		logger.info("Dao : 사원조회 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = sqlSes.selectList("workSelectSearchEmp",pMap);
		return rlist;
	}
	public List<Map<String, Object>> workSelectEmp(Map<String, Object> pMap) {
		//정보수정 이벤트 탭 insert here
		logger.info("Dao : 정보수정 이벤트 호출 성공");
		List<Map<String,Object>> rlist = null;
	    	sqlSes.selectOne("PROC_EMPLIST_INSA",pMap);
	    	rlist = (List<Map<String,Object>>)pMap.get("key");
	    	logger.info("Dao workSelEmp : " + rlist.size());
		return rlist;
	}
	
	public int workUpdEmp(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSes.update("workUpdEmp",pMap);
		logger.info("result : " + result);
		return result;
	}
	public int workAddEmp(Map<String, Object> pMap) {
		//신규사원등록 이벤트 탭 insert here
		logger.info("Dao : 신규사원 등록 호출 성공");
		int result = 0;
		result = sqlSes.insert("workAddEmp",pMap);
		sqlSes.commit();
		logger.info("result : " + result);
		return result;
	}
	public String workUpdPw(Map<String, Object> pMap) {
		//재직사원 비밀번호 변경 insert here
		logger.info("Dao : 재직사원 비밀번호 변경 호출 성공");
		String result = null;
		sqlSes.selectOne("PROC_CHANGEPW",pMap);
		result = pMap.get("MSG").toString();
		logger.info("result : " + result );
		return result;
	}
	public int workUpdProfile(Map<String, Object> pMap) {
		//재직사원 정보 변경 insert here
		logger.info("Dao : 재직사원 정보 변경 호출 성공");
		int result = 0;
		result = sqlSes.update("workUpdProfile",pMap);
		return result;
	}
	public List<Map<String, Object>> workSelectSearchRetire(Map<String, Object> pMap) {
		//퇴직사원 조회 insert here
		logger.info("Dao : 퇴직사원 조회 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = sqlSes.selectList("workSelectRetire",pMap);
		return rlist;
	}
	public List<Map<String, Object>> workSelectSearchDispatcher(Map<String, Object> pMap) {
		//파견사원 조회 insert here
		logger.info("Dao : 파견사원 조회 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = sqlSes.selectList("workSelectSearchDispatcher",pMap);
		return rlist;
	}
	public String workDelBranch(Map<String, Object> pMap) {
		//지사 삭제 insert here
		logger.info("Dao : 지사 삭제 호출 성공");
		String result = null;
		sqlSes.selectOne("PROC_DELBRANCH",pMap);
		result = pMap.get("MSG").toString();
		logger.info("result : " + result);
		return result;
	}
	public int workAddBranch(Map<String, Object> pMap) {
		//지사 등록 insert here
		logger.info("Dao : 지사 등록 호출 성공");
		int result = 0;
		result = sqlSes.insert("addBranch",pMap);
		sqlSes.commit();
		return result;
	}
	public List<Map<String, Object>> workSelMapView(Map<String, Object> pMap) {
		logger.info("Dao : 파견맵뷰 호출 성공 ");
		List<Map<String,Object>> rlist = null;
		sqlSes.selectOne("PROC_MapView",pMap);
		rlist = (List<Map<String,Object>>)pMap.get("key");
		logger.info("Dao workSelMapView 호출 성공 : " + rlist.size());
		return rlist;
	}
	public String deptAddSchedule(Map<String, Object> pMap) {
		//부서일정추가 버튼 이벤트
		logger.info("workDao => 부서 일정 추가 호출"); 
		String result ="";
		sqlSes.selectOne("proc_deptSchAdd",pMap);
		result=pMap.get("msg").toString();
		return result;
	}
	public String deptUpdSchedule(Map<String, Object> pMap) {
		//부서일정수정 버튼 이벤트
		logger.info("workDao => 부서 일정 수정 호출"); 
		String result ="";
		sqlSes.selectOne("proc_deptSchUpd",pMap);
		result=pMap.get("msg").toString();
		return result;
	}
	public int deptDelSchedule(Map<String, Object> pMap) {
		logger.info("workDao => 부서 일정 삭제 호출"); 
		int result=sqlSes.delete("work_deptSchDel",pMap);
		sqlSes.commit();
		return result;
	}
	public int workAddDoc(Map<String, Object> pMap) {
		logger.info("workDao => 결제 신청버튼 호출 (결제입력)"); 
		int result=sqlSes.insert("workAddDoc",pMap);
		return result;
	}
	public List<Map<String, Object>> outsideWorker() {
		//파견사원 조회 insert here
		logger.info("Dao : 파견사원 조회 호출 성공");
		List<Map<String,Object>> rlist = null;
		rlist = sqlSes.selectList("dispatch_List");
		return rlist;
	}
	public List<Map<String, Object>> outsideSEL(Map<String, Object> pMap) {
		//파견사원 조회 버튼 insert here
		logger.info("Dao : 파견사원 조회 버튼 호출 성공");
		List<Map<String,Object>> rlist = new ArrayList<Map<String,Object>>();
		rlist = sqlSes.selectList("sel_empDispatch",pMap);
		return rlist;
	}
	public List<Map<String, Object>> deptEmp(Map<String, Object> pMap) {
		//파견사원 조회 버튼 insert here
				logger.info("Dao : 부서 일정 부서 사원 이름 호출 성공");
				List<Map<String,Object>> rlist = new ArrayList<Map<String,Object>>();
				sqlSes.selectOne("proc_deptEmp",pMap);
				rlist = (List<Map<String,Object>>)pMap.get("key");
				logger.info("rslit.size() : " + rlist.size()); 
				return rlist;
	}
	//받은 결재함 
	public List<Map<String, Object>> app_get(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("DAO : appGet호출");
		List<Map<String,Object>> applist = new ArrayList<>();
		applist = sqlSes.selectList("app_getList",pMap);
		logger.info("applist : "+ applist);
		return applist;
	}
	//보낸결재함
	public List<Map<String, Object>> app_set(Map<String, Object> pMap) {
		logger.info("DAO : appSet호출");
		List<Map<String,Object>> applist = null;
		applist = sqlSes.selectList("app_setList",pMap);
		return applist;
	}
	public List<Map<String, Object>> nowempList(Map<String, Object> pMap) {
		logger.info("Dao : nowempList 호출 성공");
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		sqlSes.selectOne("proc_nowempList",pMap);
		list = (List<Map<String,Object>>)pMap.get("key");
		logger.info("list.size() : " + list.size()); 
		return list;
	}
	/*
	 * public List<Map<String, Object>> emp_receiver(Map<String, Object> pMap) { //
	 * TODO Auto-generated method stub logger.info("emp_receiver:호출");
	 * List<Map<String,Object>> relist = null; relist =
	 * sqlSes.selectList("sel_receiver"); logger.info("emp_receiver:호출.size" +
	 * relist.size()); return relist; } public List<Map<String, Object>>
	 * emp_recstate(Map<String, Object> pMap) { // TODO Auto-generated method stub
	 * List<Map<String, Object>> rstList = null; rstList =
	 * sqlSes.selectList("sel_recstate"); logger.info("sel_recstate호출 size값:"
	 * +rstList.size()); return null; }
	 */

	public List<Map<String, Object>> log(Map<String, Object> pMap) {
		logger.info("Dao : log 호출 성공");
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		sqlSes.selectOne("proc_log",pMap);
		list = (List<Map<String,Object>>)pMap.get("key");
		logger.info("list.size() : " + list.size()); 
		return list;
	}
}
