package com.erp;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class BoardController implements Controller {
	String requestName = null;
	BoardLogic boardLogic = null;
	Logger logger = Logger.getLogger(BoardController.class);
	
	public BoardController(String requestName) {
		logger.info("BoardController 호출 성공");
		this.requestName = requestName;
		boardLogic = new BoardLogic();
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path =null;
		HttpSession session = req.getSession();
		Map<String,Object> pMap = null;
		
		//글쓰기를 눌렀을때
		 if("boardINS".equals(requestName)) {
			 logger.info("BoardController boardINS호출 성공");
			 Calendar cal = Calendar.getInstance();
			int year = cal.get ( cal.YEAR );
			int month = cal.get ( cal.MONTH ) + 1 ;
			int day = cal.get ( cal.DATE ) ;
			String date = year+"-"+month+"-"+day;
			int result =0; 
			
			 pMap = HashMapBuilder.hashMapBuilder(req.getParameterMap());
			 pMap.put("emp_no", session.getAttribute("emp_no"));
			 pMap.put("bm_date", date);
			result = boardLogic.boardINS(pMap);
			if(result==1) path="redirect:boardInsOk.jsp";
			else if(result ==0) path="redirect:boardInsFail.jsp";
		}
		 
		 //댓글쓰기를 눌렀을때
		 else if("boardINSReply".equals(requestName)) {
			 logger.info("BoardController boardINSReply호출 성공");
			 Calendar cal = Calendar.getInstance();
			 int year = cal.get ( cal.YEAR );
			 int month = cal.get ( cal.MONTH ) + 1 ;
			 int day = cal.get ( cal.DATE ) ;
			 String date = year+"-"+month+"-"+day;
			 int result =0; 
			 
			 //pMap = HashMapBuilder.hashMapBuilder(req.getParameterMap());
			 pMap = new HashMap<String, Object>();
			 pMap.put("emp_no", session.getAttribute("emp_no"));
			 pMap.put("bm_no", req.getParameter("bm_no"));
			 System.out.println("controllerbm_no: "+req.getParameter("bm_no"));
			 pMap.put("bm_title", req.getParameter("bm_title"));
			 System.out.println("controllertitle: "+req.getParameter("bm_title"));
			 pMap.put("bm_pos", req.getParameter("bm_pos"));
			 pMap.put("bm_group", req.getParameter("bm_group"));
			 System.out.println("controllerbm_group: "+req.getParameter("bm_group"));
			 pMap.put("bm_date", date);
			 pMap.put("bm_content", "댓글");
			 pMap.put("bm_hit", 0);
			 result = boardLogic.boardINS(pMap);
			 if(result==1) {
				 req.setAttribute("boardListReply", pMap);
				 path="forward:boardListReply.erp?cud=boardListReply";
			 }
			 else if(result ==0) path="redirect:boardInsFail.jsp";
		 }
		 
		//너 수정하려구?
			else if("boardUPD".equals(requestName)) {
				int result =0;
				pMap = new HashMap<>();
				pMap.put("emp_no", session.getAttribute("emp_no"));
				pMap.put("bm_no", req.getParameter("bm_no"));
				pMap.put("bm_title", req.getParameter("bm_title"));
		        pMap.put("bm_content", req.getParameter("bm_content"));
//	            pMap.put("bs_file", req.getParameter("bs_file"));
//	            pMap.put("bs_size", req.getParameter("bs_size"));
				result = boardLogic.boardUPD(pMap);
				if(result==1) path="redirect:boardUpdOk.jsp";
				else if(result ==0) path="redirect:boardUpdFail.jsp";			
			}
			//너 글 삭제하려구?
			else if("boardDEL".equals(requestName)) {
				System.out.println("삭제 보드 컨트롤러 호출 성공");
				int result =0;
				int sresult = 0;
				int rresult = 0;
				List<Map<String, Object>> rlist = null;
				pMap = new HashMap<String, Object>();
				pMap.put("emp_no", session.getAttribute("emp_no"));
				pMap.put("bm_no", req.getParameter("bm_no"));
				pMap.put("bm_group", req.getParameter("bm_group"));
				if(req.getParameter("bs_file").equals("첨부된 파일이 없습니다.")) {
					rlist = boardLogic.boardListReply(pMap);
					if(rlist != null && rlist.size()>0) {
						rresult = boardLogic.replyDEL(pMap);
					}
					result = boardLogic.boardDEL(pMap); //게시글삭제
				}else {
					sresult = boardLogic.boardDELFile(pMap); //첨부파일 먼저 삭제
					if(sresult == 1) {
						if(rlist != null && rlist.size()>0) {
							rresult = boardLogic.replyDEL(pMap);
						}
						result = boardLogic.boardDEL(pMap);
					} else if(sresult == 0){
						path="redirect:boardDelFail.jsp";
					}
				}
				if(result==1) path="redirect:boardDelOk.jsp";
				else if(result ==0) path="redirect:boardDelFail.jsp";			
			}
//			첨부파일 업로드 함수 스프링,,,,
//			else if("uploadAction".equals(requestName)) {
//					MultipartFile[] uploadFile = (MultipartFile[]) req.getParameter("bs_file");
//					 pMap = HashMapBuilder.hashMapBuilder(req.getParameterMap());
//					String uploadFolder = "C:\\workspace_project\\pojo\\WebContent\\pds\\";
//					for(MultipartFile mpFile:uploadFile) {
//						logger.info("======================================");
//						logger.info("파일명:"+mpFile.getOriginalFilename());
//						logger.info("파일 크기:"+mpFile.getSize());
//						File saveFile = new File(uploadFolder,mpFile.getOriginalFilename());
//						try {
//							mpFile.transferTo(saveFile);
//						} catch (Exception e) {
//							logger.info(e.getMessage());
//						}
//					}
//					path="./boardWrit";
//				}	
			
		 //너 댓글 삭제하려구?
			else if("replyDEL".equals(requestName)) {
				int result =0;
				pMap = new HashMap<>();
				pMap.put("emp_no", session.getAttribute("emp_no"));
				pMap.put("bm_group", req.getParameter("bm_group"));
				pMap.put("bm_pos", req.getParameter("bm_pos"));
				result = boardLogic.replyDEL(pMap);
				if(result==1) path="redirect:boardDelOk.jsp";
				else if(result ==0) path="redirect:boardDelFail.jsp";			
			}
		
		 //전체조회
		 if("boardList".equals(requestName)) {
				logger.info("BoarController boardList 호출 성공");
				List<Map<String,Object>> mList = null;
				pMap = new HashMap<>();
				pMap.put("emp_no", session.getAttribute("emp_no"));
				mList = boardLogic.boardList(pMap);
				req.setAttribute("boardList", mList);
				path = "forward:./boardList.jsp";//pageMove[]
			}
		
		//너 제목을 클릭했을때? 상세조회
		 else if("boardDetail".equals(requestName)){
				List<Map<String,Object>> mList = null;
				List<Map<String,Object>> rList = null;
				 pMap = new HashMap<>();
				 pMap.put("bm_no",Integer.parseInt(req.getParameter("bm_no")));
				 pMap.put("bm_group",req.getParameter("bm_group"));
				 System.out.println("bm_group:"+req.getParameter("bm_group"));
				 int result = boardLogic.hitCount(pMap);
				 if(result == 1) {
					 mList = boardLogic.boardListDetail(pMap);
					 req.setAttribute("boardDetail", mList);
					 rList = boardLogic.boardListReply(pMap);
					 req.setAttribute("boardListReply", rList);
					 path = "forward:./boardReadForm.jsp";
				 }else {
					 path = "redirect:./boardList.erp";
				 }
			}
		return path;
	}

	@Override
	public ModelAndView process(String cud,HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
			ModelAndView mav = new ModelAndView(req,res);
			HttpSession session = req.getSession();
			Map<String, Object> pMap = null;
			 //댓글가져오기
			if("boardListReply".equals(cud)) {
				 logger.info("BoardController boardListReply호출 성공");
				 Map<String, Object> rMap = new HashMap<String, Object>();
				 rMap =(Map<String, Object>) req.getAttribute("boardListReply");
				 //rMap = HashMapBuilder.hashMapBuilder(req.getParameterMap());
				 List<Map<String, Object>> rList = null;
				 rList = boardLogic.boardListReply(rMap);
				 mav.addObject("boardListReply", rList);
				 mav.setViewName("jsonboardListReply");
			 }
			return mav;
		}
}
