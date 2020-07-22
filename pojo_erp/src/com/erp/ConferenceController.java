package com.erp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class ConferenceController implements Controller {
	String requestName = null;
	ConferenceLogic conLogic = null;
	Logger logger = Logger.getLogger(ConferenceController.class);
	
	public ConferenceController(String requestName) {
		logger.info("ConferenceController 호출 성공");
		this.requestName = requestName;
		conLogic = new ConferenceLogic();
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path =null;
		HttpSession session = req.getSession();
		if(requestName.equals("conAddRoom")) {//insert
			//회의실예약 insert here
			logger.info("ConferenceController[String] => 회의실예약 호출");
			/////////////////////// 실제 코드    /////////////////////
			Map<String,String[]> myMap = (Map<String,String[]>)req.getParameterMap();
			Map<String,Object> pMap= HashMapBuilder.hashMapBuilder(myMap);
			pMap.put("emp_no", session.getAttribute("emp_no"));
			String result=conLogic.conAddRoom(pMap);
			if(result.equals("1")) path="redirect:conference.jsp"; 
			else path="redirect:conferenceInserror.jsp"; 
			
			///////////////////////  테스트 코드   /////////////////////
			/*
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("emp_no",10001);
			pMap.put("cfr_title","안녕 테스트");
			pMap.put("cfr_sdate","2020-06-22");
			pMap.put("cfr_edate","2020-06-22");
			pMap.put("cfr_type","제1회의실");
			pMap.put("cfr_allday","true");
			pMap.put("cfr_bgcolor","#ffddaa");
			pMap.put("cfr_memo","메모내용입니다.");
			String result=conLogic.conAddRoom(pMap);
			System.out.println("회의실예약 성공 여부 :"+result);
			if(result.equals("1")) {
				path="redirect:xxx.jsp";
			}else {
				path="redirect:errorPage.jsp";
			}
			*/
		}else if(requestName.equals("conUpdRoom")) {//delete
			//회의실예약수정 insert here
			logger.info("ConferenceController[String] => 회의실예약수정 호출");
			/////////////////////// 실제 코드    /////////////////////
			Map<String,Object> pMap= HashMapBuilder.hashMapBuilder(req.getParameterMap());
			pMap.put("emp_no", session.getAttribute("emp_no"));
			String result =conLogic.conUpdRoom(pMap);
			if(result.equals("1")) path="redirect:conference.jsp"; 
			else path="redirect:conferenceUpderror.jsp"; 
			
			///////////////////////  테스트 코드   /////////////////////
			/*
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("emp_no",10001);
			pMap.put("cfr_title","안녕 테스트2");
			pMap.put("cfr_sdate","2020-06-22");
			pMap.put("cfr_edate","2020-06-22");
			pMap.put("cfr_type","제1회의실");
			pMap.put("cfr_allday","true");
			pMap.put("cfr_bgcolor","#ffddaa");
			pMap.put("cfr_no","5");
			pMap.put("cfr_memo","메모내용입니다.");
			String result =conLogic.conUpdRoom(pMap);
			System.out.println("회의실예약 변경 여부 :"+result);
			if(result.equals("1")) {
				path="redirect:xxx.jsp";
			}else {
				path="redirect:errorPage.jsp";
			}
			*/
		}
		else if(requestName.equals("conDelRoom")) {//delete
			//회의실예약취소 insert here
			logger.info("ConferenceController[String] => 회의실예약취소 호출");
			/////////////////////// 실제 코드    /////////////////////
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("emp_no", session.getAttribute("emp_no"));
			pMap.put("cfr_no", req.getParameter("cfr_no"));
			for(int i=0; i<pMap.size(); i++) {
				String key = (String)pMap.keySet().toArray()[i];
				logger.info(key+"="+pMap.get(key));
			}
			int del_res=conLogic.conDelRoom(pMap);
			System.out.println("회의실삭제 여부 :"+del_res);
			if(del_res==1) path="redirect:conference.jsp"; 
			else path="redirect:conferenceDelerror.jsp"; 
		}		
			///////////////////////  테스트 코드   /////////////////////
			/*
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("emp_no",10001);
			pMap.put("cfr_no",4);
			int del_res=conLogic.conDelRoom(pMap);
			System.out.println("회의실 취소 여부 :"+del_res);
			if(del_res==1) {
				path="redirect:xxx.jsp";
			}else {
				path="redirect:errorPage.jsp";
			}
			*/
//		}else if("allRes".equals(requestName)) {
//			//회의실예약 insert here
//			logger.info("ConferenceController[String] => 회의실예약탭  호출");
//			Map<String,Object> pMap = new HashMap<>();
//			pMap.put("cfr_day", "2020-06-01");//테스트
//			//pMap.put("cfr_day", req.getParameter("cfr_day"));  실제
//			List<Map<String,Object>> allResList = new ArrayList<>();
//			allResList = conLogic.allRes(pMap);
//		    System.out.println("회의실예약 리스트 => "+allResList.size());
//			req.setAttribute("allResList", allResList);
//			path="forward:xxx.jsp";
//		}
		return path;
	}

	@Override
	public ModelAndView process(String cud,HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
			ModelAndView mav = new ModelAndView(req,res);
			HttpSession session = req.getSession();
			if("allRes".equals(cud)) {
				//회의실예약 insert here
				logger.info("ConferenceController[String] => 회의실예약탭  호출");
				Map<String,Object> pMap = new HashMap<>();
				List<Map<String,Object>> allResList = new ArrayList<>();
				allResList = conLogic.allRes(pMap);
			    System.out.println("회의실예약 리스트 => "+allResList.size());
			    mav.addObject("allResList", allResList);
				mav.setViewName("jsonConferenceList");
			}
			
			
			return mav;
		}
}
