package erp.board;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardSDao {
	Logger logger = LoggerFactory.getLogger(BoardSDao.class);
	@Autowired(required = false)
	public SqlSessionTemplate sqlSessionTemplate = null;
	
	public int boardSINS(Map<String, Object> pMap) {
		logger.info("baordSDao boardSINS 호출 성공");
		int result = 0;
		//bm_no, bs_seq - 상수,  bs_file, bs_size -Logic
		result = sqlSessionTemplate.insert("boardSINS",pMap);
		logger.info("result:"+result);
		return result;
	}

	public int boardDELFile(Map<String, Object> pMap) {
		logger.info("baordSDao boardDELFile 호출 성공");
		int result = 0;
		//bm_no, bs_seq - 상수,  bs_file, bs_size -Logic
		result = sqlSessionTemplate.delete("boardSDEL",pMap);
		logger.info("result:"+result);
		return result;
	}
}
