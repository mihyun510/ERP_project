package erp.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardMDao {
	Logger logger = LoggerFactory.getLogger(BoardMDao.class);
	@Autowired(required = false)
	private SqlSessionTemplate sqlSessionTemplate = null;

	public int getBmNo(Map<String, Object> pMap) {
		logger.info("getBmNo 호출 성공");
		int bm_no = 0;
		bm_no = sqlSessionTemplate.selectOne("getBmNo",pMap);
		logger.info("bm_no:"+bm_no);
		return bm_no;
	}
	
	public int getBmGroup(Map<String, Object> pMap) {
		logger.info("getBmGroup호출 성공");
		int bm_group = 0;
		bm_group = sqlSessionTemplate.selectOne("getBmGroup",pMap);
		logger.info("bm_group:"+bm_group);
		return bm_group;
	}
	
	public int bmPosUpdate(Map<String, Object> pMap) {
		logger.info("bmPosUpdate 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.update("bmPosUpdate",pMap);
		logger.info("result:"+result+", bm_group: "+pMap.get("bm_group"));
		return result;
	}
	//글입력
	public int boardMINS(Map<String, Object> pMap) {
		logger.info("BoardDao boardMINS호출 성공");
		logger.info("boardMINS 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.insert("boardMINS",pMap);
		logger.info("result:"+result);
		return result;
	}
	
	public int getTotal(Map<String, Object> pMap) {
		logger.info("getTotal 호출 성공");
		int tot = 0;
		tot= sqlSessionTemplate.selectOne("getTotal",pMap);
		logger.info("tot  : "+tot);
		return tot;
	}
	//전체조회
	public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
		logger.info("BoardMDao boardList 호출 성공: "+pMap.get("emp_no"));
		List<Map<String, Object>> bList = null;
		bList = sqlSessionTemplate.selectList("boardList",pMap);
		logger.info("bList:"+bList.size());
		return bList;
	}
	//댓글조회
	public List<Map<String, Object>> boardListReply(Map<String, Object> rMap) {
		logger.info("BoardMDao boardListReply 호출 성공");
		List<Map<String, Object>> bList = null;
		bList = sqlSessionTemplate.selectList("boardListReply",rMap);
		logger.info("bList:"+bList.size());
		return bList;
	}
	
//조회수 수정+1
	public int hitCount(Map<String, Object> pMap) {
		logger.info("BoardMDao hitCount호출 성공: "+pMap.get("bm_no"));
		int result = sqlSessionTemplate.update("hitCount",pMap);
		logger.info("result:"+result);
		return result;
	}
	
	//상세조회
	public List<Map<String, Object>> boardListDetail(Map<String, Object> pMap) {
		logger.info("BoardMDao boardList 호출 성공: "+pMap.get("bm_no")+", "+pMap.get("emp_no"));
		List<Map<String, Object>> bList = null;
		bList = sqlSessionTemplate.selectList("boardListDetail",pMap);
		logger.info("bList:"+bList.size());
		return bList;
	}
	//글수정
	public int boardUPD(Map<String, Object> pMap) {
		logger.info("boardUPD 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.update("boardUPD",pMap);
		logger.info("result:"+result);
		return result;
	}
//글삭제
	public int boardDEL(Map<String, Object> pMap) {
		logger.info("boardDEL 호출 성공"+pMap.get("bm_no"));
		int result = 0;
		System.out.println(pMap.get("bm_no"));
		result = sqlSessionTemplate.update("boardDEL",pMap);
		logger.info("result:"+result);
		return result;
	}
	//댓글삭제
	public int replyDEL(Map<String, Object> pMap) {
		logger.info("replyDEL 호출 성공"+pMap.get("bm_no"));
		int result = 0;
		result =sqlSessionTemplate.delete("replyDEL",pMap);
		logger.info("result:"+result);
		return result;
	}

}
