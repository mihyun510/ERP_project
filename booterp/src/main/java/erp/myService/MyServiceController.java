package erp.myService;

import java.util.ArrayList;
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
@RequestMapping(value="/myService/*",method = {RequestMethod.GET, RequestMethod.POST})
public class MyServiceController{
	Logger logger = LoggerFactory.getLogger(MyServiceController.class);
	String requestName = null;
	
	@Autowired(required=false)
	private MyServiceLogic myServiceLogic = null;
	
	@Autowired(required=false)
	HttpSession session = null;
	String path = null;
	
	@PostMapping("myGoWork")
	public String myGoWork(@RequestParam Map<String,Object> pMap, Model model) {
		//출근버튼 눌렀을때
		logger.info("MyService => 출근버튼 실행");
			/////////////////////// 실제 코드    /////////////////////
		pMap.put("emp_no", session.getAttribute("emp_no"));
		pMap.put("btn_type","출근");
		String result = myServiceLogic.myGoWork(pMap);
		logger.info("출근 버튼 성공 여부 :"+result);
		if(result.equals("1")) {
				path="redirect:empCommute.jsp";
				System.out.println(path);
		}else {
				path="errorPage.jsp";
		}
			return path;
		}
	
	@PostMapping("myGoHome")
	public String myGoHome(@RequestParam Map<String,Object> pMap) { 
		//퇴근버튼 눌렀을때
		logger.info("MyService => 퇴근버튼 실행");
		/////////////////////// 실제 코드    /////////////////////
		pMap.put("emp_no", session.getAttribute("emp_no"));
		pMap.put("btn_type","퇴근");
		String result=myServiceLogic.myGoHome(pMap);
		if(result.equals("1")) {path="redirect:empCommute.jsp";}
		else {path="redirect:errorPage.jsp";}
		return path;
	}
		
	@GetMapping("myGoOut")
	public String myGoOut(@RequestParam Map<String,Object> pMap) {
		//외출버튼 눌렀을 때
		logger.info("MyService => 외출버튼 실행");
		/////////////////////// 실제 코드    /////////////////////
		pMap.put("emp_no", session.getAttribute("emp_no"));
		pMap.put("btn_type","외출");
		String result = myServiceLogic.myGoOut(pMap);
		if(result.equals("1")) {path="redirect:empCommute.jsp";}
		else {path="redirect:error.jsp";}
		return path;
	}
		
	@GetMapping("myComBack")
	public String myComBack (@RequestParam Map<String,Object> pMap) {
		//외출복귀버튼 눌렀을 때
		logger.info("MyService => 외출복귀버튼 실행");
		/////////////////////// 실제 코드    /////////////////////
		pMap.put("emp_no", session.getAttribute("emp_no"));
		pMap.put("btn_type","외출복귀");
		String result = myServiceLogic.myComBack(pMap);
		if(result.equals("1")) {path="redirect:empCommute.jsp";}
		else {path="redirect:errorPage.jsp";}
		return path;
		///////////////////////  테스트 코드   /////////////////////
	}
			
	@GetMapping("myAddSchedule")
	public String myAddSchedule(@RequestParam Map<String,Object> pMap ) {
		//내 일정 내용 추가
		logger.info("MyService => 내 일정 추가 실행");
		/////////////////////// 실제 코드    /////////////////////
		pMap.put("emp_no", session.getAttribute("emp_no"));
		for(int i=0; i<pMap.size(); i++) {
			String key = (String)pMap.keySet().toArray()[i];
			//logger.info(key);
			logger.info(key+"="+pMap.get(key));
		}
		
		logger.info("pMap.size()===>"+pMap.size());
		String result = myServiceLogic.myAddSchedule(pMap);
		if(result.equals("1")) {path="redirect:empSchedule.jsp";}
		else {path="redirect:errorPage.jsp";}
		return path;
	}
			///////////////////////  테스트 코드   /////////////////////
			/*
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("emp_no", 10001);
			pMap.put("my_title", "일정 제목");
			pMap.put("my_memo", "메모 내용");
			pMap.put("my_sdate", "2020-06-22 18:00");
			pMap.put("my_edate", "2020-06-22 19:00");
			pMap.put("my_type", "개인일정");
			pMap.put("my_allday", "false");
			pMap.put("my_bgcolor", "#ffdd33");
			String result = myServiceLogic.myAddSchedule(pMap);
			System.out.println("일정등록 성공 여부=>"+result);
			if(result.equals("1")) {
				path="redirect:xxx.jsp";
				System.out.println(path);
			}else {
				path="errorPage.jsp";
			}
			*/
	@GetMapping("myUpdSchedule")
	public String myUpdSchedule(@RequestParam Map<String,Object> pMap) {
		//내 일정 내용 수정
		logger.info("MyService => 내 일정 변경 실행");
		/////////////////////// 실제 코드    /////////////////////	
		pMap.put("emp_no", session.getAttribute("emp_no"));
		for(int i=0; i<pMap.size(); i++) {
			String key = (String)pMap.keySet().toArray()[i];
			//logger.info(key);
			logger.info(key+"="+pMap.get(key));
		}
		logger.info("pMap.size()===>"+pMap.size());
		String result=myServiceLogic.myUpdSchedule(pMap);
		if(result.equals("1")) {path="redirect:empSchedule.jsp";}
		else {path="redirect:errorPage.jsp";}
		
		return path;
		///////////////////////  테스트 코드   /////////////////////
		/*
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("emp_no", 10002);
		pMap.put("my_title", "일정 제목1");
		pMap.put("my_memo", "메모 내용1");
		pMap.put("my_sdate", "2020-06-22 13:00");
		pMap.put("my_edate", "2020-06-22 14:00");
		pMap.put("my_type", "개인일정");
		pMap.put("my_allday", "false");
		pMap.put("my_bgcolor", "#ffdd33");
		pMap.put("my_no", "2");
		String result=myServiceLogic.myUpdSchedule(pMap);
		System.out.println("일정수정 성공 여부=>"+result);
		if(result.equals("1")) {
			path="redirect:xxx.jsp";
			System.out.println(path);
		}else {
			path="redirect:errorPage.jsp";
		}
		*/
	}
			
	@GetMapping("myDelSchedule")
	public String myDelSchedule(@RequestParam Map<String,Object> pMap,Model model) {
		//내 일정 삭제
		logger.info("MyService => 내 일정 삭제 실행");
		/////////////////////// 실제 코드    /////////////////////
		pMap.put("emp_no", session.getAttribute("emp_no"));
		int del_result = myServiceLogic.myDelSchedule(pMap);
		//pMap.put("my_no", req.getParameter("my_no"));이거때문에 오류뜸
		if(del_result==1) {path="redirect:empSchedule.jsp";}
		else {path="redirect:errorPage.jsp";}
		return path;
	}
	
	@GetMapping("myAddScheduleAndroid")
	public String myAddScheduleAndroid(@RequestParam Map<String,Object> pMap, Model model) {
		//내 일정 내용 추가
		logger.info("MyService => 내 일정 추가 실행");
		//pMap.put("emp_no", session.getAttribute("emp_no"));
		for(int i=0; i<pMap.size(); i++) {
			String key = (String)pMap.keySet().toArray()[i];
			//logger.info(key);
			logger.info(key+"="+pMap.get(key));
		}
		logger.info("pMap.size()===>"+pMap.size());
		String result = myServiceLogic.myAddScheduleAndroid(pMap);
		if(result.equals("1")) {
			path="redirect:empSchedule.jsp";
		}
		else {
			path="redirect:errorPage.jsp";
			}
		return path;
	}	
	
	@GetMapping("myUpdScheduleAndroid")
	public String myUpdScheduleAndroid(@RequestParam Map<String,Object> pMap, Model model) {
		//내 일정 내용 수정
		logger.info("MyService => 내 일정 변경 실행");
		//pMap.put("emp_no", session.getAttribute("emp_no"));
		for(int i=0; i<pMap.size(); i++) {
			String key = (String)pMap.keySet().toArray()[i];
			//logger.info(key);
			logger.info(key+"="+pMap.get(key));
		}
		logger.info("pMap.size()===>"+pMap.size());
		String result=myServiceLogic.myUpdScheduleAndroid(pMap);
		if(result.equals("1")) {
			return "redirect:empSchedule.jsp";
		}
		else {
			return "redirect:errorPage.jsp";
		}
	}	
	
	@GetMapping("myDelScheduleAndroid")
	public String myDelScheduleAndroid(@RequestParam Map<String,Object> pMap, Model model) {
		//내 일정 삭제
		logger.info("MyService => 내 일정 삭제 실행");
		//pMap.put("emp_no", session.getAttribute("emp_no"));
		//pMap.put("my_no", req.getParameter("my_no"));
		int del_result = myServiceLogic.myDelScheduleAndroid(pMap);
		
		if(del_result==1) {
			return "redirect:empSchedule.jsp";
		}
		else {
			return "redirect:errorPage.jsp";
		}
	}	
	
	@GetMapping("inOutManager")
	public String inOutManager(@RequestParam Map<String,Object> pMap, Model model) {
	//////////////////////////////////////////////////////// forward 지역 /////////////////////////////////////////////////////////////////////
		//출퇴관리 insert here
		logger.info("MAV => 출퇴관리 실행");
		pMap.put("emp_no", session.getAttribute("emp_no")); 
		//pMap.put("emp_no", 10002);
		List<Map<String,Object>> todayInOutList = new ArrayList<>();
		todayInOutList = myServiceLogic.inOutManager(pMap);
		logger.info("오늘 출퇴관리탭 리스트"+todayInOutList.size());
		model.addAttribute("todayInOutList", todayInOutList);
		return "forward:empCommute.jsp";
	}
//		//////////////주간 근무시간 chart json 수정 ///////
//		else if("weekChart".equals(requestName)) {
//		logger.info("MAV => 출퇴관리 실행");
//		pMap = HashMapBuilder.hashMapBuilder(req.getParameterMap());
//		pMap.put("emp_no", session.getAttribute("emp_no")); 
//			//이건 뭐지..? 주간 차트를 말하는 건가..?
//			List<Map<String,Object>> weekInOutList = new ArrayList<>();
//			weekInOutList = myServiceLogic.weekInOutInfo(pMap);
//			System.out.println("주간 출퇴관리탭 리스트"+weekInOutList.size());
//			req.setAttribute("weekInOutList", weekInOutList);
//			path="forward:jsonWeekChart.jsp";
//		}
//		//개인일정chart json 파일//////////////////////////////////////
//		else if("myScheduleChart".equals(requestName)) {
//			//개인일정 insert here
//			logger.info("MAV => 개인일정 실행");
//			pMap = new HashMap<>();
//			pMap.put("emp_no", session.getAttribute("emp_no")); 
//			List<Map<String,Object>> rList = myServiceLogic.mySchedule(pMap);
//			System.out.println("개인일정 리스트 => "+rList.size());
//			req.setAttribute("myScheduleChart", rList);
//			path="forward:jsonMyScheduleChart.jsp";
//		}
	
	@GetMapping("monthPay")
	public String monthPay(@RequestParam Map<String,Object> pMap, Model model) {
		//당월급여 insert here
		logger.info("MAV => 당월급여 실행");
		pMap.put("emp_no", session.getAttribute("emp_no")); 
		List<Map<String,Object>> monthPayList = myServiceLogic.monthPay(pMap);
		logger.info("당월급여 조회  => "+monthPayList.size());
		model.addAttribute("monthPayList", monthPayList);
		path = "forward:empSalDetail.jsp";
		return path;
	}
		
	@GetMapping("allPay")
	public String allPay(@RequestParam Map<String,Object> pMap, Model model) {
		//전체급여 insert here
		logger.info("ALLPAY => 전체급여 실행");
		pMap.put("emp_no", session.getAttribute("emp_no")); 
		//실제
		List<Map<String,Object>> allPayList = myServiceLogic.allPay(pMap);
		logger.info("전체급여 조회  => "+allPayList.size());
		model.addAttribute("allPayList",allPayList );
		path="forward:empSal.jsp";
//		else if("mySchedule".equals(requestName)) {
//			//개인일정 insert here
//			logger.info("MAV => 개인일정 실행");
//			pMap = new HashMap<>();
//			pMap.put("emp_no", session.getAttribute("emp_no")); 
//			//pMap.put("my_day", "2020-06-01");//테스트
//			pMap.put("my_day", req.getParameter("my_day")); //실제
//			List<Map<String,Object>> rList = myServiceLogic.mySchedule(pMap);
//			System.out.println("개인일정 리스트 => "+rList.size());
//			req.setAttribute("myScheduleList", rList);
//			path="forward:jsonMySchedule.jsp";
//		}
		return path;
	}

	@GetMapping("myGoWorkAnd")
	public String myGoWorkAnd(@RequestParam Map<String,Object> pMap, Model model) { //update 상태컬럼 : 정상 -> 외출
		//안드 로그인 성공했을 때
		logger.info("MyService => 출근버튼 실행");
		/////////////////////// 실제 코드    /////////////////////
		pMap = myServiceLogic.gowork();
		String imsi = pMap.get("DL_LATITUDE").toString()+","+pMap.get("DL_LONGITUDE").toString()+","+pMap.get("DL_NAME");
		model.addAttribute("imsi", imsi);
		if(pMap.size()!=0) {path="forward:work.jsp";}
		else {path="redirect:error.jsp";}
		return path;
		
		///////////////////////  테스트 코드   /////////////////////
		/*
		pMap = new HashMap<>();
		pMap.put("emp_no",10006);
		pMap.put("btn_type","외출");
		String result = myServiceLogic.myGoOut(pMap);
		System.out.println("외출버튼 성공 여부 :"+result);
		if(result.equals("1")) {
			path="redirect:xxx.jsp";
			System.out.println(path);
		}else {
			path="errorPage.jsp";
		}
		*/
	}	
	
	@GetMapping("GoWorkAndBtn")
	public String GoWorkAndBtn (@RequestParam Map<String, Object> pMap, Model model) { //insert 출근테이블에 오늘 출근 row추가
		//안드로이드 출근버튼 눌렀을때
		logger.info("MyService => 안드로이드 출근버튼 실행");
		/////////////////////// 실제 코드    /////////////////////
		String result = myServiceLogic.myGoWork(pMap);
		System.out.println("출근 버튼 성공 여부 :"+result);
		return "redirect:androidWork.jsp?result="+result;
		
	}
	
	
	@GetMapping("weekChart")
	public String weekChart(@RequestParam Map<String,Object> pMap, Model model) {
//////////////주간 근무시간 chart json 수정 ///////
		logger.info("MAV => 출퇴관리 실행");
		pMap.put("emp_no", session.getAttribute("emp_no")); 
		//이건 뭐지..? 주간 차트를 말하는 건가..?
		List<Map<String,Object>> weekInOutList = new ArrayList<>();
		weekInOutList = myServiceLogic.weekInOutInfo(pMap);
		logger.info("주간 출퇴관리탭 리스트"+weekInOutList.size());
		model.addAttribute("weekInOutList", weekInOutList);
		return "myService/jsonWeekChart";
	}
	
	@GetMapping("myScheduleChart")
	public String myScheduleChart(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("MAV => 개인일정 실행");
		pMap.put("emp_no", session.getAttribute("emp_no")); 
		//pMap.put("emp_no", 10001); 
		List<Map<String,Object>> rList = myServiceLogic.myScheduleChart(pMap);
		for(int i=0; i<pMap.size(); i++) {
			String key = (String)pMap.keySet().toArray()[i];
			//logger.info(key);
			logger.info(key+"="+pMap.get(key));
		}
		logger.info("개인일정차트 리스트 => "+rList.size());
		model.addAttribute("myScheduleChart", rList);
		return "myService/jsonMyScheduleChart";
	}
	
	//개인일정달력 select json
	@GetMapping("mySchedule")
	public String mySchedule(@RequestParam Map<String,Object> pMap, Model model) {
		//개인일정 insert here
		logger.info("MAV => 개인일정달력 실행");
		pMap.put("emp_no", session.getAttribute("emp_no")); 
		List<Map<String,Object>> rList = myServiceLogic.mySchedule(pMap);
		System.out.println("개인일정 리스트 => "+rList.size());
		model.addAttribute("myScheduleList", rList);
		return "myService/jsonMySchedule";
	}
	
	@GetMapping("myScheduleAndroid")
	public String myScheduleAndroid(@RequestParam Map<String, Object> pMap, Model model) {
        //개인일정 insert here
        logger.info("MAV => 개인일정달력 실행");
        List<Map<String,Object>> rList = myServiceLogic.myScheduleAndroid(pMap);
        System.out.println("개인일정안드로이드 리스트 => "+rList.size());
        model.addAttribute("myScheduleList", rList);
        return "myService/jsonMySchedule";
     }
	
}
