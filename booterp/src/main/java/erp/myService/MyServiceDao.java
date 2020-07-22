package erp.myService;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyServiceDao {
	Logger logger = LoggerFactory.getLogger("MyServiceDao.class");
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;
	
	private int result=0;
	
	public List<Map<String, Object>> myInOutInfo(Map<String, Object> pMap) {
		//출퇴관리 탭 이벤트
		logger.info("MyServiceDao => 출퇴관리 호출"); 
		List<Map<String, Object>> rList = new ArrayList<>();
		sqlSessionTemplate.selectOne("proc_gotowork",pMap);
		rList = (List<Map<String,Object>>)pMap.get("key");
		return rList;
	}

	public List<Map<String, Object>> weekInOutInfo(Map<String, Object> pMap) {
		//주 단위 내 출퇴관리 정보
		logger.info("MyServiceDao => 주 단위 출퇴 리스트"); 
		List<Map<String, Object>> rList = new ArrayList<>();
		sqlSessionTemplate.selectList("proc_weekInOut",pMap);
		rList= (List<Map<String, Object>>)pMap.get("key");
		return rList;
	}


	public List<Map<String, Object>> monthPay(Map<String, Object> pMap) {
		//당월급여 조회  이벤트
		logger.info("MyServiceDao => 당월급여 호출"); 
		List<Map<String, Object>> rList = new ArrayList<>();
		sqlSessionTemplate.selectOne("proc_sal2",pMap);
		rList = (List<Map<String, Object>>)pMap.get("key");
		return rList;
	}

	public List<Map<String, Object>> allPay(Map<String, Object> pMap) {
		//전체 급여 조회 이벤트
		logger.info("MyServiceDao => 출퇴관리 호출"); 
		List<Map<String, Object>> rList = new ArrayList<>();
		sqlSessionTemplate.selectOne("proc_sal",pMap);
		rList = (List<Map<String, Object>>)pMap.get("key");
		return rList;
	}

	public List<Map<String, Object>> myScheduleChart(Map<String, Object> pMap) {
		//내 일정 관리  이벤트
		logger.info("MyServiceDao => 내 일정 관리 호출"); 
		List<Map<String, Object>> rList = new ArrayList<>();
		sqlSessionTemplate.selectOne("proc_myschedulechart",pMap);
		rList= (List<Map<String, Object>>)pMap.get("key");
		return rList;
	}
	
	public List<Map<String, Object>> myScheduleAndroid(Map<String, Object> pMap) {
		//내 일정 관리  이벤트
		logger.info("MyServiceDao => 내 일정 관리 호출"); 
		List<Map<String, Object>> rList = new ArrayList<>();
		sqlSessionTemplate.selectOne("proc_mysdAndroid",pMap);
		rList= (List<Map<String, Object>>)pMap.get("key");
		return rList;
	}
	public List<Map<String, Object>> mySchedule(Map<String, Object> pMap) {
		//내 일정 관리  이벤트
		logger.info("MyServiceDao => 내 일정 관리 호출"); 
		List<Map<String, Object>> rList = new ArrayList<>();
		sqlSessionTemplate.selectOne("proc_mySdList",pMap);
		rList= (List<Map<String, Object>>)pMap.get("key");
		return rList;
	}
	public String myGoWork(Map<String, Object> pMap) {
		//출근 버튼 이벤트
		logger.info("MyServiceDao => 출근 버튼 호출"); 
		String result ="";
		sqlSessionTemplate.selectOne("proc_inout",pMap);
		result=pMap.get("msg").toString();
		return result;
	}

	public String myGoOut(Map<String, Object> pMap) {
		//외출 버튼 이벤트
		logger.info("MyServiceDao => 외출 버튼 호출"); 
		String result ="";
		sqlSessionTemplate.selectOne("proc_inout",pMap);
		result=pMap.get("msg").toString();
		return result;
	}
	
	public String myComBack(Map<String, Object> pMap) {
		//외출 버튼 이벤트
		logger.info("MyServiceDao => 외출복귀 버튼 호출"); 
		String result ="";
		sqlSessionTemplate.selectOne("proc_inout",pMap);
		result=pMap.get("msg").toString();
		return result;
	}
	
	public String myGoHome(Map<String, Object> pMap) {
		//퇴근 버튼 이벤트 탭 이벤트
		logger.info("MyServiceDao => 퇴근 버튼 호출"); 
		String result ="";
		sqlSessionTemplate.selectOne("proc_inout",pMap);
		result=pMap.get("msg").toString();
		return result;
	}
	
	public String myAddSchedule(Map<String, Object> pMap) {
		//일정추가 버튼 이벤트
		logger.info("MyServiceDao => 개인 일정 추가 호출"); 
		String result ="";
		sqlSessionTemplate.selectOne("proc_mySdAdd",pMap);
		result=pMap.get("msg").toString();
		return result;
	}

	public String myUpdSchedule(Map<String, Object> pMap) {
		//일정수정 버튼 이벤트
		logger.info("MyServiceDao => 개인 일정 수정 호출"); 
		String result ="";
		sqlSessionTemplate.selectOne("proc_mySdUpd",pMap);
		result=pMap.get("msg").toString();
		return result;
	}

	public int myDelSchedule(Map<String, Object> pMap) {
		//일정삭제 버튼 이벤트
		logger.info("MyServiceDao => 개인 일정 삭제 호출"); 
		result = sqlSessionTemplate.delete("my_sdDel",pMap);
		//sqlSessionTemplate.commit();
		return result;
	}

	public String myAddScheduleAndroid(Map<String, Object> pMap) {
		//일정추가 안드로이드 버튼 이벤트
		logger.info("MyServiceDao => 개인 일정 안드로이드 추가 호출"); 
		String result ="";
		sqlSessionTemplate.selectOne("proc_mySdAdd",pMap);
		result=pMap.get("msg").toString();
		return result;
	}

	public String myUpdScheduleAndroid(Map<String, Object> pMap) {
		//일정수정 안드로이드 버튼 이벤트
		logger.info("MyServiceDao => 개인 일정 수정 안드로이드 호출"); 
		String result ="";
		sqlSessionTemplate.selectOne("proc_mySdUpd",pMap);
		result=pMap.get("msg").toString();
		return result;
	}

	public int myDelScheduleAndroid(Map<String, Object> pMap) {
		//일정삭제 버튼 안드로이드 이벤트
		logger.info("MyServiceDao => 개인 일정 삭제 안드로이드 호출"); 
		result=sqlSessionTemplate.delete("my_sdDel",pMap);
		return result;
	}

	public Map<String, Object> gowork() {
		logger.info("EmpDao => 안드 => 출근지가져오기");
		Map<String, Object> rMap = sqlSessionTemplate.selectOne("selete_dl");
		return rMap;
	}



}
