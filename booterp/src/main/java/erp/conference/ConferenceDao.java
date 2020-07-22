package erp.conference;

import java.util.ArrayList;

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
public class ConferenceDao {
	Logger logger = LoggerFactory.getLogger(ConferenceController.class);
	
	@Autowired(required = false)
	SqlSessionTemplate sqlSessionTemplate = null;
	
		public String conAddRoom(Map<String, Object> pMap) {
			//회의실예약 버튼 이벤트
			logger.info("ConferenceDao() => 회의실 예약"); 
			sqlSessionTemplate.selectOne("proc_conResAdd",pMap);
			String result=pMap.get("msg").toString();
			return result;
		}
	
		public String conUpdRoom(Map<String, Object> pMap) {
			//회의실 예약 수정 버튼 클릭
			logger.info("ConferenceDao() => 회의실 수정"); 
			sqlSessionTemplate.selectOne("proc_conResUpd",pMap);
			String result=pMap.get("msg").toString();
			return result;
		}
		
		public int conDelRoom(Map<String, Object> pMap) {
			//회의실 삭제 이벤트
			logger.info("ConferenceDao() => 회의실 삭제"); 
			int result = sqlSessionTemplate.delete("conResDel",pMap);
			//sqlSessionTemplate.commit();
			return result;
		}
	
		public List<Map<String, Object>> allRes(Map<String, Object> pMap) {
			//전체 회의실 예약 정보 가져오기
			logger.info("ConferenceDao() => 회의실 전체예약정보"); 
			List<Map<String, Object>> rList = new ArrayList<>();
			sqlSessionTemplate.selectOne("proc_conResList",pMap);
			rList = (List<Map<String, Object>>)pMap.get("key");
			return rList;
		}

}
