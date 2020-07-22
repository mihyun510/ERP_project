package com.example.demo;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/main/*",method={RequestMethod.GET, RequestMethod.POST})
public class EmpController {
	Logger logger = LoggerFactory.getLogger(EmpController.class);
	
	@Autowired(required=false)
	HttpSession session  =null;
	
	@Autowired(required=false)
	private EmpLogic empLogic = null; 
	
	int result = 0;
	String path = null;
	
	@PostMapping("login")
	public String login(@RequestParam Map<String, Object> pMap, Model model) { 
	String path = null;
	String ip  = null;
	try {
		InetAddress local = InetAddress.getLocalHost();
		ip =  local.getHostAddress();
	}catch (Exception e) {
		e.printStackTrace();
	}
		logger.info("EmpController => 로그인 호출");
		/////////////////////// 실제 코드    /////////////////////
		List<Map<String,Object>> list = new ArrayList<>();
		pMap.put("myIp", ip);
		list =empLogic.login(pMap);
		logger.info("list: "+list);
		
		String emp_name =list.get(0).get("EMP_NAME").toString();
		logger.info("emp_name : " + emp_name);
		if(list.get(0).containsKey("DEPT_NAME")) {
			String dept_name =list.get(0).get("DEPT_NAME").toString();
			logger.info("부서명 =>"+dept_name);
			session.setAttribute("dept_name",dept_name);
		}
		//logger.info("emp_name: "+"안영재");
		session.setAttribute("emp_name",emp_name);
		
		if("비밀번호가 틀립니다".equals(emp_name)){
			path = "redirect:./login.jsp?msg="+1;
		}
		else if("아이디가 없습니다".equals(emp_name)) {
			System.out.println("아이디가 없습 니다.");
			path = "redirect:./login.jsp?msg="+2;
		}
		else {
			logger.info("메인페이지 호출");
			String emp_no =list.get(0).get("EMP_NO").toString();
			session.setAttribute("emp_no",emp_no);
			List<Map<String,Object>> taskTimeList = empLogic.commuteList(pMap);
			logger.info("오늘 업무시간 리스트 => "+taskTimeList.size());
			model.addAttribute("taskTimeList", taskTimeList);
			path="forward:main.jsp";
		}
			return path;
		}
	@PostMapping("loginAnd")
	public String loginAnd(@RequestParam Map<String,Object> pMap,Model model) {
		logger.info("EmpController => 로그인 호출");
		/////////////////////// 실제 코드    /////////////////////
		List<Map<String,Object>> rList = new ArrayList<>();
		rList =empLogic.loginAnd(pMap);
		System.out.println("rList: "+rList);
		String path = null;
		String emp_no =rList.get(0).get("EMP_NO").toString();
		String emp_name =rList.get(0).get("EMP_NAME").toString();
		String dept_name =rList.get(0).get("DEPT_NAME").toString();
		String emp_pos =rList.get(0).get("EMP_POSITION").toString();
		String emp_photo =rList.get(0).get("EMP_PHOTO").toString();
		String lofo = emp_no.trim()+","+emp_pos.trim()+","+emp_photo;
		System.out.println("emp_name: "+emp_name);
		
		if("비밀번호가 틀립니다".equals(emp_name)||"아이디가 없습니다".equals(emp_name)){
			model.addAttribute("emp_no", "0");
			path="forward:./loginand.jsp";
		}else {
			
			logger.info("메인페이지 호출");
			model.addAttribute("emp_no", lofo);
			path="forward:./loginand.jsp";
		}
		return path;
		
		}
		@PostMapping("inoutListAndroid")
		public String inoutListAndroid(@RequestParam Map<String,Object> pMap,Model model) {
			String path = null;
			List<Map<String,Object>> inoutList = empLogic.inoutList(pMap);
			System.out.println("오늘 출근 리스트 사이즈 => "+inoutList.size());
			StringBuilder sb = new StringBuilder();
	         for(int i=0; i<inoutList.size();i++) {
	             Map<String,Object> rMap = inoutList.get(i);
	             if(i==inoutList.size()-1) {
	                sb.append(rMap.get("TIME"));
	             }else {
	             sb.append(rMap.get("TIME")+",");
	             }
	          }
			model.addAttribute("result", sb.toString());
			return "forward:./androidResult.jsp";
		}

		@GetMapping("reMain")
		public String reMain(@RequestParam Map<String, Object> pMap, Model model) {
			logger.info("EmpController =>  remain 호출");
			pMap.put("emp_no", session.getAttribute("emp_no"));
			List<Map<String,Object>> taskTimeList = empLogic.reMain(pMap);
			logger.info("오늘 업무시간 리스트 => "+taskTimeList.size());
			model.addAttribute("taskTimeList", taskTimeList);
			return "forward:main.jsp";
		}
		
		@GetMapping("myUpdImformation")
		 public String myUpdImformation(@RequestParam Map<String,Object> pMap) {
			logger.info("EmpController => 내정보 수정 저장 버튼 호출"); ////////////////저장 버튼 눌렀을 때
			/////////////////////// 실제 코드    /////////////////////
			String path=null;
			pMap.put("emp_no", session.getAttribute("emp_no"));
		/*
		 * pMap.put("emp_no", 30007); pMap.put("emp_photo", "test1.jpg");
		 * pMap.put("emp_pw", "1234"); pMap.put("emp_phone", "010-1234-5678");
		 * pMap.put("emp_email", "test11@naver.com"); pMap.put("emp_address",
		 * "경기도 안산시 단원구 103번지");
		 */
			result =empLogic.myUpdImformation(pMap);
			logger.info("회원정보 등록 성공 여부- result: "+result);
			if(result == 1) path="redirect:login.jsp"; 
				else if(result == 0) path ="redirect:main.jsp"; 
				return path;
		 }
		
		@GetMapping("newPassword")
	 	public String newPassword(@RequestParam Map<String,Object> pMap) {
			logger.info("EmpController => 비밀번호 변경 검증");
			/////////////////////// 실제 코드    /////////////////////
			//pMap.put("emp_no", session.getAttribute("emp_no"));
			//pMap.put("emp_no", 30007);
			//pMap.put("emp_pw", 1234);
			//pMap.put("new_pw", 123);
			//pMap.put("new_repw", 123);
			pMap.put("emp_no", session.getAttribute("emp_no"));
			String new_pw =empLogic.newPassword(pMap);
			System.out.println(new_pw);
			if(new_pw.equals("일치")){
				path = "redirect:success.jsp"; 
			}
			else {
				path = "redirect:fail.jsp"; 
			}
			return path;
		}
		
		@GetMapping("emp_edit")
	 	public String emp_edit(@RequestParam Map<String,Object> pMap,Model model) {
	 		logger.info("내 정보수정 호출");
			pMap.put("emp_no", session.getAttribute("emp_no"));
			List<Map<String,Object>> myInfoList = empLogic.myInfoMap(pMap);
			logger.info("내정보 리스트 사이즈 =>"+myInfoList.size());
			logger.info("myInfoList: "+myInfoList);
			model.addAttribute("myInfoList", myInfoList);
			return "forward:emp_edit.jsp";
		}
		
		@GetMapping("roomList")
		public String roomList(@RequestParam Map<String,Object> pMap,Model model) {
		///메인 페이지 json
		List<Map<String,Object>> roomList = empLogic.roomList(pMap);
		logger.info("오늘 회의실 예약 리스트 => "+roomList.size());
		model.addAttribute("roomList", roomList);
		return "main/jsonRoomList"; //main/jsonRoomList
		}
		
		@GetMapping("inoutList")
		public String inoutList(@RequestParam Map<String,Object> pMap, Model model) {
			pMap.put("emp_no", session.getAttribute("emp_no"));
			List<Map<String,Object>> inoutList = empLogic.inoutList(pMap);
			logger.info("오늘 출근 리스트 사이즈 => "+inoutList.size());
			model.addAttribute("inOutList", inoutList);
			return "main/jsonInOutList";
		}
		
	
}
