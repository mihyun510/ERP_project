package com.erp;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class BoardLogic {
	BoardMDao boardMDao = null;
	BoardSDao boardSDao = null;
	Logger logger = Logger.getLogger(BoardLogic.class);
	
	public BoardLogic() {
		logger.info("BoardLogic 호출 성공");
		boardMDao = new BoardMDao();
		boardSDao = new BoardSDao();
	}

	/////////////////////////글쓰기 진행///////////////////////////////
	public int boardINS(Map<String, Object> pMap) {
		 logger.info("BoardLogic boardINS호출 성공");
		logger.info("boardINS 호출 성공");
		int result = 0;
		int bm_no = 0;
		int bm_group = 0;
		int pbm_no = 0;
		
		//글번호 채번하기
		bm_no = boardMDao.getBmNo(pMap);
		//그룹번호가 있나요?
		//어디서 오셨죠? boardWriteForm.jsp이면 없다, boardReadForm.jsp 이면 있다.
		bm_group = boardMDao.getBmGroup(pMap);
		//예외처리 추가할것. - io사용시 꼭 필요 - 첨부파일
		if(pMap.get("bm_no")!=null) {
			pbm_no = Integer.parseInt(pMap.get("bm_no").toString()); //댓글일만존재
		}
		try {
			//새글인가? 
			if(pbm_no==0) {
				logger.info("새글인가? ==> "+pMap.get("bm_group"));
				pMap.put("bm_no",bm_no);
				//새글이면 그룹번호를 새로 채번해야 합니다.
				pMap.put("bm_group",bm_group);
				pMap.put("bm_pos",0);
			}
			//아님 댓글이야?
			else {
				logger.info("댓글인가? ==> "+pMap.get("bm_group")+", bm_pos:"+pMap.get("bm_pos"));
				boardMDao.bmPosUpdate(pMap);
				pMap.put("bm_no",bm_no);
				if(pMap.get("bm_pos")!=null) {
					pMap.put("bm_pos" ,Integer.parseInt(pMap.get("bm_pos").toString())+1);
				}
			}
			result = boardMDao.boardMINS(pMap);
			//첨부파일이 있을까요?
			if(pMap.get("bs_file")!=null && pMap.get("bs_file").toString().length()>=1) {
				logger.info("첨부파일이 있는 경우");
				int sresult = 0;
				pMap.put("bs_seq",1);
				sresult = boardSDao.boardSINS(pMap);
			}
			//데이터 유효성 체크 코드 추가. XML문서 분석하기
			//크루는 PL로 부터 소스를 받으면 제일 먼저 단위테스트를 수행
			//주의사항:테이블 컬럼을 사용자로 부터 입력받는 값과 개발자끼리만 공유하는 값
			logger.info("bs_file===>"+pMap.get("bs_file"));
			logger.info("bs_size===>"+pMap.get("bs_size"));
			logger.info("bm_no===>"+pMap.get("bm_no"));
			logger.info("bm_group===>"+pMap.get("bm_group"));
			logger.info("bm_pos===>"+pMap.get("bm_pos"));
			logger.info("bm_title===>"+pMap.get("bm_title"));
			logger.info("emp_no===>"+pMap.get("emp_no"));
			logger.info("bm_content===>"+pMap.get("bm_content"));
			
			pMap.put("bm_no",bm_no);
			//첨부파일이 있을때만 bsDao.boardSINS(pMap);
		} catch (Exception e) {
			//라인 번호도 출력됨. - log4j
			e.printStackTrace();//stack메모리에 쌓여있는 로그 히스토리를 출력함.
		}
		return result;
	}
	
	public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
		logger.info("BoardLogic boardList 호출 성공");
		List<Map<String, Object>> bList = new ArrayList<>();
		bList = boardMDao.boardList(pMap);
		return bList;
	}
	
	//댓글가져오기
		public List<Map<String, Object>> boardListReply(Map<String, Object> rMap) {
			logger.info("BoardLogicboardListReply 호출 성공");
			List<Map<String, Object>> bList = new ArrayList<>();
			bList = boardMDao.boardListReply(rMap);
			return bList;
		}
		
	public int hitCount(Map<String, Object> pMap) {
		logger.info("BoardLogic hitCount 호출 성공");
		int result = boardMDao.hitCount(pMap);
		return result;
	}
	
	public List<Map<String, Object>> boardListDetail(Map<String, Object> pMap) {
		logger.info("BoardLogic boardListDetail 호출 성공");
		List<Map<String, Object>> bList = new ArrayList<>();
		bList = boardMDao.boardListDetail(pMap);
		return bList;
	}
	
	public int boardUPD(Map<String, Object> pMap) {
		logger.info("boardUPD 호출 성공");
		int result = 0;
		result = boardMDao.boardUPD(pMap);
		return result;
	}

	public int boardDEL(Map<String, Object> pMap) {
		logger.info("boardDEL 호출 성공");
		int result = 0;
		result = boardMDao.boardDEL(pMap);
		return result;
	}
	
	public int replyDEL(Map<String, Object> pMap) {
		logger.info("replyDEL 호출 성공");
		int result = 0;
		result = boardMDao.replyDEL(pMap);
		return result;
	}

	public int boardDELFile(Map<String, Object> pMap) {
		logger.info("boardDELFile 호출 성공");
		int result = 0;
		result = boardSDao.boardDELFile(pMap);
		return result;
	}

	
	
}
