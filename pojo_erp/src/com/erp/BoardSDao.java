package com.erp;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

public class BoardSDao {
	Logger logger = Logger.getLogger(BoardSDao.class);
	public SqlSessionFactory sqlMapper = null;
	public SqlSession sqlSec = null;
	
	public BoardSDao() {
		logger.info("BoardSDao() 호출 성공"); 
		sqlMapper= MyBatisCommonFactory.getSqlSessionFactory();
		sqlSec = sqlMapper.openSession();
	}
	
	public int boardSINS(Map<String, Object> pMap) {
		logger.info("baordSDao boardSINS 호출 성공");
		int result = 0;
		//bm_no, bs_seq - 상수,  bs_file, bs_size -Logic
		result = sqlSec.insert("boardSINS",pMap);
		logger.info("result:"+result);
		sqlSec.commit(true);		
		return result;
	}

	public int boardDELFile(Map<String, Object> pMap) {
		logger.info("baordSDao boardSINS 호출 성공");
		int result = 0;
		//bm_no, bs_seq - 상수,  bs_file, bs_size -Logic
		result = sqlSec.delete("boardSDEL",pMap);
		logger.info("result:"+result);
		sqlSec.commit(true);		
		return result;
	}
}
